//+------------------------------------------------------------------+
//|                                  TheWise_Portfolio_Monitor.mq5   |
//|                                  Copyright 2026, Rogerio Ramos   |
//|                                  https://rogerinhoramos.github.io|
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, Rogerio Ramos"
#property link      "https://rogerinhoramos.github.io"
#property version   "1.00"
#property description "Sentinel Monitor: Transmissor de Portfólio MT5 em Tempo Real"

// --- Inputs do Sistema ---
input group "====== CONFIGURAÇÕES SENTINEL ======"
input string   InpServerUrl         = "http://127.0.0.1:5000/api/update"; // URL de Destino do Sentinel
input int      InpSyncInterval      = 5;                                  // Intervalo de Sincronia (Segundos)
input int      InpMaxHistoryTrades  = 200;                                // Limite de Trades Históricos Enviados
input bool     InpVerboseLog        = false;                              // Ativar Logs Detalhados

// --- Variáveis Globais ---
datetime last_sync = 0;
string   prefix = "[TWS Sentinel] ";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Configura timer de checagem
   EventSetTimer(1);
   
   Print(prefix, "Inicializado com sucesso! Sincronizando a cada ", InpSyncInterval, " segundos com: ", InpServerUrl);
   
   // Sincronia forçada imediata no start
   SincronizarSentinel();
   
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
   Print(prefix, "Desligado da conta. Monitoramento suspenso.");
  }

//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   datetime agora = TimeCurrent();
   if(agora - last_sync >= InpSyncInterval)
     {
      SincronizarSentinel();
      last_sync = agora;
     }
  }

//+------------------------------------------------------------------+
//| Trade events triggers                                            |
//+------------------------------------------------------------------+
void OnTrade()
  {
   // Forçar sincronia imediata quando houver alteração de ordens ou posições
   SincronizarSentinel();
   last_sync = TimeCurrent();
  }

//+------------------------------------------------------------------+
//| Função Principal: Coleta, Serialização e Envio dos Dados JSON   |
//+------------------------------------------------------------------+
void SincronizarSentinel()
  {
   // 1. Coletar Dados da Conta
   double balance     = AccountInfoDouble(ACCOUNT_BALANCE);
   double equity      = AccountInfoDouble(ACCOUNT_EQUITY);
   double margin      = AccountInfoDouble(ACCOUNT_MARGIN);
   double margin_free = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   double profit      = AccountInfoDouble(ACCOUNT_PROFIT);
   long   leverage    = AccountInfoInteger(ACCOUNT_LEVERAGE);
   long   number      = AccountInfoInteger(ACCOUNT_LOGIN);
   string company     = AccountInfoString(ACCOUNT_COMPANY);
   string name        = AccountInfoString(ACCOUNT_NAME);
   string currency    = AccountInfoString(ACCOUNT_CURRENCY);
   
   // Tratamento de aspas simples nas strings da conta para evitar JSON invalido
   StringReplace(company, "\"", "'");
   StringReplace(name, "\"", "'");

   // 2. Iniciar Construção da String JSON
   string json = "{";
   
   // --- OBJETO ACCOUNT ---
   json += "\"account\":{";
   json += "\"balance\":" + DoubleToString(balance, 2) + ",";
   json += "\"equity\":" + DoubleToString(equity, 2) + ",";
   json += "\"margin\":" + DoubleToString(margin, 2) + ",";
   json += "\"margin_free\":" + DoubleToString(margin_free, 2) + ",";
   json += "\"profit\":" + DoubleToString(profit, 2) + ",";
   json += "\"leverage\":" + IntegerToString(leverage) + ",";
   json += "\"number\":" + IntegerToString(number) + ",";
   json += "\"company\":\"" + company + "\",";
   json += "\"name\":\"" + name + "\",";
   json += "\"currency\":\"" + currency + "\"";
   json += "},";

   // --- ARRAY POSITIONS (POSIÇÕES ABERTAS) ---
   json += "\"positions\":[";
   int total_positions = PositionsTotal();
   int active_pos_count = 0;
   
   for(int i = 0; i < total_positions; i++)
     {
      string symbol = PositionGetSymbol(i);
      if(symbol != "")
        {
         ulong  ticket       = PositionGetInteger(POSITION_TICKET);
         double volume       = PositionGetDouble(POSITION_VOLUME);
         double price_open   = PositionGetDouble(POSITION_PRICE_OPEN);
         double price_current= PositionGetDouble(POSITION_PRICE_CURRENT);
         double pos_profit   = PositionGetDouble(POSITION_PROFIT);
         double sl           = PositionGetDouble(POSITION_SL);
         double tp           = PositionGetDouble(POSITION_TP);
         long   magic        = PositionGetInteger(POSITION_MAGIC);
         string comment      = PositionGetString(POSITION_COMMENT);
         datetime p_time     = (datetime)PositionGetInteger(POSITION_TIME);
         
         long type_int = PositionGetInteger(POSITION_TYPE);
         string type_str = (type_int == POSITION_TYPE_BUY) ? "Compra" : "Venda";
         
         StringReplace(comment, "\"", "'");
         if(comment == "") comment = "Sem comentario";

         if(active_pos_count > 0) json += ",";
         
         json += "{";
         json += "\"symbol\":\"" + symbol + "\",";
         json += "\"ticket\":" + IntegerToString(ticket) + ",";
         json += "\"volume\":" + DoubleToString(volume, 2) + ",";
         json += "\"type\":\"" + type_str + "\",";
         json += "\"price_open\":" + DoubleToString(price_open, 5) + ",";
         json += "\"price_current\":" + DoubleToString(price_current, 5) + ",";
         json += "\"profit\":" + DoubleToString(pos_profit, 2) + ",";
         json += "\"sl\":" + DoubleToString(sl, 5) + ",";
         json += "\"tp\":" + DoubleToString(tp, 5) + ",";
         json += "\"magic\":" + IntegerToString(magic) + ",";
         json += "\"comment\":\"" + comment + "\",";
         json += "\"time\":\"" + TimeToString(p_time, TIME_DATE|TIME_MINUTES|TIME_SECONDS) + "\"";
         json += "}";
         
         active_pos_count++;
        }
     }
   json += "],";

   // --- ARRAY HISTORY (HISTÓRICO RECENTE) ---
   json += "\"history\":[";
   
   // Seleciona historico da conta
   if(HistorySelect(0, TimeCurrent()))
     {
      int deals_total = HistoryDealsTotal();
      int history_added_count = 0;
      
      // Itera de trás para frente no histórico de deals (do mais recente para o mais antigo)
      // para puxar preferencialmente os últimos InpMaxHistoryTrades adicionados
      for(int i = deals_total - 1; i >= 0; i--)
        {
         ulong ticket = HistoryDealGetTicket(i);
         if(ticket > 0)
           {
            // Filtra deals que representam fechamentos parciais ou totais de posicao
            long entry = HistoryDealGetInteger(ticket, DEAL_ENTRY);
            double d_profit = HistoryDealGetDouble(ticket, DEAL_PROFIT);
            
            // DEAL_ENTRY_OUT ou DEAL_ENTRY_INOUT indica saída/fechamento (gera lucro líquido consolidado)
            if(entry == DEAL_ENTRY_OUT || entry == DEAL_ENTRY_INOUT)
              {
               string h_symbol    = HistoryDealGetString(ticket, DEAL_SYMBOL);
               double h_volume    = HistoryDealGetDouble(ticket, DEAL_VOLUME);
               double h_price     = HistoryDealGetDouble(ticket, DEAL_PRICE);
               double h_swap      = HistoryDealGetDouble(ticket, DEAL_SWAP);
               double h_commission= HistoryDealGetDouble(ticket, DEAL_COMMISSION);
               long   h_magic     = HistoryDealGetInteger(ticket, DEAL_MAGIC);
               string h_comment   = HistoryDealGetString(ticket, DEAL_COMMENT);
               datetime close_t   = (datetime)HistoryDealGetInteger(ticket, DEAL_TIME);
               
               long h_type_int = HistoryDealGetInteger(ticket, DEAL_TYPE);
               string h_type_str = (h_type_int == DEAL_TYPE_BUY) ? "Venda" : "Compra"; // Deal Buy fecha posicao Sell e vice-versa
               
               // Se o deal de fechamento foi Buy, a posicao original era Sell
               if(h_type_int == DEAL_TYPE_BUY) h_type_str = "Venda";
               else h_type_str = "Compra";

               StringReplace(h_comment, "\"", "'");
               if(h_comment == "") h_comment = "Sem comentario";

               // Encontrar o preco de abertura (estimado pelo preco de fechamento e lucro)
               double h_price_open = h_price;
               if(h_volume > 0)
                 {
                  double tick_value = SymbolInfoDouble(h_symbol, SYMBOL_TRADE_TICK_VALUE);
                  double tick_size = SymbolInfoDouble(h_symbol, SYMBOL_TRADE_TICK_SIZE);
                  if(tick_value > 0 && tick_size > 0)
                    {
                     double points_profit = d_profit / (h_volume * tick_value / tick_size);
                     if(h_type_str == "Compra") h_price_open = h_price - points_profit;
                     else h_price_open = h_price + points_profit;
                    }
                 }

               // Formatacao de datas legivel para JS
               string close_time_str = TimeToString(close_t, TIME_DATE|TIME_MINUTES|TIME_SECONDS);
               string open_time_str  = TimeToString(close_t - 3600, TIME_DATE|TIME_MINUTES|TIME_SECONDS); // Estimado 1h atras caso nao ache
               
               if(history_added_count > 0) json += ",";

               json += "{";
               json += "\"symbol\":\"" + h_symbol + "\",";
               json += "\"ticket\":" + IntegerToString(ticket) + ",";
               json += "\"volume\":" + DoubleToString(h_volume, 2) + ",";
               json += "\"type\":\"" + h_type_str + "\",";
               json += "\"price_open\":" + DoubleToString(h_price_open, 5) + ",";
               json += "\"price_close\":" + DoubleToString(h_price, 5) + ",";
               json += "\"profit\":" + DoubleToString(d_profit, 2) + ",";
               json += "\"sl\":0.0,";
               json += "\"tp\":0.0,";
               json += "\"magic\":" + IntegerToString(h_magic) + ",";
               json += "\"comment\":\"" + h_comment + "\",";
               json += "\"time_open\":\"" + open_time_str + "\",";
               json += "\"time_close\":\"" + close_time_str + "\",";
               json += "\"swap\":" + DoubleToString(h_swap, 2) + ",";
               json += "\"commission\":" + DoubleToString(h_commission, 2);
               json += "}";

               history_added_count++;
               
               // Interrompe quando bater o limite de trades historicos configurado
               if(history_added_count >= InpMaxHistoryTrades) break;
              }
           }
        }
     }
   json += "]";
   json += "}";

   // 3. Enviar Payload JSON via WebRequest (Chamada HTTP POST assincrona)
   char post[];
   char result[];
   string result_headers;
   StringToCharArray(json, post, 0, WHOLE_ARRAY, CP_UTF8);
   
   string headers = "Content-Type: application/json\r\n";
   
   // WebRequest exige permissao explicita nas Opcoes do MT5
   ResetLastError();
   int res = WebRequest("POST", InpServerUrl, headers, 1000, post, result, result_headers);
   
   if(res == -1)
     {
      int err = GetLastError();
      if(err == 4014)
        {
         Print(prefix, "ERRO CRÍTICO (4014): O Sentinel Server nao foi autorizado nas configuracoes do MT5!");
         Print(prefix, "➡️ Adicione a URL 'http://127.0.0.1:5000' em Ferramentas -> Opcoes -> Experts -> Permitir WebRequest.");
        }
      else
        {
         Print(prefix, "Erro ao conectar com o Sentinel Server. Codigo de Erro: ", err);
        }
     }
   else
     {
      if(InpVerboseLog)
        {
         Print(prefix, "Sincronia executada. Servidor respondeu com codigo: ", res);
        }
     }
  }
//+------------------------------------------------------------------+
