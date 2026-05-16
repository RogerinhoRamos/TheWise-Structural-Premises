//+------------------------------------------------------------------+
//|                                           https://padrão base original.com.br |
//|                                           contato@padrão base original.com.br |
//+------------------------------------------------------------------+
#property copyright   "Construtor padrão base original"
#property link        "https://padrão base original.com.br"
#property version     "1.65"
#property description "Soluções automatizadas para renda variável"
#property description "Plataforma atualizada em 23/04/2026 na versão 1.65 - Case4 janela com verificacao de continuidade"

struct s_position
  {
   double            volume;
   double            lucro;
   ulong             ticket;
   double            sl;
   double            tp;
   datetime          hora;
  };

struct s_ordem
  {
   ulong             af1;
   ulong             af2;
   ulong             af3;
   ulong             af4;
   ulong             af5;
   ulong             ac1;
   ulong             ac2;
   ulong             ac3;
   ulong             ac4;
   ulong             ac5;
   ulong             p1;
   ulong             p2;
   ulong             p3;
   ulong             p4;
   ulong             buy;
   ulong             sell;
   ulong             out;
  };

struct s_history
  {
   datetime          ult_time;
   double            entrada;
   double            medio;
   double            saldo;
   int               cnt;
   int               gains;
   double            max;
   double            min;
   double            saldo_dia;
   double            saldo_sem;
   double            saldo_mes;
   double            saldo_total;
   int               cnt_dia;
   int               cnt_sem;
   int               cnt_mes;
   int               cnt_total;
   int               gains_dia;
   int               gains_sem;
   int               gains_mes;
   int               gains_total;
   ulong             af1;
   ulong             af2;
   ulong             af3;
   ulong             af4;
   ulong             af5;
   ulong             ac1;
   ulong             ac2;
   ulong             ac3;
   ulong             ac4;
   ulong             ac5;
   ulong             p1;
   ulong             p2;
   ulong             p3;
   ulong             p4;
   ulong             last;
   double            saldo_conta;
   double            max_conta;
   double            min_conta;
  };

enum e_tempo
  {
   es_s = 0, // Segundos
   es_m = 1, // Minutos
   es_h = 2, // Horas
   es_v = 3 // Velas
  };

enum e_meta
  {
   es_off = 0, // Desabilitado
   es_dia = 1, // Meta diária
   es_sem = 2, // Meta Semanal
   es_mes = 3 // Meta Mensal
  };

enum e_sn
  {
   es_nao = 0, // Não
   es_sim = 1 // Sim
  };

enum e_pro
  {
   es_tick = 0, // Cada tick
   es_seg = 1 // Cada segundo
  };

enum e_hr
  {
   eh_00 = 0,    // 00h
   eh_01 = 1,    // 01h
   eh_02 = 2,    // 02h
   eh_03 = 3,    // 03h
   eh_04 = 4,    // 04h
   eh_05 = 5,    // 05h
   eh_06 = 6,    // 06h
   eh_07 = 7,    // 07h
   eh_08 = 8,    // 08h
   eh_09 = 9,    // 09h
   eh_10 = 10,   // 10h
   eh_11 = 11,   // 11h
   eh_12 = 12,   // 12h
   eh_13 = 13,   // 13h
   eh_14 = 14,   // 14h
   eh_15 = 15,   // 15h
   eh_16 = 16,   // 16h
   eh_17 = 17,   // 17h
   eh_18 = 18,   // 18h
   eh_19 = 19,   // 19h
   eh_20 = 20,   // 20h
   eh_21 = 21,   // 21h
   eh_22 = 22,   // 22h
   eh_23 = 23    // 23h
  };

enum e_min
  {
   em_00 = 0,    // 00m
   em_01 = 1,    // 01m
   em_02 = 2,    // 02m
   em_03 = 3,    // 03m
   em_04 = 4,    // 04m
   em_05 = 5,    // 05m
   em_06 = 6,    // 06m
   em_07 = 7,    // 07m
   em_08 = 8,    // 08m
   em_09 = 9,    // 09m
   em_10 = 10,   // 10m
   em_11 = 11,   // 11m
   em_12 = 12,   // 12m
   em_13 = 13,   // 13m
   em_14 = 14,   // 14m
   em_15 = 15,   // 15m
   em_16 = 16,   // 16m
   em_17 = 17,   // 17m
   em_18 = 18,   // 18m
   em_19 = 19,   // 19m
   em_20 = 20,   // 20m
   em_21 = 21,   // 21m
   em_22 = 22,   // 22m
   em_23 = 23,   // 23m
   em_24 = 24,   // 24m
   em_25 = 25,   // 25m
   em_26 = 26,   // 26m
   em_27 = 27,   // 27m
   em_28 = 28,   // 28m
   em_29 = 29,   // 29m
   em_30 = 30,   // 30m
   em_31 = 31,   // 31m
   em_32 = 32,   // 32m
   em_33 = 33,   // 33m
   em_34 = 34,   // 34m
   em_35 = 35,   // 35m
   em_36 = 36,   // 36m
   em_37 = 37,   // 37m
   em_38 = 38,   // 38m
   em_39 = 39,   // 39m
   em_40 = 40,   // 40m
   em_41 = 41,   // 41m
   em_42 = 42,   // 42m
   em_43 = 43,   // 43m
   em_44 = 44,   // 44m
   em_45 = 45,   // 45m
   em_46 = 46,   // 46m
   em_47 = 47,   // 47m
   em_48 = 48,   // 48m
   em_49 = 49,   // 49m
   em_50 = 50,   // 50m
   em_51 = 51,   // 51m
   em_52 = 52,   // 52m
   em_53 = 53,   // 53m
   em_54 = 54,   // 54m
   em_55 = 55,   // 55m
   em_56 = 56,   // 56m
   em_57 = 57,   // 57m
   em_58 = 58,   // 58m
   em_59 = 59    // 59m
  };

enum e_price
  {
   es_mercado = 0, // Preço de mercado
   es_max = 1, // Máxima atual
   es_min = 2, // Mínima atual
   es_open = 3, // Abertura atual
   es_last_max = 4, // Máxima anterior
   es_last_min = 5, // Mínima anterior
   es_close = 6, // Fechamento anterior
   es_3_max = 7, // Máxima dos 3 últimos
   es_3_min = 8, // Mínima dos 3 últimos
   es_day_max = 9, // Máxima do dia
   es_day_min = 10, // Mínima do dia
   es_day_open = 11, // Abertura do dia
   es_day_last_max = 12, // Máxima dia anterior
   es_day_last_min = 13, // Mínima dia anterior
   es_day_last_close = 14, // Fechamento dia anterior
   es_bid = 15, // Melhor comprador (BID)
   es_ask = 16 // Melhor vendedor (ASK)
  };

enum e_mercado
  {
   es_b3 = ORDER_FILLING_RETURN, // B3
   es_forex = ORDER_FILLING_FOK // Forex
  };

enum e_validade
  {
   es_swing = ORDER_TIME_GTC, // Swing Trade
   es_day = ORDER_TIME_DAY // Day Trade
  };

enum e_semana
  {
   es_diariamente = 0, // Todos os dias
   es_segunda = 1, // Segundas
   es_terca = 2, // Terças
   es_quarta = 3, // Quartas
   es_quinta = 4, // Quintas
   es_sexta = 5, // Sextas
   es_sabado = 6 // Sábados
  };

enum e_buys_in
  {
   es_buy_in_1 = 0, // Entrada compra 1 HiLo
   es_buy_in_2 = 1, // Entrada compra 2 Hilo+RSI
   es_buy_in_3 = 2, // Sem Sinal /Boleta-Manual
   es_buy_in_4 = 3, // Entrada compra 4 HiLo+ADX
   es_buy_in_5 = 4  // Entrada compra 5 HiLo+Janela+ADX
  };

enum e_sells_in
  {
   es_sell_in_1 = 0, // Entrada venda 1 HiLo
   es_sell_in_2 = 1, // Entrada venda 2 HiLo+RSI
   es_sell_in_3 = 2, // Sem Sinal /Boleta-Manual
   es_sell_in_4 = 3, // Entrada venda 4 HiLo+ADX
   es_sell_in_5 = 4  // Entrada venda 5 HiLo+Janela+ADX
  };

enum e_buys_out
  {
   es_buy_out_1 = 0, // Saída compra 
   es_buy_out_2 = 1, // Sem sinal de saída
   es_buy_out_3 = 2 // Desativado
  };

enum e_sells_out
  {
   es_sell_out_1 = 0, // Saída venda 
   es_sell_out_2 = 1, // Sem sinal de saída
   es_sell_out_3 = 2 // Desativado
  };

enum e_saldo
  {
   es_saldo_total = 0, // Financeiro
   es_saldo_perce = 1 // Percentual
  };
//+------------------------------------------------------------------+
class GLOBAL
  {
protected:
   bool                    _magic_exist;
   string                  _prefix_painel, _prefix_linha;
   ENUM_ORDER_TYPE_TIME    _validade;
   ENUM_ORDER_TYPE_FILLING _filling;
   MqlDateTime             _time_inicio, _time_parar, _time_zerar, _time_corrente;
   bool                    _comprar, _vender, _repo_sl, _repo_tp, _block_in, _block_out, _cancel_oposto;
   int                     _handle_1, _handle_2, _handle_3, _handle_4;
   int                     _handle_5, _handle_6, _handle_7, _handle_8;
   double                  _medio_tp, _medio_sl, _medio_pn;
   bool                    _pts_inout, _pts_cus, _pts_tp, _pts_sl, _pts_ac, _pts_af, _pts_pn, _ajustar, _pts_grad;
   double                  _boleta;
   ulong                   _contas[4], _permitidas;
   datetime                _expiracao;
   bool                    _back, _demo, _contest, _real;
   int                     _max_buy_in, _max_buy_out, _max_sell_in, _max_sell_out, _vol_digitos;
   uint                    _ticks_deal, _ticks_count;

public:
   bool                    _operar, _minimizado, _atualizar, _visual, _teste;
   string                  set_simbolo(void);
   bool                    verificar_licenca(void);
  };
//+------------------------------------------------------------------+
class GRAFICO : public GLOBAL
  {
private:
   struct s_etiqueta
     {
      bool           mover;
      bool           confirmado;
      string         linha;
      string         etiqueta;
      string         ticket;
     };

   s_etiqueta        _tarja;
   string            _linhas[15];

protected:
   void              update_painel_position(const s_position &pos);
   color             confirmar_cor(const double valor);
   void              set_obj(const ENUM_OBJECT obj, const string nome, const int lat_dis, const int top_dis, const int larg,
                             const int alt, const int width, const color clr_fundo, const color clr_borda,
                             const string font, const int font_size, const string txt, const color clr_txt,
                             const bool press=false);
   void              update_painel_descritivo(const string msg);
   void              set_grafico(void);
   void              filtro_log(const string msg);
   bool              criar_painel(void);
   bool              minimizar_painel(void);
   void              excluir_indicadores(void);
   void              update_painel_history(const s_history &his);
   bool              check_linhas(void);
   void              gerenciar_linhas(const s_position &pos, const s_ordem &ord, const ulong &grad[], const double entrada, const double medio);
   void              atualizar_linha(const string nome, const string txt, const double price, const color cor, const double saldo=0);
   bool              criar_linha(const string nome, const ENUM_LINE_STYLE style);
   bool              modificar_linha(const string nome, const string etiqueta, const string ticket, const bool remover);
   void              processar_boleta(const string botao);
   bool              criar_log(void);

public:
   void              processar_grafico(const int id, const long lparam, const double dparam, const string sparam);
  };
//+------------------------------------------------------------------+
class CONTROLE : public GRAFICO
  {
protected:
   s_ordem           ordens(ulong &grad_ticket[], const datetime abertura, const double pos_tp=0.00, const double pos_sl=0.00);
   s_history         historico(int &grad_qtd[], const datetime abertura=0, const bool iniciar=false);
   void              check_windows(const int &window[]);
   bool              check_metas(const double saldo, const double lucro, const double topo, const double fundo, const bool conta, const bool pos);
   bool              check_trades(const uint total, const uint gains);
   bool              check_conexao(void);
   bool              check_volume_inicial(const double volume);
   bool              check_volumes(void);
   bool              check_indicadores(void);
   bool              check_ticks(void);
   bool              check_ativo(void);
   void              check_globais(void);
   void              check_visual(void);
   bool              check_filling(const ENUM_TRADE_REQUEST_ACTIONS action, ENUM_ORDER_TYPE_FILLING &filling);
   bool              check_expiration(ENUM_ORDER_TYPE_TIME &time);
   bool              check_espera(const datetime time, const int espera);
   bool              check_temporizador(const datetime time, const int espera, const e_tempo referencia);
   void              iniciar_handles(void);

public:
   s_position        posicao(void);
   void              check_buffers(void);
  };
//+------------------------------------------------------------------+
class HORARIO : public CONTROLE
  {
protected:
   bool              check_barra(const bool candle_out, const datetime time);
   void              set_horario(void);

public:
   bool              horario_operacional(void);
   bool              horario_zeragem(void);
   void              atualizar_hora(void);
   bool              horario_espera(void);
  };
//+------------------------------------------------------------------+
class EXECUCAO : public HORARIO
  {
protected:
   double            _price_entrada;
   double            _price_medio;
   double            check_conversao(const bool pts, const double valor, const double price=0.0);
   bool              check_sentido(const double valor1, const double valor2, const int sentido);
   bool              check_sinal(int &sinal, const int menu1, const double value1, const int coef1, const double var1,
                                 const int sentido, const int menu2, const double value2, const int coef2, const double var2);
   double            check_coeficiente(const double valor, const int coef, const double var);
   bool              trailling_tp(const ulong ticket, const double price);
   bool              breakeven_tp(const ulong ticket, const double price);
   bool              trailling_sl(const ulong ticket, const double price);
   bool              breakeven_sl(const ulong ticket, const double price);
   bool              check_stoplevel(double &price, const ENUM_ORDER_TYPE tipo, const bool corrigir=false, const double ajustar=0.00);
   bool              check_permissao(void);
   bool              check_spread(void);
   double            check_price(const e_price pr);
   double            check_sl(const ENUM_ORDER_TYPE tipo, const double price);
   double            check_tp(const ENUM_ORDER_TYPE tipo, const double price);
   bool              check_saida_venda(void);
   bool              check_entrada_venda(void);
   bool              check_saida_compra(void);
   bool              check_entrada_compra(void);
   bool              check_canais_compra_in(int &sinal);
   bool              check_canais_venda_in(int &sinal);
   bool              check_canais_compra_out(int &sinal);
   bool              check_canais_venda_out(int &sinal);
   bool              check_oscilar_compra_in(int &sinal);
   bool              check_oscilar_venda_in(int &sinal);
   bool              check_oscilar_compra_out(int &sinal);
   bool              check_oscilar_venda_out(int &sinal);
   bool              check_cruzar_compra_in(int &sinal);
   bool              check_cruzar_venda_in(int &sinal);
   bool              check_cruzar_compra_out(int &sinal);
   bool              check_cruzar_venda_out(int &sinal);
   bool              get_indicator_value(const int handle, const int buffer, const int shift, double &value);
   bool              check_hilo_janela_compra(int &sinal);
   bool              check_hilo_janela_venda(int &sinal);
   bool              check_adx_minimo(void);
   void              check_alvos(const double pos, const ulong ticket, const double primeira, const double medio);
   bool              check_delay(void);
   bool              enviar_venda(void);
   bool              enviar_compra(void);
   bool              enviar_saida(const double pos, const ulong ticket_out);
   bool              check_gradiente_linear(const double posicao, const double entrada, const int &grad_qtd[], const ulong &grad_ticket[],
         const ulong last, const double tp, const double sl, const datetime ultima);
   bool              check_pendentes(const s_position &pos, const s_ordem &ord, const s_history &his);
   void              confirmar_aumento(const bool contra, const double pos, const double entrada, const double sl, const double tp,
                                       const double dis, const double lot, const ulong ticket, const ulong history, const string nome);
   void              confirmar_parciais(const double pos, const double price, const double sl, const double tp, const double dis, const double lot,
                                        const ulong ticket, const ulong history, const string nome);
   bool              parcial_mercado(const double vol, const string nome);
   bool              check_saida_temporal(const datetime hora, const double lucro);
   bool              check_filtro_barra(void);
   bool              check_procura_sinal(const bool compra, const bool saida, const datetime ultima);

public:
   double            normalizar(const double price);
   void              zeragem_compulsoria(void);
   bool              enviar_ordem(const ENUM_TRADE_REQUEST_ACTIONS action, const ENUM_ORDER_TYPE tipo,
                                  double price=0, ulong  ticket=0, double tp=0, double sl=0, double lot=0, string coment=NULL, ulong ticket_by=0);
  };
//+------------------------------------------------------------------+
class PROCESSAR : public EXECUCAO
  {
private:
   void              processar_zerado(const s_history &his, ulong &grad_ticket[]);
   void              processar_posicionado(const s_position &pos, const s_ordem &ord, const s_history &his, const int &grad_qtd[], const ulong &grad_ticket[]);

public:
   bool              iniciando(void);
   void              desligando(void);
   void              processando(void);
   bool              check_global(const bool excluir);
  };
//+------------------------------------------------------------------+
PROCESSAR in_pro;
//+------------------------------------------------------------------+
#define Robot "padrão base original_1746638762"
#define Expert "TheWise-HiLo-V4"
#property description "Expert Advisor TheWise-HiLo-V4"
#property description "Criado com o construtor padrão base original em 07/05/2025 - 14:26:02"

sinput group "--- PARAMETRIZAÇÃO INICIAL ---"
sinput ulong m_magic = 1746638762; // Magic Number (ID)
sinput e_pro m_processo = es_tick; // Modo de processamento
sinput e_mercado m_mercado = (e_mercado)ORDER_FILLING_RETURN; // Tipo de mercado
sinput e_validade m_validade = (e_validade)ORDER_TIME_GTC; // Modo operacional

sinput group "--- CONFIGURAÇÃO ADICIONAL ---"
input ENUM_TIMEFRAMES m_timeframe = PERIOD_CURRENT; // Tempo gráfico
sinput double m_volume = 1; // Volume
sinput int m_spread = 0; // Spread máximo
input int m_alvos_check = 5; // Tempo para confirmar alvos (seg)
input uint m_delay_ticks = 1000; // Atraso após envio de ordens (ms)

sinput group "--- CONFIRMAÇÃO DE SINAIS ---"
sinput string m_set = "Setup Padrão"; // Nome do setup
sinput e_buys_in m_compra_in = 0; // Sinal entrada compra
sinput e_sells_in m_venda_in = 0; // Sinal entrada venda
sinput e_buys_out m_compra_out = 0; // Sinal saída compra
sinput e_sells_out m_venda_out = 0; // Sinal saída venda
sinput e_sn m_inverte_in = false; // Inverter sinais de entrada
sinput e_sn m_inverte_out = false; // Inverter sinais de saída

sinput group "--- CROSS ORDER ---"
sinput e_sn m_cross_order = false; // Envio de ordens em outro ativo
sinput string m_cross_ativo = " "; // Ativo para cross order

sinput group "--- COMPLEMENTOS ---"
input e_sn m_sinais_in = false; // Procurar entrada na vela seguinte à saída
input e_sn m_sinais_out = false; // Procurar saída na vela seguinte à entrada

input double m_ref_saldo = 0; // Somar saldo para ajuste

sinput group "--- TEMPORIZAÇÃO ---"
input e_tempo m_espera_ref = 1; // Referência de tempo
input int m_espera_in = 0; // Tempo para nova entrada
input int m_espera_out = 0; // Tempo mínimo de posição

sinput group "--- ORDENS PENDENTES DE ENTRADA ---"
input e_sn m_pendente_in = true; // Ordem pendente p/ entrada
input int m_cancel_in = 0; // Expiração entradas (seg)
input double m_dis_in = 0; // Distância entrada (pts)
input e_price m_price_buy = 15; // Preço p/ compra
input e_price m_price_sell = 16; // Preço p/ venda

sinput group "--- ORDENS PENDENTES DE SAÍDA ---"
input e_sn m_pendente_out = false; // Ordem pendente p/ saída
input int m_cancel_out = 0; // Expiração saídas (seg)
input double m_dis_out = 0; // Distância saída (pts)
input e_price m_price_out_buy = 0; // Saída da compra
input e_price m_price_out_sell = 0; // Saída da venda

sinput group "--- STOPLOSS ---"
input double m_sl = 400; // Stop loss (pts)
input e_sn m_alvos_sl2 = false; // Usar stop personalizado
input double m_dis_sl2 = 0; // Distância stoploss (pts)
input e_price m_price_sl2_buy = 0; // Stop personalizado da compra
input e_price m_price_sl2_sell = 0; // Stop personalizado da venda

sinput group "--- TAKEPROFIT ---"
input double m_tp = 850; // Take Profit (pts)
input e_sn m_alvos_tp2 = false; // Usar take personalizado
input double m_dis_tp2 = 0; // Distância takeprofit (pts)
input e_price m_price_tp2_buy = 0; // Take personalizado da compra
input e_price m_price_tp2_sell = 0; // Take personalizado da venda

sinput group "--- MOVIMENTO STOP LOSS ---"
input double m_sl_be = 115; // Início do breakeven SL (pts)
input double m_sl_be_dis = 75; // Distância do breakeven (pts)
input double m_sl_ts = 135; // Trailling stop (pts)
input double m_sl_ts_step = 25; // Passo do trailling stop (pts)

sinput group "--- MOVIMENTO TAKE PROFIT ---"
input double m_tp_be = 0; // Início do breakeven TP (pts)
input double m_tp_be_dis = 0; // Distância do breakeven (pts)
input double m_tp_ts = 0; // Trailling Profit (pts)
input double m_tp_ts_step = 0; // Passo do trailling profit (pts)

sinput group "--- FILTRO DE CANDLE ---"
input ENUM_TIMEFRAMES m_candle_tf = PERIOD_CURRENT; // Tempo gráfico da vela
input int m_candle_min = 0; // Tamanho mínimo da vela (pts)
input int m_candle_max = 0; // Tamanho máximo da vela (pts)
input int m_corpo_min = 0; // Tamanho mínimo do corpo (pts)
input int m_corpo_max = 0; // Tamanho máximo do corpo (pts)

sinput group "--- SAÍDA TEMPORAL ---"
input e_tempo m_temporal_ref = 1; // Referência de tempo
input int m_temporal_pos_time = 0; // Tempo de referência positivo
input double m_temporal_pos_max = 0; // Saldo máximo positivo
input double m_temporal_pos_min = 0; // Saldo mínimo positivo
input int m_temporal_neg_time = 0; // Tempo de referência negativo
input double m_temporal_neg_max = 0; // Saldo máximo negativo
input double m_temporal_neg_min = 0; // Saldo mínimo negativo

sinput group "--- AUMENTOS A FAVOR ---"
input double m_af1_dis = 0; // Distância a favor 1 (pts)
input double m_af1_lot = 0; // Volume a favor 1
input double m_af2_dis = 0; // Distância a favor 2 (pts)
input double m_af2_lot = 0; // Volume a favor 2
input double m_af3_dis = 0; // Distância a favor 3 (pts)
input double m_af3_lot = 0; // Volume a favor 3
input double m_af4_dis = 0; // Distância a favor 4 (pts)
input double m_af4_lot = 0; // Volume a favor 4
input double m_af5_dis = 0; // Distância a favor 5 (pts)
input double m_af5_lot = 0; // Volume a favor 5

sinput group "--- AUMENTOS CONTRA ---"
input double m_ac1_dis = 0; // Distância contra 1 (pts)
input double m_ac1_lot = 0; // Volume contra 1
input double m_ac2_dis = 0; // Distância contra 2 (pts)
input double m_ac2_lot = 0; // Volume contra 2
input double m_ac3_dis = 0; // Distância contra 3 (pts)
input double m_ac3_lot = 0; // Volume contra 3
input double m_ac4_dis = 0; // Distância contra 4 (pts)
input double m_ac4_lot = 0; // Volume contra 4
input double m_ac5_dis = 0; // Distância contra 5 (pts)
input double m_ac5_lot = 0; // Volume contra 5

sinput group "--- SAÍDAS PARCIAIS ---"
input e_sn m_pendente_parcial = true; // Ordem pendente para parcial
input double m_p1_dis = 0; // Distância parcial 1 (pts)
input double m_p1_lot = 0; // Volume parcial 1
input double m_p2_dis = 0; // Distância parcial 2 (pts)
input double m_p2_lot = 0; // Volume parcial 2
input double m_p3_dis = 0; // Distância parcial 3 (pts)
input double m_p3_lot = 0; // Volume parcial 3
input double m_p4_dis = 0; // Distância parcial 4 (pts)
input double m_p4_lot = 0; // Volume parcial 4

sinput group "--- GRADIENTE LINEAR ---"
input int m_grad_qtd = 0; // Quantidade de níveis
input double m_grad_vol = 0; // Volume das ordens
input int m_grad_max = 0; // Limite de entradas
input double m_gra_dis = 0; // Distância do níveis (pts)
input double m_gra_tp = 0; // Alvo parcial do nível (pts)
input e_sn m_pendente_grad = true; // Ordem pendente para parcial do gradiente
input double m_grad_ajuste = 0; // Reposicionar ordem parcial (pts)
input e_sn m_grad_repo = true; // Reposicionar todos os níveis

sinput group "--- METAS DO EXPERT ---"
input e_meta m_refere = es_dia; // Referência
input e_saldo m_ref_calc = 0; // Cálculo do saldo
input double m_gain = 0; // Meta de ganho
input e_sn m_gain_out = true; // Zerar no gain durante um trade
input double m_loss = 0; // Limite de perda
input e_sn m_loss_out = true; // Zerar no loss durante um trade
input double m_dd = 0; // Rebaixamento máximo
input e_sn m_dd_out = false; // Zerar no rebaixamento durante um trade
input double m_dd_gat = 0; // Gatilho p/ Rebaixamento
input double m_rec = 0; // Recuperação mínima
input e_sn m_rec_out = false; // Zerar na recuperação durante um trade
input double m_rec_gat = 0; // Gatilho p/ Recuperação
input uint m_op_gain = 0; // Limite de operações vencedoras
input uint m_op_loss = 0; // Limite de operações perdedoras
input uint m_op_total = 0; // Limite total de operações

sinput group "--- METAS DA CONTA ---"
input e_meta m_refere_conta = es_dia; // Referência
input e_saldo m_ref_calc_conta = 0; // Cálculo do saldo
input e_sn m_ativo_conta = false; // Filtrar somente do mesmo ativo
input e_sn m_manual_conta = false; // Excluir operações manuais
input e_sn m_expert_conta = false; // Filtrar IDs de robôs
input ulong m_ticket_min_conta =0; // Id mínimo de robôs
input ulong m_ticket_max_conta = 0; // Id máximo de robôs
input double m_gain_conta = 0; // Meta de ganho
input e_sn m_gain_out_conta = true; // Zerar no gain durante um trade
input double m_loss_conta = 0; // Limite de perda
input e_sn m_loss_out_conta = true; // Zerar no loss durante um trade
input double m_dd_conta = 0; // Rebaixamento máximo
input e_sn m_dd_out_conta = false; // Zerar no rebaixamento durante um trade
input double m_dd_gat_conta = 0; // Gatilho p/ Rebaixamento
input double m_rec_conta = 0; // Recuperação mínima
input e_sn m_rec_out_conta = false; // Zerar na recuperação durante um trade
input double m_rec_gat_conta = 0; // Gatilho p/ Recuperação

sinput group "--- HORÁRIO INICIAL ---"
input e_hr m_hr_inicio = 10; // Hora inicial
input e_min m_min_inicio = 5; // Minuto inicial

sinput group "--- HORÁRIO FINAL ---"
input e_hr m_hr_final = 15; // Hora final
input e_min m_min_final = 55; // Minuto final

sinput group "--- HORÁRIO ZERAGEM ---"
input e_sn m_zerar = false; // Zerar por horário
input e_hr m_hr_zerar = 23; // Hora zeragem
input e_min m_min_zerar = 50; // Minuto zeragem

sinput group "--- PAUSAS OPERACIONAIS ---"
input e_tempo m_pausa_ref = 1; // Referência de tempo
input e_hr m_pausa_1_hr = 0; // Hora pausa 1
input e_min m_pausa_1_min = 0; // Minuto pausa 1
input e_semana m_pausa_1_dia = 0; // Dia da pausa 1
input int m_pausa_1_tempo = 0; // Duração da pausa 1
input e_hr m_pausa_2_hr = 0; // Hora pausa 2
input e_min m_pausa_2_min = 0; // Minuto pausa 2
input e_semana m_pausa_2_dia = 0; // Dia da pausa 2
input int m_pausa_2_tempo = 0; // Duração da pausa 2

sinput group "--- VISUALIZAÇÃO GRÁFICA ---"
input e_sn m_inserir = true; // Inserir indicadores
input e_sn m_painel = true; // Inserir painel gráfico
input e_sn m_log = true; // Exibir log informativo
input e_sn m_tarjas = true; // Exibir etiquetas nas ordens
input e_sn m_layout = false; // Alterar layout do gráfico

sinput group "--- [3] RSI ---"
input int m_period_3 = 14; // Período
input ENUM_APPLIED_PRICE m_price_3 = PRICE_CLOSE; // Tipo de preço
input int m_limitesuperior = 50; // Limite Superior
input int m_limiteinferior = 50; // Limite Inferior



sinput group "--- [4] HiLo V1 ---"
input double m_ind_4_param_1 = 8; // Período HiLo

sinput group "--- [5] ADX / JANELA ---"
input int m_janela_candles = 3; // Janela máxima em candles fechados
input int m_period_5 = 14; // Período ADX
input double m_adx_min = 18; // ADX mínimo
input e_sn m_mostrar_adx = false; // Exibir ADX no gráfico

bool CONTROLE::check_indicadores(void) { 
iniciar_handles();
ENUM_TIMEFRAMES tf = (MQLInfoInteger(MQL_TESTER)) ? m_timeframe : _Period;

_handle_3=iRSI(_Symbol,tf,m_period_3,m_price_3);
if(_handle_3 == INVALID_HANDLE) return false;

_handle_4=iCustom(_Symbol,tf,"HiLo V1.ex5",m_ind_4_param_1);
if(_handle_4 == INVALID_HANDLE) return false;

_handle_5=iADX(_Symbol,tf,m_period_5);
if(_handle_5 == INVALID_HANDLE) return false;

int window[8] = {-1,-1,1,0,(m_mostrar_adx ? 2 : -1),-1,-1,-1};
check_windows(window);
return true;}

bool EXECUCAO::get_indicator_value(const int handle, const int buffer, const int shift, double &value)
  {
   double data[];
   ArraySetAsSeries(data,true);
   if(handle == INVALID_HANDLE) return false;
   if(CopyBuffer(handle,buffer,shift,1,data) <= 0) return false;
   value = data[0];
   return true;
  }

bool EXECUCAO::check_hilo_janela_compra(int &sinal)
  {
// Janela de oportunidade para COMPRA (Case 4).
// A virada do HiLo deve ter ocorrido em até m_janela_candles candles atras
// E o HiLo deve ter mantido a direcao (alta) em todos os candles desde entao.
// Se o HiLo reverteu no meio do caminho, o sinal e descartado.
   int janela = MathMax(1,m_janela_candles);

   for(int shift=1; shift<=janela; shift++)
     {
      int sinal_local = sinal;

      // Verifica virada: [shift+1] nao era alta, [shift] virou para alta
      bool virada =
         check_sinal(sinal_local,44,shift+1,0,1,5,1,0,0,1) &&
         check_sinal(sinal_local,44,shift,0,1,4,1,0,0,1);

      if(!virada) continue;

      // Verifica continuidade: todos os candles [shift-1] ate [1] ficaram em alta
      bool continuidade = true;
      for(int k=shift-1; k>=1; k--)
        {
         int s_temp = sinal_local;
         if(!check_sinal(s_temp,44,k,0,1,4,1,0,0,1))
           {
            continuidade = false;
            break;
           }
        }

      if(continuidade)
        {
         if(sinal_local > 0)
            sinal = sinal_local;
         else if(sinal <= 0)
            sinal = 1;
         return true;
        }
     }

   return false;
  }

bool EXECUCAO::check_hilo_janela_venda(int &sinal)
  {
// Janela de oportunidade para VENDA (Case 4).
// A virada do HiLo deve ter ocorrido em ate m_janela_candles candles atras
// E o HiLo deve ter mantido a direcao (baixa) em todos os candles desde entao.
// Se o HiLo reverteu no meio do caminho, o sinal e descartado.
   int janela = MathMax(1,m_janela_candles);

   for(int shift=1; shift<=janela; shift++)
     {
      int sinal_local = sinal;

      // Verifica virada: [shift+1] nao era baixa, [shift] virou para baixa
      bool virada =
         check_sinal(sinal_local,44,shift+1,0,1,5,1,1,0,1) &&
         check_sinal(sinal_local,44,shift,0,1,4,1,1,0,1);

      if(!virada) continue;

      // Verifica continuidade: todos os candles [shift-1] ate [1] ficaram em baixa
      bool continuidade = true;
      for(int k=shift-1; k>=1; k--)
        {
         int s_temp = sinal_local;
         if(!check_sinal(s_temp,44,k,0,1,4,1,1,0,1))
           {
            continuidade = false;
            break;
           }
        }

      if(continuidade)
        {
         if(sinal_local > 0)
            sinal = sinal_local;
         else if(sinal <= 0)
            sinal = 1;
         return true;
        }
     }

   return false;
  }

bool EXECUCAO::check_adx_minimo(void)
  {
   double adx = 0.0;
   if(!get_indicator_value(_handle_5,0,1,adx)) return false;
   return (adx >= m_adx_min);
  }

bool EXECUCAO::check_entrada_compra(void) { int sinal = 0; 

if(check_canais_compra_in(sinal)) if(check_oscilar_compra_in(sinal)) switch(m_compra_in) { case 0:if((check_cruzar_compra_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,0,0,1) && check_sinal(sinal,44,1,0,1,4,1,0,0,1))) if(sinal > 0) return true; 
break;
 case 1:if((check_cruzar_compra_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,0,0,1) && check_sinal(sinal,44,1,0,1,4,1,0,0,1)) && (check_sinal(sinal,30,1,0,1,0,1,m_limitesuperior,0,1))) if(sinal > 0) return true; 
break;
 case 2:if((check_cruzar_compra_in(sinal))) if(sinal > 0) return true; 
break;
 case 3:if((check_cruzar_compra_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,0,0,1) && check_sinal(sinal,44,1,0,1,4,1,0,0,1)) && check_adx_minimo()) if(sinal > 0) return true; 
break;
 case 4:if((check_cruzar_compra_in(sinal)))
 if(check_hilo_janela_compra(sinal) && check_adx_minimo()) if(sinal > 0) return true;
break;
} 

 return false;} 
bool EXECUCAO::check_saida_compra(void) { int sinal = 0; 

if(check_canais_compra_out(sinal)) if(check_oscilar_compra_out(sinal)) switch(m_compra_out) { case 0:if((check_cruzar_compra_out(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,1,0,1) && check_sinal(sinal,44,1,0,1,4,1,1,0,1))) if(sinal > 0) return true; 
break;
 case 1:if((check_cruzar_compra_out(sinal))) if(sinal > 0) return true; 
break;
 case 2:if((check_cruzar_compra_out(sinal))) if(sinal > 0) return true; 
break;
} 

 return false;} 
bool EXECUCAO::check_entrada_venda(void) { int sinal = 0; 

if(check_canais_venda_in(sinal)) if(check_oscilar_venda_in(sinal)) switch(m_venda_in) { case 0:if((check_cruzar_venda_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,1,0,1) && check_sinal(sinal,44,1,0,1,4,1,1,0,1))) if(sinal > 0) return true; 
break;
 case 1:if((check_cruzar_venda_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,1,0,1) && check_sinal(sinal,44,1,0,1,4,1,1,0,1)) && (check_sinal(sinal,30,1,0,1,1,1,m_limiteinferior,0,1))) if(sinal > 0) return true; 
break;
 case 2:if((check_cruzar_venda_in(sinal))) if(sinal > 0) return true; 
break;
 case 3:if((check_cruzar_venda_in(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,1,0,1) && check_sinal(sinal,44,1,0,1,4,1,1,0,1)) && check_adx_minimo()) if(sinal > 0) return true; 
break;
 case 4:if((check_cruzar_venda_in(sinal)))
 if(check_hilo_janela_venda(sinal) && check_adx_minimo()) if(sinal > 0) return true;
break;
} 

 return false;} 
bool EXECUCAO::check_saida_venda(void) { int sinal = 0; 

if(check_canais_venda_out(sinal)) if(check_oscilar_venda_out(sinal)) switch(m_venda_out) { case 0:if((check_cruzar_venda_out(sinal)))
 if((check_sinal(sinal,44,2,0,1,5,1,0,0,1) && check_sinal(sinal,44,1,0,1,4,1,0,0,1))) if(sinal > 0) return true; 
break;
 case 1:if((check_cruzar_venda_out(sinal))) if(sinal > 0) return true; 
break;
 case 2:if((check_cruzar_venda_out(sinal))) if(sinal > 0) return true; 
break;
} 

 return false;} 
bool EXECUCAO::check_canais_compra_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_canais_compra_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_canais_venda_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_canais_venda_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_oscilar_compra_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_oscilar_compra_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_oscilar_venda_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_oscilar_venda_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_cruzar_compra_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_cruzar_compra_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_cruzar_venda_in(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
bool EXECUCAO::check_cruzar_venda_out(int &sinal){
 if(sinal >= 0) return true; 

 return false;} 
void CONTROLE::check_globais(void) { 
_filling = (ENUM_ORDER_TYPE_FILLING)m_mercado;
_validade = (ENUM_ORDER_TYPE_TIME)m_validade;
_comprar = true;
_vender = true;
_pts_inout = true;
_pts_cus = true;
_pts_sl = true;
_pts_tp = true;
_pts_ac = true;
_pts_af = true;
_pts_pn = true;
_pts_grad = true;
_cancel_oposto = true;
_repo_sl = true;
_repo_tp = false;
_medio_sl = true;
_medio_tp = true;
_medio_pn = true;
_block_in = false;
_block_out = false;
_ajustar = true;
_back = true;
_demo = true;
_contest = true;
_real = true;
_permitidas = 0;
_contas[0] = 0;
_contas[1] = 0;
_contas[2] = 0;
_contas[3] = 0;
_expiracao = 0;
_max_buy_in = 2;
_max_buy_out = 2;
_max_sell_in = 2;
_max_sell_out = 2;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GLOBAL::verificar_licenca(void)
  {
   if(!_back)
      if(MQLInfoInteger(MQL_TESTER) || MQLInfoInteger(MQL_OPTIMIZATION))
        {
         printf("Não é permitido usar este expert em back teste. Contate o desenvolvedor");
         return false;
        }

   ulong conta = AccountInfoInteger(ACCOUNT_LOGIN);
   ENUM_ACCOUNT_TRADE_MODE modo = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);

   switch(modo)
     {
      case ACCOUNT_TRADE_MODE_DEMO:
         if(!_demo)
           {
            printf("Contas demos não são permitidas. Contate o desenvolvedor");
            return false;
           }
         break;
      case ACCOUNT_TRADE_MODE_CONTEST:
         if(!_contest)
           {
            printf("Contas de torneios não são permitidas. Contate o desenvolvedor");
            return false;
           }
         break;
      case ACCOUNT_TRADE_MODE_REAL:
         if(!_real)
           {
            printf("Contas reais não são permitidas. Contate o desenvolvedor");
            return false;
           }
         break;
      default:
         printf("Erro desconhecido na verificação da licença");
         return false;
         break;
     }

   if(_expiracao > 0)
      if(!MQLInfoInteger(MQL_TESTER) && !MQLInfoInteger(MQL_OPTIMIZATION))
         if(TimeCurrent() > _expiracao)
           {
            printf("Licença para uso expirada em %s. Contate o desenvolvedor",TimeToString(_expiracao,TIME_DATE));
            return false;
           }

   if(_permitidas > 0)
     {
      for(int i=ArraySize(_contas)-1; i>=0; i--)
         if(_contas[i] == conta)
           {
            printf("Esta conta foi validada com sucesso para uso");
            return true;
           }

      printf("Esta conta não está habilitada para uso. Contate o desenvolvedor");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GLOBAL::set_simbolo(void)
  {
   if(m_cross_order)
      return m_cross_ativo;

   return _Symbol;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define M_SYMBOL in_pro.set_simbolo()
#define M_POINT  SymbolInfoDouble(M_SYMBOL,SYMBOL_POINT)
#define M_DIGITS (int)SymbolInfoInteger(M_SYMBOL,SYMBOL_DIGITS)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_sinal(int &sinal, const int menu1, const double value1, const int coef1, const double var1,
                           const int sentido, const int menu2, const double value2, const int coef2, const double var2)
  {
   double valor1 = 0.0;
   double valor2 = 0.0;

   for(int i=0; i<2; i++)
     {
      double valor = 0.0;
      int menu = (i == 0) ? menu1 : menu2;
      int referencia = (i == 0) ? (int)fabs(NormalizeDouble(value1,0)) : (int)fabs(NormalizeDouble(value2,0));

      if(menu == 1 || menu == -5)
        {
         valor = (i == 0) ? value1 : value2;

         if(menu == -5)
            valor = NormalizeDouble(valor*_Point,_Digits);
        }
      else
         if(menu < 10)
           {
            MqlRates rates[];
            ZeroMemory(rates);
            ArraySetAsSeries(rates,true);

            if(CopyRates(_Symbol,m_timeframe,referencia,1,rates) < 1)
              {
               filtro_log("Falha na cópia dos dados da barra");
               sinal = INT_MIN;
               return false;
              }

            if(menu < 0)
              {
               switch(fabs(menu))
                 {
                  case 1:
                     valor = rates[0].high-rates[0].low;
                     break;
                  case 2:
                     valor = fabs(rates[0].close-rates[0].open);
                     break;
                  case 3:
                     valor = EMPTY_VALUE;
                     break;
                  case 4:
                     valor = iClose(_Symbol,PERIOD_CURRENT,0);
                     break;
                  case 6:
                     valor = _price_entrada;
                     break;
                  case 7:
                     valor = _price_medio;
                     break;
                 }
              }
            else
               switch(menu)
                 {
                  case 2:
                     valor = rates[0].close;
                     break;
                  case 3:
                     valor = rates[0].open;
                     break;
                  case 4:
                     valor = rates[0].high;
                     break;
                  case 5:
                     valor = rates[0].low;
                     break;
                  case 6:
                     valor = iClose(_Symbol,PERIOD_D1,referencia);
                     break;
                  case 7:
                     valor = iOpen(_Symbol,PERIOD_D1,referencia);
                     break;
                  case 8:
                     valor = iHigh(_Symbol,PERIOD_D1,referencia);
                     break;
                  case 9:
                     valor = iLow(_Symbol,PERIOD_D1,referencia);
                     break;
                 }
           }
         else
           {
            int handle = INVALID_HANDLE;
            int buffer = 0;

            if(menu < 20)
              {
               handle = _handle_1;
               buffer = menu-10;
              }
            else
               if(menu < 30)
                 {
                  handle = _handle_2;
                  buffer = menu-20;
                 }
               else
                  if(menu < 40)
                    {
                     handle = _handle_3;
                     buffer = menu-30;
                    }
                  else
                     if(menu < 50)
                       {
                        handle = _handle_4;
                        buffer = menu-40;
                       }
                     else
                        if(menu < 60)
                          {
                           handle = _handle_5;
                           buffer = menu-50;
                          }
                        else
                           if(menu < 70)
                             {
                              handle = _handle_6;
                              buffer = menu-60;
                             }
                           else
                              if(menu < 80)
                                {
                                 handle = _handle_7;
                                 buffer = menu-70;
                                }
                              else
                                 if(menu < 90)
                                   {
                                    handle = _handle_8;
                                    buffer = menu-80;
                                   }

            if(menu >= 90 || handle == INVALID_HANDLE)
              {
               filtro_log("Buffers indicador incorreto, máximo 10");
               sinal = INT_MIN;
               return false;
              }

            double price[];
            ZeroMemory(price);
            ArraySetAsSeries(price,true);

            if(CopyBuffer(handle,buffer,referencia,1,price) < 1)
              {
               filtro_log("Falha na cópia dos dados do indicador");
               sinal = INT_MIN;
               return false;
              }

            valor = price[0];
           }

      if(i == 0)
         valor1 = check_coeficiente(valor,coef1,var1);
      else
         valor2 = check_coeficiente(valor,coef2,var2);
     }

   if(check_sentido(valor1,valor2,sentido))
     {
      sinal++;
      return true;
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double EXECUCAO::check_coeficiente(const double valor, const int coef, const double var)
  {
   switch(coef)
     {
      case 0:
         return (valor*var);
         break;
      case 1:
         if(var == 0.00)
            return 0.00;
         else
            return (valor/var);
         break;
      case 2:
         return (valor+var);
         break;
      case 3:
         return (valor-var);
         break;
     }

   return 0.00;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_sentido(const double valor1, const double valor2, const int sentido)
  {
   switch(sentido)
     {
      case 0:
         if(valor1 > valor2)
            return true;
         break;
      case 1:
         if(valor1 < valor2)
            return true;
         break;
      case 2:
         if(valor1 >= valor2)
            return true;
         break;
      case 3:
         if(valor1 <= valor2)
            return true;
         break;
      case 4:
         if(valor1 == valor2)
            return true;
         break;
      case 5:
         if(valor1 != valor2)
            return true;
         break;
      case 6:
         if(valor1 > valor2)
            return true;
         break;
      case 7:
         if(valor1 < valor2)
            return true;
         break;
      case 8:
         if(valor1 > valor2)
            return true;
         break;
      case 9:
         if(valor1 < valor2)
            return true;
         break;
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double EXECUCAO::check_price(const e_price pr)
  {
   switch(pr)
     {
      case 0:
         return iClose(M_SYMBOL,m_timeframe,0);
         break;
      case 1:
         return iHigh(M_SYMBOL,m_timeframe,0);
         break;
      case 2:
         return iLow(M_SYMBOL,m_timeframe,0);
         break;
      case 3:
         return iOpen(M_SYMBOL,m_timeframe,0);
         break;
      case 4:
         return iHigh(M_SYMBOL,m_timeframe,1);
         break;
      case 5:
         return iLow(M_SYMBOL,m_timeframe,1);
         break;
      case 6:
         return iClose(M_SYMBOL,m_timeframe,1);
         break;
      case 7:
         return fmax(fmax(iHigh(M_SYMBOL,m_timeframe,0),iHigh(M_SYMBOL,m_timeframe,1)),iHigh(M_SYMBOL,m_timeframe,2));
         break;
      case 8:
         return fmin(fmin(iLow(M_SYMBOL,m_timeframe,0),iLow(M_SYMBOL,m_timeframe,1)),iLow(M_SYMBOL,m_timeframe,2));
         break;
      case 9:
         return iHigh(M_SYMBOL,PERIOD_D1,0);
         break;
      case 10:
         return iLow(M_SYMBOL,PERIOD_D1,0);
         break;
      case 11:
         return iOpen(M_SYMBOL,PERIOD_D1,0);
         break;
      case 12:
         return iHigh(M_SYMBOL,PERIOD_D1,1);
         break;
      case 13:
         return iLow(M_SYMBOL,PERIOD_D1,1);
         break;
      case 14:
         return iClose(M_SYMBOL,PERIOD_D1,1);
         break;
      case 15:
         return SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);
         break;
      case 16:
         return SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);
         break;
      default:
         return 0;
         break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::filtro_log(const string msg)
  {
   static string last = NULL;

   if(msg != last)
     {
      printf("[%s][%s] %s",Expert,m_set,msg);
      last = msg;
      uint start = (m_painel) ? (_minimizado ? 75 : 393) : 25;

      if(_visual && m_log)
        {
         for(int i=ArraySize(_linhas)-1; i>0; i--)
           {
            _linhas[i] = _linhas[i-1];
            string nome = Robot+"_LOG_"+IntegerToString(i);
            ObjectSetString(0,nome,OBJPROP_TEXT,_linhas[i]);
            ObjectSetInteger(0,nome,OBJPROP_YDISTANCE,start+(15*i));
           }

         _linhas[0] = "["+TimeToString(TimeLocal(),TIME_SECONDS)+"] "+msg;

         if(StringLen(_linhas[0]) > 63)
            _linhas[0] = StringSubstr(_linhas[0],0,60)+"...";

         ObjectSetString(0,Robot+"_LOG_0",OBJPROP_TEXT,_linhas[0]);
         ObjectSetInteger(0,Robot+"_LOG_0",OBJPROP_YDISTANCE,start);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::criar_log(void)
  {
   if(!_visual || !m_log)
      return true;

   ResetLastError();
   uint start = (m_painel) ? (_minimizado ? 75 : 393) : 25;

   for(int i=ArraySize(_linhas)-1; i>=0; i--)
     {
      string nome = Robot+"_LOG_"+IntegerToString(i);

      if(!ObjectCreate(0,nome,OBJ_LABEL,0,0,0))
        {
         _visual = false;
         string msg = StringFormat("Erro %d ao criar a linha %d do log",GetLastError(),i);
         filtro_log(msg);
         return false;
        }

      _linhas[i] = " ";
      set_obj(OBJ_LABEL,nome,10,start+(15*i),0,0,0,NULL,NULL,"Calibri",08,_linhas[i],clrGoldenrod);
     }

   ObjectSetInteger(0,Robot+"_LOG_0",OBJPROP_COLOR,clrGold);
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::set_grafico(void)
  {
   if(!_visual)
      return;

   ChartSetInteger(0,CHART_SHOW_GRID,false);
   ChartSetInteger(0,CHART_SHOW_VOLUMES,false);
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,false);
   ChartSetInteger(0,CHART_SHOW_LAST_LINE,true);
   ChartSetInteger(0,CHART_SHOW_BID_LINE,true);
   ChartSetInteger(0,CHART_SHOW_ASK_LINE,true);

   if(m_layout)
     {
      ChartSetInteger(0,CHART_MODE,CHART_CANDLES);
      ChartSetInteger(0,CHART_COLOR_BID,C'100,116,139');
      ChartSetInteger(0,CHART_COLOR_ASK,C'100,116,139');
      ChartSetInteger(0,CHART_COLOR_LAST,C'226,232,240');
      ChartSetInteger(0,CHART_COLOR_CANDLE_BULL,C'37,99,235');
      ChartSetInteger(0,CHART_COLOR_CANDLE_BEAR,C'220,38,38');
      ChartSetInteger(0,CHART_COLOR_CHART_UP,C'148,163,184');
      ChartSetInteger(0,CHART_COLOR_CHART_DOWN,C'148,163,184');
      ChartSetInteger(0,CHART_COLOR_CHART_LINE,C'148,163,184');
      ChartSetInteger(0,CHART_COLOR_BACKGROUND,C'8,15,29');
     }

   if(m_tarjas)
     {
      ChartSetInteger(0,CHART_SHOW_TRADE_LEVELS,false);
      ChartSetInteger(0,CHART_DRAG_TRADE_LEVELS,false);
      ChartSetInteger(0,CHART_COLOR_STOP_LEVEL,clrNONE);
      ChartSetInteger(0,CHART_COLOR_VOLUME,clrNONE);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::minimizar_painel(void)
  {
   ResetLastError();
   if(!ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_0",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_1",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_NOME_ROBO",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MAGIC",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_SETUP",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_MINIMIZAR",OBJ_BUTTON,0,0,0))
     {
      filtro_log("Erro "+(string)GetLastError()+" ao minimizar o painel");
      return false;
     }

   string info = StringFormat("%s %s - %d",StringSubstr(EnumToString((ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)),19),
                              StringSubstr(EnumToString((ENUM_ACCOUNT_MARGIN_MODE)AccountInfoInteger(ACCOUNT_MARGIN_MODE)),27),m_magic);

   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_0",5,20,402,64,1,C'8,15,29',C'30,41,59',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_1",7,36,398,44,0,C'10,19,35',C'10,19,35',NULL,NULL,NULL,NULL);
   set_obj(OBJ_LABEL,_prefix_painel+"_MAGIC",150,24,0,0,0,NULL,NULL,"Bahnschrift",07,info,C'148,163,184');
   set_obj(OBJ_LABEL,_prefix_painel+"_NOME_ROBO",14,38,0,0,0,NULL,NULL,"Bahnschrift Bold",13,Expert,C'245,158,11');
   set_obj(OBJ_LABEL,_prefix_painel+"_SETUP",14,60,0,0,0,NULL,NULL,"Bahnschrift",08,m_set,C'96,165,250');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_MINIMIZAR",379,25,22,14,0,C'51,65,85',C'71,85,105',"Bahnschrift Bold",07,"+",C'226,232,240');

   _minimizado = true;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::criar_painel(void)
  {
   if(!_visual || !m_painel)
      return true;

   ResetLastError();
   if(!ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_0",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_1",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_2",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_FUNDO_PAINEL_3",OBJ_RECTANGLE_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_NOME_ROBO",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_OPERACIONAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MAGIC",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_SETUP",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LIGA_DESLIGA",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_ON",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_OFF",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_BUFFERS",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_POS",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_POS_VL",OBJ_EDIT,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LOT",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LOT_VL",OBJ_EDIT,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LUCRO",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LUCRO_VL",OBJ_EDIT,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_TRADE",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_TRADE_VL",OBJ_EDIT,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DIARIO",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DIARIO_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_SEMANAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_SEMANAL_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MENSAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MENSAL_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_TOTAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_TOTAL_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LAST",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LAST_VL1",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_LAST_VL2",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_OSC",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_OSC_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_CANDLE",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_CANDLE_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_DIA",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_DIA_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_SEM",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_SEM_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_MES",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_MES_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_TOTAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_DESEMPENHO_TOTAL_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_ATUAL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_ATUAL_VL1",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_ATUAL_VL2",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_PRICE",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_PRICE_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MEDIO",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_VENDER",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_COMPRAR",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_VOL",OBJ_EDIT,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_MAX",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_MIN",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_INVERTER",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_ZERAR",OBJ_BUTTON,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_MEDIO_VL",OBJ_LABEL,0,0,0) ||
      !ObjectCreate(0,_prefix_painel+"_BOL_MINIMIZAR",OBJ_BUTTON,0,0,0))
     {
      filtro_log("Erro "+(string)GetLastError()+" ao criar o painel principal");
      return false;
     }

   color cor_off = (_operar) ? C'51,65,85' : C'220,38,38';
   color cor_on = (_operar) ? C'22,163,74' : C'51,65,85';
   string msg = (_operar) ? "Expert habilitado" : "Expert desabilitado";
   string moeda = AccountInfoString(ACCOUNT_CURRENCY);
   string info = StringFormat("%s %s - %d",StringSubstr(EnumToString((ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)),19),
                              StringSubstr(EnumToString((ENUM_ACCOUNT_MARGIN_MODE)AccountInfoInteger(ACCOUNT_MARGIN_MODE)),27),m_magic);

   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_0",5,20,408,510,1,C'8,15,29',C'30,41,59',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_1",7,35,404,62,0,C'10,19,35',C'10,19,35',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_2",10,106,392,44,1,C'14,24,42',C'39,52,73',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_3",10,160,392,70,1,C'14,24,42',C'39,52,73',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_4",10,238,186,120,1,C'12,22,40',C'39,52,73',NULL,NULL,NULL,NULL);
   set_obj(OBJ_RECTANGLE_LABEL,_prefix_painel+"_FUNDO_PAINEL_5",206,238,196,120,1,C'12,22,40',C'39,52,73',NULL,NULL,NULL,NULL);
   set_obj(OBJ_LABEL,_prefix_painel+"_NOME_ROBO",14,38,0,0,0,NULL,NULL,"Bahnschrift Bold",13,Expert,C'245,158,11');
   set_obj(OBJ_LABEL,_prefix_painel+"_OPERACIONAL",14,60,0,0,0,NULL,NULL,"Bahnschrift",09,msg,(_operar ? C'74,222,128' : C'248,113,113'));
   set_obj(OBJ_LABEL,_prefix_painel+"_SETUP",14,78,0,0,0,NULL,NULL,"Bahnschrift",08,m_set,C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_MAGIC",150,24,0,0,0,NULL,NULL,"Bahnschrift",07,info,C'148,163,184');
   set_obj(OBJ_LABEL,_prefix_painel+"_LIGA_DESLIGA",22,115,0,0,0,NULL,NULL,"Bahnschrift Bold",09,"LIGA/DESLIGA",C'226,232,240');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_ON",170,114,48,22,1,cor_on,C'15,23,42',"Bahnschrift Bold",08,"LIG",C'248,250,252',_operar);
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_OFF",225,114,48,22,1,cor_off,C'15,23,42',"Bahnschrift Bold",08,"DES",C'248,250,252',!_operar);
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_BUFFERS",286,114,104,22,1,C'30,64,175',C'59,130,246',"Bahnschrift SemiBold",07,"LER BUFFERS",C'226,232,240',false);
   set_obj(OBJ_LABEL,_prefix_painel+"_POS",24,167,0,0,0,NULL,NULL,"Bahnschrift Bold",08,"STATUS",C'226,232,240');
   set_obj(OBJ_EDIT,_prefix_painel+"_POS_VL",82,164,104,22,1,C'30,41,59',C'39,52,73',"Bahnschrift Bold",08,"ZERADO",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_LOT",210,167,0,0,0,NULL,NULL,"Bahnschrift Bold",08,"VOLUME",C'226,232,240');
   set_obj(OBJ_EDIT,_prefix_painel+"_LOT_VL",286,164,104,22,1,C'30,41,59',C'39,52,73',"Bahnschrift Bold",08,DoubleToString(0,_vol_digitos),C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_LUCRO",24,195,0,0,0,NULL,NULL,"Bahnschrift Bold",08,"LUCRO",C'226,232,240');
   set_obj(OBJ_EDIT,_prefix_painel+"_LUCRO_VL",82,192,104,22,1,C'30,41,59',C'39,52,73',"Bahnschrift Bold",08,"0.00",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_TRADE",205,195,0,0,0,NULL,NULL,"Bahnschrift Bold",08,"DURAÇÃO",C'226,232,240');
   set_obj(OBJ_EDIT,_prefix_painel+"_TRADE_VL",286,192,104,22,1,C'30,41,59',C'39,52,73',"Bahnschrift Bold",08,"00:00:00",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_DIARIO",18,248,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Saldo Dia",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_DIARIO_VL",107,248,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00",C'74,222,128');
   set_obj(OBJ_LABEL,_prefix_painel+"_SEMANAL",18,270,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Saldo Sem",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_SEMANAL_VL",107,270,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00",C'74,222,128');
   set_obj(OBJ_LABEL,_prefix_painel+"_MENSAL",18,292,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Saldo Mês",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_MENSAL_VL",107,292,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00",C'74,222,128');
   set_obj(OBJ_LABEL,_prefix_painel+"_TOTAL",18,314,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Saldo Total",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_TOTAL_VL",107,314,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00",C'245,158,11');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_DIA",206,248,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Trades Dia",C'245,158,11');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_DIA_VL",286,248,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"00:00:00",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_SEM",206,270,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Trades Sem",C'245,158,11');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_SEM_VL",286,270,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"00:00:00",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_MES",206,292,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Trades Mês",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_MES_VL",286,292,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,DoubleToString(0,M_DIGITS),C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_TOTAL",206,314,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Trades Tot",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_DESEMPENHO_TOTAL_VL",286,314,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,DoubleToString(0,M_DIGITS),C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_LAST",18,338,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Hr. abertura",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_LAST_VL1",107,338,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00%",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_LAST_VL2",107,352,0,0,0,NULL,NULL,"Bahnschrift SemiBold",07," ",C'148,163,184');
   set_obj(OBJ_LABEL,_prefix_painel+"_ATUAL",206,338,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Último trade",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_ATUAL_VL1",286,338,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"--:--:--",C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_ATUAL_VL2",286,352,0,0,0,NULL,NULL,"Bahnschrift SemiBold",07," ",C'148,163,184');
   set_obj(OBJ_LABEL,_prefix_painel+"_PRICE",18,366,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Preço entrada",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_PRICE_VL",107,366,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,DoubleToString(0,M_DIGITS),C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_MEDIO",206,366,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Preço médio",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_MEDIO_VL",286,366,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,DoubleToString(0,M_DIGITS),C'226,232,240');
   set_obj(OBJ_LABEL,_prefix_painel+"_OSC",18,390,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Oscilação dia",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_OSC_VL",107,390,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"0.00%",C'96,165,250');
   set_obj(OBJ_LABEL,_prefix_painel+"_CANDLE",206,390,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"Nova Barra",C'248,250,252');
   set_obj(OBJ_LABEL,_prefix_painel+"_CANDLE_VL",286,390,0,0,0,NULL,NULL,"Bahnschrift SemiBold",08,"--:--:--",C'226,232,240');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_VENDER",10,430,122,42,1,C'220,38,38',C'127,29,29',"Bahnschrift Bold",09,"VENDER",C'248,250,252');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_COMPRAR",280,430,122,42,1,C'22,163,74',C'18,101,46',"Bahnschrift Bold",09,"COMPRAR",C'248,250,252');
   set_obj(OBJ_EDIT,_prefix_painel+"_VOL",168,430,96,42,1,C'226,232,240',C'39,52,73',"Bahnschrift Bold",10,DoubleToString(_boleta,_vol_digitos),C'15,23,42');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_MAX",142,452,20,20,1,C'148,163,184',C'71,85,105',"Bahnschrift Bold",08,"+",C'15,23,42');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_MIN",142,430,20,20,1,C'148,163,184',C'71,85,105',"Bahnschrift Bold",08,"-",C'15,23,42');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_INVERTER",10,476,192,30,1,C'99,102,241',C'67,56,202',"Bahnschrift Bold",08,"INVERTER",C'248,250,252');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_ZERAR",210,476,192,30,1,C'245,158,11',C'180,83,9',"Bahnschrift Bold",08,"ZERAR",C'248,250,252');
   set_obj(OBJ_BUTTON,_prefix_painel+"_BOL_MINIMIZAR",379,25,22,14,1,C'51,65,85',C'71,85,105',"Bahnschrift Bold",07,"-",C'226,232,240');

   _minimizado = false;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::set_obj(const ENUM_OBJECT obj, const string nome, const int lat_dis, const int top_dis, const int larg,
                      const int alt, const int width, const color clr_fundo, const color clr_borda,
                      const string font, const int font_size, const string txt, const color clr_txt,
                      const bool press=false)
  {
   ObjectSetInteger(0,nome,OBJPROP_XDISTANCE,lat_dis);
   ObjectSetInteger(0,nome,OBJPROP_YDISTANCE,top_dis);
   ObjectSetInteger(0,nome,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,nome,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,nome,OBJPROP_BACK,false);
   ObjectSetInteger(0,nome,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,nome,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,nome,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,nome,OBJPROP_ZORDER,10);
   ObjectSetInteger(0,nome,OBJPROP_ALIGN,ALIGN_CENTER);

   switch(obj)
     {
      case OBJ_RECTANGLE_LABEL:
         ObjectSetInteger(0,nome,OBJPROP_XSIZE,larg);
         ObjectSetInteger(0,nome,OBJPROP_YSIZE,alt);
         ObjectSetInteger(0,nome,OBJPROP_BGCOLOR,clr_fundo);
         ObjectSetInteger(0,nome,OBJPROP_BORDER_COLOR,clr_borda);
         ObjectSetInteger(0,nome,OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,nome,OBJPROP_WIDTH,width);
         break;
      case OBJ_LABEL:
         ObjectSetInteger(0,nome,OBJPROP_COLOR,clr_txt);
         ObjectSetInteger(0,nome,OBJPROP_FONTSIZE,font_size);
         ObjectSetString(0,nome,OBJPROP_FONT,font);
         ObjectSetString(0,nome,OBJPROP_TEXT,txt);
         break;
      default:
         ObjectSetInteger(0,nome,OBJPROP_BGCOLOR,clr_fundo);
         ObjectSetInteger(0,nome,OBJPROP_COLOR,clr_txt);
         ObjectSetInteger(0,nome,OBJPROP_XSIZE,larg);
         ObjectSetInteger(0,nome,OBJPROP_YSIZE,alt);
         ObjectSetInteger(0,nome,OBJPROP_FONTSIZE,font_size);
         ObjectSetString(0,nome,OBJPROP_FONT,font);
         ObjectSetString(0,nome,OBJPROP_TEXT,txt);
         ObjectSetInteger(0,nome,OBJPROP_READONLY,true);
         ObjectSetInteger(0,nome,OBJPROP_BORDER_COLOR,clr_borda);
         ObjectSetInteger(0,nome,OBJPROP_STATE,press);
         break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::update_painel_position(const s_position &pos)
  {
   if(!_visual || !m_painel || _minimizado)
      return;

   ObjectSetString(0,_prefix_painel+"_LOT_VL",OBJPROP_TEXT,DoubleToString(fabs(pos.volume),_vol_digitos));
   ObjectSetString(0,_prefix_painel+"_LUCRO_VL",OBJPROP_TEXT,DoubleToString(pos.lucro,2));

   if(fabs(pos.volume) > 0.00)
     {
      datetime tempo = fabs(TimeCurrent()-pos.hora);
      string dias = (tempo >= PeriodSeconds(PERIOD_D1)) ? StringFormat("%dd ",tempo/PeriodSeconds(PERIOD_D1)) : "";

      ObjectSetString(0,_prefix_painel+"_TRADE_VL",OBJPROP_TEXT,dias+TimeToString(tempo,TIME_SECONDS));
      ObjectSetString(0,_prefix_painel+"_LAST_VL1",OBJPROP_TEXT,TimeToString(pos.hora,TIME_SECONDS));
      ObjectSetString(0,_prefix_painel+"_LAST_VL2",OBJPROP_TEXT," ");
     }
   else
     {
      ObjectSetString(0,_prefix_painel+"_TRADE_VL",OBJPROP_TEXT,"00:00:00");
      ObjectSetString(0,_prefix_painel+"_LAST_VL1",OBJPROP_TEXT,"00:00:00");
      ObjectSetString(0,_prefix_painel+"_LAST_VL2",OBJPROP_TEXT," ");
     }

   if(pos.lucro == 0.00)
     {
      ObjectSetInteger(0,_prefix_painel+"_LUCRO_VL",OBJPROP_BGCOLOR,C'30,41,59');
      ObjectSetInteger(0,_prefix_painel+"_LUCRO_VL",OBJPROP_COLOR,C'226,232,240');
     }
   else
     {
      ObjectSetInteger(0,_prefix_painel+"_LUCRO_VL",OBJPROP_COLOR,C'248,250,252');
      if(pos.lucro > 0.0)
         ObjectSetInteger(0,_prefix_painel+"_LUCRO_VL",OBJPROP_BGCOLOR,C'22,163,74');
      else
         ObjectSetInteger(0,_prefix_painel+"_LUCRO_VL",OBJPROP_BGCOLOR,C'220,38,38');
     }

   if(pos.volume == 0.00)
     {
      ObjectSetInteger(0,_prefix_painel+"_POS_VL",OBJPROP_COLOR,C'226,232,240');
      ObjectSetInteger(0,_prefix_painel+"_LOT_VL",OBJPROP_COLOR,C'226,232,240');

      ObjectSetString(0,_prefix_painel+"_POS_VL",OBJPROP_TEXT,"ZERADO");
      ObjectSetInteger(0,_prefix_painel+"_POS_VL",OBJPROP_BGCOLOR,C'30,41,59');
      ObjectSetInteger(0,_prefix_painel+"_LOT_VL",OBJPROP_BGCOLOR,C'30,41,59');
     }
   else
     {
      ObjectSetInteger(0,_prefix_painel+"_POS_VL",OBJPROP_COLOR,C'248,250,252');
      ObjectSetInteger(0,_prefix_painel+"_LOT_VL",OBJPROP_COLOR,C'248,250,252');

      if(pos.volume > 0.0)
        {
         ObjectSetString(0,_prefix_painel+"_POS_VL",OBJPROP_TEXT,"COMPRADO");
         ObjectSetInteger(0,_prefix_painel+"_POS_VL",OBJPROP_BGCOLOR,C'22,163,74');
         ObjectSetInteger(0,_prefix_painel+"_LOT_VL",OBJPROP_BGCOLOR,C'22,163,74');
        }
      else
        {
         ObjectSetString(0,_prefix_painel+"_POS_VL",OBJPROP_TEXT,"VENDIDO");
         ObjectSetInteger(0,_prefix_painel+"_POS_VL",OBJPROP_BGCOLOR,C'220,38,38');
         ObjectSetInteger(0,_prefix_painel+"_LOT_VL",OBJPROP_BGCOLOR,C'220,38,38');
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::update_painel_history(const s_history &his)
  {
   if(!_visual || !m_painel || _minimizado)
      return;

   ObjectSetString(0,_prefix_painel+"_PRICE_VL",OBJPROP_TEXT,DoubleToString(his.entrada,M_DIGITS));
   ObjectSetString(0,_prefix_painel+"_MEDIO_VL",OBJPROP_TEXT,DoubleToString(his.medio,M_DIGITS));
   ObjectSetString(0,_prefix_painel+"_DIARIO_VL",OBJPROP_TEXT,DoubleToString(his.saldo_dia,2));
   ObjectSetInteger(0,_prefix_painel+"_DIARIO_VL",OBJPROP_COLOR,confirmar_cor(his.saldo_dia));
   ObjectSetString(0,_prefix_painel+"_SEMANAL_VL",OBJPROP_TEXT,DoubleToString(his.saldo_sem,2));
   ObjectSetInteger(0,_prefix_painel+"_SEMANAL_VL",OBJPROP_COLOR,confirmar_cor(his.saldo_sem));
   ObjectSetString(0,_prefix_painel+"_MENSAL_VL",OBJPROP_TEXT,DoubleToString(his.saldo_mes,2));
   ObjectSetInteger(0,_prefix_painel+"_MENSAL_VL",OBJPROP_COLOR,confirmar_cor(his.saldo_mes));
   ObjectSetString(0,_prefix_painel+"_TOTAL_VL",OBJPROP_TEXT,DoubleToString(his.saldo_total,2));
   ObjectSetInteger(0,_prefix_painel+"_TOTAL_VL",OBJPROP_COLOR,confirmar_cor(his.saldo_total));

   if(his.ult_time > 0)
     {
      ObjectSetString(0,_prefix_painel+"_ATUAL_VL1",OBJPROP_TEXT,TimeToString((datetime)his.ult_time,TIME_SECONDS));
      ObjectSetString(0,_prefix_painel+"_ATUAL_VL2",OBJPROP_TEXT," ");
     }
   else
     {
      ObjectSetString(0,_prefix_painel+"_ATUAL_VL1",OBJPROP_TEXT,"00:00:00");
      ObjectSetString(0,_prefix_painel+"_ATUAL_VL2",OBJPROP_TEXT," ");
     }

   double perfomace = (his.cnt_dia > 0) ? (double)(100*his.gains_dia)/his.cnt_dia : 0.0;
   string txt = StringFormat("%d/%d (%.1f%%)",his.gains_dia,his.cnt_dia,perfomace);
   ObjectSetString(0,_prefix_painel+"_DESEMPENHO_DIA_VL",OBJPROP_TEXT,txt);

   perfomace = (his.cnt_sem > 0) ? (double)(100*his.gains_sem)/his.cnt_sem : 0.0;
   txt = StringFormat("%d/%d (%.1f%%)",his.gains_sem,his.cnt_sem,perfomace);
   ObjectSetString(0,_prefix_painel+"_DESEMPENHO_SEM_VL",OBJPROP_TEXT,txt);

   perfomace = (his.cnt_mes > 0) ? (double)(100*his.gains_mes)/his.cnt_mes : 0.0;
   txt = StringFormat("%d/%d (%.1f%%)",his.gains_mes,his.cnt_mes,perfomace);
   ObjectSetString(0,_prefix_painel+"_DESEMPENHO_MES_VL",OBJPROP_TEXT,txt);

   perfomace = (his.cnt_total > 0) ? (double)(100*his.gains_total)/his.cnt_total : 0.0;
   txt = StringFormat("%d/%d (%.1f%%)",his.gains_total,his.cnt_total,perfomace);
   ObjectSetString(0,_prefix_painel+"_DESEMPENHO_TOTAL_VL",OBJPROP_TEXT,txt);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color GRAFICO::confirmar_cor(const double valor)
  {
   if(valor > 0.0)
      return C'74,222,128';
   else
      if(valor < 0.0)
         return C'248,113,113';

   return C'148,163,184';
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::update_painel_descritivo(const string msg)
  {
   if(!_visual || !m_painel || _minimizado)
      return;

   ObjectSetString(0,_prefix_painel+"_OPERACIONAL",OBJPROP_TEXT,msg);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::excluir_indicadores(void)
  {
   int total = (int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int i=total-1; i>=0; i--)
      for(int k=ChartIndicatorsTotal(0,i)-1; k>=0; k--)
        {
         string short_name = ChartIndicatorName(0,i,k);
         ChartIndicatorDelete(0,i,short_name);
        }

   IndicatorRelease(_handle_1);
   IndicatorRelease(_handle_2);
   IndicatorRelease(_handle_3);
   IndicatorRelease(_handle_4);
   IndicatorRelease(_handle_5);
   IndicatorRelease(_handle_6);
   IndicatorRelease(_handle_7);
   IndicatorRelease(_handle_8);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::check_linhas(void)
  {
   if(!criar_linha("ENT_0",STYLE_DASH))
      return false;

   if(m_grad_qtd > 0)
      for(int i=0; i<=m_grad_qtd; i++)
         if(!criar_linha("GIN_"+IntegerToString(i),STYLE_DASH))
            return false;

   for(int i=0; i<15; i++)
      if(!criar_linha("PEN_"+IntegerToString(i),STYLE_DASH))
         return false;

   if(!criar_linha("MED_0",STYLE_SOLID))
      return false;

   if(!criar_linha("CIN_0",STYLE_SOLID))
      return false;

   if(!criar_linha("VIN_0",STYLE_SOLID))
      return false;

   if(!criar_linha("OTP_0",STYLE_DASHDOT))
      return false;

   if(!criar_linha("OSL_0",STYLE_DASHDOT))
      return false;

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::criar_linha(const string nome, const ENUM_LINE_STYLE style)
  {
   ResetLastError();
   bool alvos = (nome == "OTP_0" || nome == "OSL_0") ? true : false;
   string txt = (alvos) ? StringSubstr(nome,1) : "";

   int x, y;
   ChartTimePriceToXY(0,0,0,DBL_MIN,x,y);

   x = 155;
   int xsize = (alvos) ? 50 : 130;
   int xdist = (alvos) ? x-18 : x-20;

   string line = _prefix_linha+nome;
   string fundo = line+"_FUNDO";
   string status = line+"_ETIQUETA";

   if(!ObjectCreate(0,line,OBJ_HLINE,0,0,DBL_MIN) ||
      !ObjectCreate(0,fundo,OBJ_RECTANGLE_LABEL,0,0,DBL_MIN) ||
      !ObjectCreate(0,status,OBJ_EDIT,0,0,DBL_MIN))
     {
      string msg = StringFormat("Erro %d ao criar a etiqueta da linha da ordem",GetLastError());
      filtro_log(msg);
      return false;
     }

   ObjectSetDouble(0,line,OBJPROP_PRICE,DBL_MIN);
   ObjectSetInteger(0,line,OBJPROP_COLOR,clrNONE);
   ObjectSetInteger(0,line,OBJPROP_STYLE,style);
   ObjectSetInteger(0,line,OBJPROP_WIDTH,1);
   ObjectSetInteger(0,line,OBJPROP_BACK,true);
   ObjectSetInteger(0,line,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,line,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,line,OBJPROP_ZORDER,1);

   set_obj(OBJ_RECTANGLE_LABEL,fundo,x,y,150,20,1,clrNONE,clrNONE,NULL,NULL,NULL,clrNONE);
   ObjectSetInteger(0,fundo,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

   set_obj(OBJ_EDIT,status,xdist,y,xsize,18,0,clrNONE,clrNONE,"Bahnschrift",08,txt,clrNONE);
   ObjectSetInteger(0,status,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

   if(alvos)
     {
      string lucro = line+"_LUCRO";

      if(!ObjectCreate(0,lucro,OBJ_EDIT,0,0,DBL_MIN))
        {
         string msg = StringFormat("Erro %d ao criar o lucro da ordem",GetLastError());
         filtro_log(msg);
         return false;
        }

      set_obj(OBJ_EDIT,lucro,xdist-xsize,y,80,16,0,clrNONE,clrNONE,"Bahnschrift",08,"0.00",clrNONE);
      ObjectSetInteger(0,lucro,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
     }

   if(nome != "ENT_0")
     {
      if(!m_pendente_parcial)
         if(nome == "PEN_10" || nome == "PEN_11" || nome == "PEN_12" || nome == "PEN_13")
            return true;

      if(!m_pendente_grad)
         if(nome == "GIN_0")
            return true;

      string button = line+"_BUTTON";

      if(!ObjectCreate(0,button,OBJ_BUTTON,0,0,DBL_MIN))
        {
         string msg = StringFormat("Erro %d ao criar o botão de controle da ordem",GetLastError());
         filtro_log(msg);
         return false;
        }

      set_obj(OBJ_BUTTON,button,x-3,y,16,16,0,clrNONE,clrNONE,"Arial",08,"X",clrNONE);
      ObjectSetInteger(0,button,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::gerenciar_linhas(const s_position &pos, const s_ordem &ord, const ulong &grad[], const double entrada, const double medio)
  {
   if(!_atualizar || !_visual || !m_tarjas)
      return;

   if(pos.volume == 0.00)
     {
      if(OrderSelect(ord.buy))
        {
         string txt = "Compra "+DoubleToString(OrderGetDouble(ORDER_VOLUME_CURRENT),_vol_digitos);
         atualizar_linha("CIN_0",txt,OrderGetDouble(ORDER_PRICE_OPEN),clrAqua);
        }
      else
         atualizar_linha("CIN_0","",DBL_MIN,clrNONE,true);

      if(OrderSelect(ord.sell))
        {
         string txt = "Venda "+DoubleToString(OrderGetDouble(ORDER_VOLUME_CURRENT),_vol_digitos);
         atualizar_linha("VIN_0",txt,OrderGetDouble(ORDER_PRICE_OPEN),clrAqua);
        }
      else
         atualizar_linha("VIN_0","",DBL_MIN,clrNONE,true);

      if(m_grad_qtd > 0)
         for(int i=0; i<=m_grad_qtd; i++)
            atualizar_linha("GIN_"+IntegerToString(i),"",DBL_MIN,clrNONE);

      for(int i=0; i<15; i++)
         atualizar_linha("PEN_"+IntegerToString(i),"",DBL_MIN,clrNONE);

      atualizar_linha("ENT_0","",DBL_MIN,clrNONE,false);
      atualizar_linha("MED_0","",DBL_MIN,clrNONE,true);
      atualizar_linha("OTP_0","",DBL_MIN,clrNONE,true);
      atualizar_linha("OSL_0","",DBL_MIN,clrNONE,true);
     }
   else
     {
      color  cor = (pos.volume > 0.00) ? clrSteelBlue : clrTomato;
      string txt = (pos.volume > 0.00) ? "Comprado " : "Vendido ";
      txt += DoubleToString(fabs(pos.volume),_vol_digitos);
      ENUM_ORDER_TYPE tipo = (pos.volume > 0.00) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
      double tp, sl;

      if(OrderCalcProfit(tipo,M_SYMBOL,fabs(pos.volume),medio,pos.tp,tp))
         atualizar_linha("OTP_0","TP",pos.tp,clrSeaGreen,tp);
      else
         atualizar_linha("OTP_0","",DBL_MIN,clrNONE);

      if(OrderCalcProfit(tipo,M_SYMBOL,fabs(pos.volume),medio,pos.sl,sl))
         atualizar_linha("OSL_0","SL",pos.sl,clrFireBrick,sl);
      else
         atualizar_linha("OSL_0","",DBL_MIN,clrNONE);

      atualizar_linha("ENT_0","ENTRADA",entrada,clrSilver);
      atualizar_linha("MED_0",txt,medio,cor);
      ulong ordem[15] = {ord.af1,ord.af2,ord.af3,ord.af4,ord.af5,ord.ac1,ord.ac2,ord.ac3,ord.ac4,ord.ac5,ord.p1,ord.p2,ord.p3,ord.p4,ord.out};

      for(int i=ArraySize(ordem)-1; i>=0; i--)
        {
         if(!OrderSelect(ordem[i]))
            continue;

         string txt = NULL;
         color  cor = clrNONE;

         if(i <= 9)
            cor = (pos.volume > 0.00) ? clrAqua : clrSalmon;
         else
            cor = (pos.volume > 0.00) ? clrRed : clrBlue;

         if(i >= 0 && i <= 4)
            txt = "Aumento (F"+IntegerToString(i+1)+") ";
         else
            if(i >= 5 && i <= 9)
               txt = "Aumento (C"+IntegerToString(i-4)+") ";
            else
               if(i >= 10 && i <= 13)
                  txt = "Parcial (P"+IntegerToString(i-9)+") ";
               else
                  txt = "Saída ";

         txt += DoubleToString(OrderGetDouble(ORDER_VOLUME_CURRENT),_vol_digitos);
         atualizar_linha("PEN_"+IntegerToString(i),txt,OrderGetDouble(ORDER_PRICE_OPEN),cor);
        }

      for(int i=ArraySize(grad)-1; i>=0; i--)
        {
         if(!OrderSelect(grad[i]))
            if(i == 0 && m_grad_qtd > 0 && !m_pendente_grad)
               continue;
            else
              {
               atualizar_linha("GIN_"+IntegerToString(i),"",DBL_MIN,clrNONE);
               continue;
              }

         string txt = NULL;
         color  cor = clrNONE;

         switch(i)
           {
            case 0:
               txt = "Gradiente (TP) ";
               cor = clrGreenYellow;
               break;
            default:
               txt = "Gradiente ("+IntegerToString(i)+") ";
               cor = (pos.volume > 0.00) ? clrAqua : clrSalmon;
               break;
           }

         txt += DoubleToString(OrderGetDouble(ORDER_VOLUME_CURRENT),_vol_digitos);
         atualizar_linha("GIN_"+IntegerToString(i),txt,OrderGetDouble(ORDER_PRICE_OPEN),cor);
        }
     }

   _atualizar = false;
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::atualizar_linha(const string nome, const string txt, const double price, const color cor, const double saldo=0)
  {
   int x, y;
   string line = _prefix_linha+nome;
   string fundo = line+"_FUNDO";
   string status = line+"_ETIQUETA";
   string button = line+"_BUTTON";
   string lucro = line+"_LUCRO";

   ChartTimePriceToXY(0,0,0,price,x,y);
   y -= 10;

   ObjectSetDouble(0,line,OBJPROP_PRICE,price);
   ObjectSetInteger(0,line,OBJPROP_BGCOLOR,cor);
   ObjectSetInteger(0,line,OBJPROP_BORDER_COLOR,cor);
   ObjectSetInteger(0,line,OBJPROP_COLOR,cor);

   ObjectSetInteger(0,fundo,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,fundo,OBJPROP_BGCOLOR,cor);
   ObjectSetInteger(0,fundo,OBJPROP_BORDER_COLOR,cor);
   ObjectSetInteger(0,fundo,OBJPROP_COLOR,cor);

   ObjectSetInteger(0,status,OBJPROP_YDISTANCE,y+1);
   ObjectSetInteger(0,status,OBJPROP_BGCOLOR,cor);
   ObjectSetInteger(0,status,OBJPROP_BORDER_COLOR,cor);
   ObjectSetInteger(0,status,OBJPROP_COLOR,clrBlack);
   ObjectSetString(0,status,OBJPROP_TEXT,txt);

   if(nome == "OTP_0" || nome == "OSL_0")
     {
      color cor2 = (saldo < 0.00) ? clrOrangeRed : clrMediumSpringGreen;

      ObjectSetInteger(0,lucro,OBJPROP_BGCOLOR,cor2);
      ObjectSetInteger(0,lucro,OBJPROP_BORDER_COLOR,cor2);
      ObjectSetInteger(0,lucro,OBJPROP_COLOR,clrBlack);
      ObjectSetString(0,lucro,OBJPROP_TEXT,DoubleToString(saldo,2));
      ObjectSetInteger(0,lucro,OBJPROP_YDISTANCE,y+2);
     }

   if(nome != "ENT_0")
     {
      ObjectSetInteger(0,button,OBJPROP_BGCOLOR,clrBlack);
      ObjectSetInteger(0,button,OBJPROP_BORDER_COLOR,clrBlack);
      ObjectSetInteger(0,button,OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,button,OBJPROP_YDISTANCE,y+3);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GRAFICO::modificar_linha(const string nome, const string etiqueta, const string ticket, const bool remover)
  {
   int id = (int)StringToInteger(ticket);
   double linha = in_pro.normalizar(ObjectGetDouble(0,nome,OBJPROP_PRICE));

   if(etiqueta == "PEN" || etiqueta == "GIN")
     {
      string ordens[15] = {"AF1#","AF2#","AF3#","AF4#","AF5#","AC1#","AC2#","AC3#","AC4#","AC5#","SP1#","SP2#","SP3#","SP4#","OUT#"};
      string compare = (etiqueta == "PEN") ? ordens[id] : (etiqueta+"#"+ticket+"#");

      if(compare == "GIN#0#")
         compare = "GTP#";

      for(int i=OrdersTotal()-1; i>=0; i--)
        {
         ulong ticket = OrderGetTicket(i);
         if(!OrderSelect(ticket))
            continue;

         if(OrderGetInteger(ORDER_MAGIC) != m_magic)
            continue;

         if(OrderGetString(ORDER_SYMBOL) != M_SYMBOL)
            continue;

         string comentario = OrderGetString(ORDER_COMMENT);
         string coment = (etiqueta == "PEN") ? StringSubstr(comentario,0,4) : StringSubstr(comentario,0,StringLen(compare));

         if(coment == compare)
           {
            double price = OrderGetDouble(ORDER_PRICE_OPEN);
            double sl = OrderGetDouble(ORDER_SL);
            double tp = OrderGetDouble(ORDER_TP);
            double vol = OrderGetDouble(ORDER_VOLUME_CURRENT);
            string coment = OrderGetString(ORDER_COMMENT);
            ENUM_ORDER_TYPE tipo = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);

            if(remover)
               return in_pro.enviar_ordem(TRADE_ACTION_REMOVE,tipo,price,ticket);
            else
               if(price != linha)
                  return in_pro.enviar_ordem(TRADE_ACTION_MODIFY,tipo,linha,ticket,tp,sl,vol,coment);

            break;
           }
        }
     }
   else
     {
      s_position pos = in_pro.posicao();
      ulong ticket = pos.ticket;

      if(PositionSelectByTicket(ticket))
        {
         double price = PositionGetDouble(POSITION_PRICE_OPEN);
         double sl = PositionGetDouble(POSITION_SL);
         double tp = PositionGetDouble(POSITION_TP);
         double vol = PositionGetDouble(POSITION_VOLUME);
         string coment = PositionGetString(POSITION_COMMENT);
         ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         if(etiqueta == "OSL")
           {
            if(remover)
               return in_pro.enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,tp,0.00,0,coment);
            else
               if(linha != sl)
                  return in_pro.enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,tp,linha,0,coment);
           }
         else
            if(etiqueta == "OTP")
              {
               if(remover)
                  return in_pro.enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,0.00,sl,0,coment);
               else
                  if(linha != tp)
                     return in_pro.enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,linha,sl,0,coment);
              }
            else
               if(etiqueta == "MED")
                  if(remover)
                    {
                     in_pro.zeragem_compulsoria();
                     return true;
                    }
        }
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::processar_grafico(const int id, const long lparam, const double dparam, const string sparam)
  {
   if(id == CHARTEVENT_OBJECT_CLICK)
      if(StringFind(sparam,_prefix_painel+"_BOL_") == 0)
        {
         string botao = sparam;
         StringReplace(botao,_prefix_painel+"_BOL_","_");
         processar_boleta(botao);
         return;
        }

   if(!_tarja.mover)
     {
      if(id == CHARTEVENT_OBJECT_CLICK)
         if(StringFind(sparam,_prefix_linha) == 0)
           {
            string arr[];
            ushort caracter = StringGetCharacter("_",0);

            if(StringSplit(sparam,caracter,arr) < 5)
              {
               filtro_log("Falha em selecionar a etiqueta");
               return;
              }

            _tarja.etiqueta = arr[3];
            _tarja.ticket = arr[4];
            bool remover = (StringFind(sparam,"_BUTTON") > 0) ? true : false;
            StringConcatenate(_tarja.linha,_prefix_linha,_tarja.etiqueta,"_",_tarja.ticket);
            _tarja.confirmado = (ObjectFind(0,_tarja.linha) == 0) ? true : false;
            printf("etiqueta %s (%d) -> %s (%s) digitos %d",_tarja.etiqueta,_tarja.ticket,_tarja.linha,(string)_tarja.confirmado);

            if(!_tarja.confirmado)
               ZeroMemory(_tarja);
            else
               if(remover)
                  modificar_linha(_tarja.linha,_tarja.etiqueta,_tarja.ticket,true);
               else
                  if(_tarja.etiqueta != "ENT")
                     if(_tarja.etiqueta != "MED")
                       {
                        int id = (int)StringToInteger(_tarja.ticket);

                        if(!m_pendente_parcial)
                           if(_tarja.etiqueta == "PEN" && id >= 10 && id <= 13)
                              return;

                        if(!m_pendente_grad)
                           if(_tarja.etiqueta == "GIN" && id == 0)
                              return;

                        ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
                       }
           }
     }
   else
      if(_tarja.confirmado)
         if(id == CHARTEVENT_CLICK)
           {
            modificar_linha(_tarja.linha,_tarja.etiqueta,_tarja.ticket,false);
            ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,false);
            ZeroMemory(_tarja);
            _atualizar = true;
           }

   if(_tarja.confirmado)
      if(id == CHARTEVENT_MOUSE_MOVE)
        {
         double last = ObjectGetDouble(0,_tarja.linha,OBJPROP_PRICE);
         int windown, y=(int)dparam-10;
         datetime time;
         double price;

         ChartXYToTimePrice(0,1,(int)dparam,windown,time,price);
         ObjectSetDouble(0,_tarja.linha,OBJPROP_PRICE,price);
         ObjectSetInteger(0,_tarja.linha+"_FUNDO",OBJPROP_YDISTANCE,y);
         ObjectSetInteger(0,_tarja.linha+"_ETIQUETA",OBJPROP_YDISTANCE,y+1);
         ObjectSetInteger(0,_tarja.linha+"_LUCRO",OBJPROP_YDISTANCE,y+2);
         ObjectSetInteger(0,_tarja.linha+"_BUTTON",OBJPROP_YDISTANCE,y+3);
         _tarja.mover = true;
         ChartRedraw();
        }

   if(id == CHARTEVENT_CHART_CHANGE)
     {
      double max = ChartGetDouble(0,CHART_PRICE_MAX);
      double min = ChartGetDouble(0,CHART_PRICE_MIN);
      static double last_max = 0;
      static double last_min = 0;

      if(last_max != max || last_min != min)
        {
         for(int i=ObjectsTotal(0,0,OBJ_HLINE)-1; i>=0; i--)
           {
            string name = ObjectName(0,i,0,OBJ_HLINE);

            if(StringFind(name,_prefix_linha) < 0)
               continue;

            int x, y;
            double price = ObjectGetDouble(0,name,OBJPROP_PRICE);
            ChartTimePriceToXY(0,0,0,price,x,y);
            y -= 10;

            ObjectSetInteger(0,name+"_FUNDO",OBJPROP_YDISTANCE,y);
            ObjectSetInteger(0,name+"_ETIQUETA",OBJPROP_YDISTANCE,y+1);
            ObjectSetInteger(0,name+"_LUCRO",OBJPROP_YDISTANCE,y+2);
            ObjectSetInteger(0,name+"_BUTTON",OBJPROP_YDISTANCE,y+3);
           }

         last_max = max;
         last_min = min;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GRAFICO::processar_boleta(const string botao)
  {
   if(botao == "_MINIMIZAR")
     {
      ObjectsDeleteAll(0,_prefix_painel,0);

      if(_minimizado)
        {
         criar_painel();
         filtro_log("Painel maximizado");
        }
      else
        {
         minimizar_painel();
         filtro_log("Painel minimizado");
        }
     }
   else
      if(botao == "_ON")
        {
         ObjectSetInteger(0,_prefix_painel+"_BOL_ON",OBJPROP_BGCOLOR,C'22,163,74');
         ObjectSetInteger(0,_prefix_painel+"_BOL_OFF",OBJPROP_BGCOLOR,C'51,65,85');
         ObjectSetInteger(0,_prefix_painel+"_BOL_ON",OBJPROP_STATE,true);
         ObjectSetInteger(0,_prefix_painel+"_BOL_OFF",OBJPROP_STATE,false);
         _operar = true;
         filtro_log("Expert habilitado");
         update_painel_descritivo("Expert habilitado");
        }
      else
         if(botao == "_OFF")
           {
            ObjectSetInteger(0,_prefix_painel+"_BOL_ON",OBJPROP_BGCOLOR,C'51,65,85');
            ObjectSetInteger(0,_prefix_painel+"_BOL_OFF",OBJPROP_BGCOLOR,C'220,38,38');
            ObjectSetInteger(0,_prefix_painel+"_BOL_ON",OBJPROP_STATE,false);
            ObjectSetInteger(0,_prefix_painel+"_BOL_OFF",OBJPROP_STATE,true);
            _operar = false;
            filtro_log("Expert desabilitado");
            update_painel_descritivo("Expert desabilitado");
           }
         else
           {
            string txt = StringSubstr(botao,1);
            filtro_log("Pressionado botão "+txt);

            if(botao == "_BUFFERS")
               in_pro.check_buffers();
            else
               if(botao == "_MAX" || botao == "_MIN")
                 {
                  double step = SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_STEP);
                  double vol = NormalizeDouble(StringToDouble(ObjectGetString(0,_prefix_painel+"_VOL",OBJPROP_TEXT)),_vol_digitos);
                  _boleta = (botao == "_MIN") ? fmax(vol-step,SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_MIN)) : fmin(vol+step,SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_MAX));
                  ObjectSetString(0,_prefix_painel+"_VOL",OBJPROP_TEXT,DoubleToString(_boleta,_vol_digitos));
                 }
               else
                  if(botao == "_ZERAR")
                     in_pro.zeragem_compulsoria();
                  else
                     if(botao == "_INVERTER" || botao == "_COMPRAR" || botao == "_VENDER")
                       {
                        s_position pos = in_pro.posicao();

                        if(botao == "_COMPRAR")
                          {
                           string coment = (_boleta <= fabs(pos.volume) && pos.volume < 0) ? "RED#" : "AUM#";
                           in_pro.enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_BUY,SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK),0,0,0,_boleta,coment);
                          }
                        else
                           if(botao == "_VENDER")
                             {
                              string coment = (_boleta <= fabs(pos.volume) && pos.volume > 0) ? "RED#" : "AUM#";
                              in_pro.enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_SELL,SymbolInfoDouble(M_SYMBOL,SYMBOL_BID),0,0,0,_boleta,coment);
                             }
                           else
                              if(botao == "_INVERTER")
                                 if(fabs(pos.volume) > 0.00)
                                    if(pos.volume > 0)
                                       in_pro.enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_SELL,SymbolInfoDouble(M_SYMBOL,SYMBOL_BID),0,0,0,fabs(pos.volume*2),"VIN#");
                                    else
                                       in_pro.enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_BUY,SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK),0,0,0,fabs(pos.volume*2),"CIN#");
                       }

            ObjectSetInteger(0,_prefix_painel+"_BOL"+botao,OBJPROP_STATE,true);
            Sleep(150);
            ObjectSetInteger(0,_prefix_painel+"_BOL"+botao,OBJPROP_STATE,false);
           }

   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void HORARIO::set_horario(void)
  {
   string hora_inicio = IntegerToString(m_hr_inicio)+":"+IntegerToString(m_min_inicio);
   string hora_final = IntegerToString(m_hr_final)+":"+IntegerToString(m_min_final);
   string hora_zerar = IntegerToString(m_hr_zerar)+":"+IntegerToString(m_min_zerar);

   TimeToStruct(StringToTime(hora_inicio),_time_inicio);
   TimeToStruct(StringToTime(hora_final),_time_parar);
   TimeToStruct(StringToTime(hora_zerar),_time_zerar);
   TimeToStruct(TimeCurrent(),_time_corrente);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HORARIO::horario_zeragem(void)
  {
   if(m_zerar == false)
      return false;

   if(_time_corrente.hour > _time_zerar.hour || (_time_corrente.hour == _time_zerar.hour && _time_corrente.min >= _time_zerar.min))
     {
      filtro_log("Horário de zeragem compulsória");
      return true;
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HORARIO::horario_operacional(void)
  {
   if(_time_inicio.hour == _time_parar.hour)
      if(_time_inicio.min == _time_parar.min)
         return true;

   if(_time_corrente.hour > _time_inicio.hour || (_time_corrente.hour == _time_inicio.hour && _time_corrente.min >= _time_inicio.min))
      if(_time_corrente.hour < _time_parar.hour || (_time_corrente.hour == _time_parar.hour && _time_corrente.min < _time_parar.min))
         return true;

   filtro_log("Fora do horário operacional");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HORARIO::check_barra(const bool candle_out, const datetime time)
  {
   bool block = (candle_out) ? _block_out : _block_in;
   if(!block)
      return true;

   if(time > 0)
      if(iTime(M_SYMBOL,m_timeframe,0) <= time)
        {
         if(block)
            filtro_log("Vela de saída bloqueada por execução");
         else
            filtro_log("Vela de entrada bloqueada por execução");

         return false;
        }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void HORARIO::atualizar_hora(void)
  {
   TimeToStruct(TimeCurrent(),_time_corrente);

   if(m_painel)
     {
      datetime proxima = iTime(_Symbol,_Period,0)+PeriodSeconds(_Period);
      datetime tempo = proxima-TimeCurrent();
      double   ontem = iClose(_Symbol,PERIOD_D1,1);
      double   osc = iClose(_Symbol,PERIOD_D1,0)/(ontem == 0 ? DBL_MIN+1 : ontem);

      ObjectSetString(0,_prefix_painel+"_OSC_VL",OBJPROP_TEXT,DoubleToString((osc*100)-100,2)+"%");
      ObjectSetString(0,_prefix_painel+"_CANDLE_VL",OBJPROP_TEXT,(tempo >= 0 ? TimeToString(tempo,TIME_SECONDS) : "--:--:--"));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HORARIO::horario_espera(void)
  {
   if(m_pausa_1_tempo > 0)
      if(m_pausa_1_dia == es_diariamente || m_pausa_1_dia == _time_corrente.day_of_week)
         if(_time_corrente.hour > m_pausa_1_hr || (_time_corrente.hour == m_pausa_1_hr && _time_corrente.min >= m_pausa_1_min))
           {
            string h = IntegerToString(m_pausa_1_hr)+":"+IntegerToString(m_pausa_1_min);
            datetime hora = StringToTime(h);

            if(!check_temporizador(hora,m_pausa_1_tempo,m_pausa_ref))
              {
               filtro_log("Horário de pausa 1 acionado");
               return true;
              }
           }

   if(m_pausa_2_tempo > 0)
      if(m_pausa_2_dia == es_diariamente || m_pausa_2_dia == _time_corrente.day_of_week)
         if(_time_corrente.hour > m_pausa_2_hr || (_time_corrente.hour == m_pausa_2_hr && _time_corrente.min >= m_pausa_2_min))
           {
            string h = IntegerToString(m_pausa_2_hr)+":"+IntegerToString(m_pausa_2_min);
            datetime hora = StringToTime(h);

            if(!check_temporizador(hora,m_pausa_2_tempo,m_pausa_ref))
              {
               filtro_log("Horário de pausa 2 acionado");
               return true;
              }
           }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
s_position CONTROLE::posicao(void)
  {
   s_position pos;
   ZeroMemory(pos);
   int limit = PositionsTotal();
   ulong last_buy = 0;
   ulong last_sell = 0;

   for(int i=0; i<limit; i++)
     {
      ulong ticket = PositionGetTicket(i);
      PositionSelectByTicket(ticket);

      if(PositionGetString(POSITION_SYMBOL) != M_SYMBOL)
         continue;

      if(PositionGetInteger(POSITION_MAGIC) != m_magic)
         continue;

      ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      datetime hora = (datetime)PositionGetInteger(POSITION_TIME);
      double price = PositionGetDouble(POSITION_PRICE_OPEN);
      double sl = PositionGetDouble(POSITION_SL);
      double tp = PositionGetDouble(POSITION_TP);
      double volume = PositionGetDouble(POSITION_VOLUME);
      pos.lucro += PositionGetDouble(POSITION_PROFIT);

      if(tipo == POSITION_TYPE_BUY)
        {
         last_buy = ticket;
         pos.volume += volume;
        }
      else
        {
         last_sell = ticket;
         pos.volume -= volume;
        }

      if(hora < pos.hora || pos.hora == 0)
        {
         pos.ticket = ticket;
         pos.sl = sl;
         pos.tp = tp;
         pos.hora = hora;
        }
      else
         if(sl != pos.sl || tp != pos.tp)
            in_pro.enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,pos.tp,pos.sl,volume,PositionGetString(POSITION_COMMENT));

      if(i == limit-1)
         if(last_buy > 0 && last_sell > 0)
            if(in_pro.enviar_ordem(TRADE_ACTION_CLOSE_BY,ORDER_TYPE_BUY,0,last_buy,0,0,0,NULL,last_sell))
              {
               limit = PositionsTotal();
               i = -1;
              }
     }

   update_painel_position(pos);
   return pos;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
s_ordem CONTROLE::ordens(ulong &grad_ticket[], const datetime abertura, const double pos_tp=0.00, const double pos_sl=0.00)
  {
   s_ordem ord;
   ZeroMemory(ord);
   ZeroMemory(grad_ticket);

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong ticket = OrderGetTicket(i);
      if(OrderSelect(ticket) == false)
         continue;

      if(OrderGetInteger(ORDER_MAGIC) != m_magic)
         continue;

      if(OrderGetString(ORDER_SYMBOL) != M_SYMBOL)
         continue;

      ENUM_ORDER_TYPE tipo = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      if(tipo == ORDER_TYPE_BUY || tipo == ORDER_TYPE_SELL || tipo == ORDER_TYPE_CLOSE_BY)
         continue;

      string comentario = OrderGetString(ORDER_COMMENT);
      string coment = StringSubstr(comentario,0,4);
      double price = OrderGetDouble(ORDER_PRICE_OPEN);
      ENUM_ORDER_STATE state = (ENUM_ORDER_STATE)OrderGetInteger(ORDER_STATE);
      datetime hora = (datetime)OrderGetInteger(ORDER_TIME_SETUP);
      bool repetida = false;

      if(coment == "GIN#")
        {
         int id = (int)StringSubstr(comentario,4,StringFind(comentario,"#",4)-4);

         if(id > m_grad_qtd || id < 0)
            filtro_log("Divergência nas ordens do gradiente");
         else
            if(grad_ticket[id] == 0)
               grad_ticket[id] = ticket;
            else
               repetida = true;
        }
      else
        {
         string nome[18] = {"AF1#","AF2#","AF3#","AF4#","AF5#","AC1#","AC2#","AC3#","AC4#","AC5#","SP1#","SP2#","SP3#","SP4#","CIN#","VIN#","OUT#","GTP#"};
         ulong  ordem[18] = {ord.af1,ord.af2,ord.af3,ord.af4,ord.af5,ord.ac1,ord.ac2,ord.ac3,ord.ac4,
                             ord.ac5,ord.p1,ord.p2,ord.p3,ord.p4,ord.buy,ord.sell,ord.out,grad_ticket[0]
                            };

         for(int k=0; k<18; k++)
            if(coment == nome[k])
               if(ordem[k] > 0)
                  repetida = true;
               else
                 {
                  switch(k)
                    {
                     case 0:
                        ord.af1 = ticket;
                        break;
                     case 1:
                        ord.af2 = ticket;
                        break;
                     case 2:
                        ord.af3 = ticket;
                        break;
                     case 3:
                        ord.af4 = ticket;
                        break;
                     case 4:
                        ord.af5 = ticket;
                        break;
                     case 5:
                        ord.ac1 = ticket;
                        break;
                     case 6:
                        ord.ac2 = ticket;
                        break;
                     case 7:
                        ord.ac3 = ticket;
                        break;
                     case 8:
                        ord.ac4 = ticket;
                        break;
                     case 9:
                        ord.ac5 = ticket;
                        break;
                     case 10:
                        ord.p1 = ticket;
                        break;
                     case 11:
                        ord.p2 = ticket;
                        break;
                     case 12:
                        ord.p3 = ticket;
                        break;
                     case 13:
                        ord.p4 = ticket;
                        break;
                     case 14:
                        ord.buy = ticket;
                        break;
                     case 15:
                        ord.sell = ticket;
                        break;
                     case 16:
                        ord.out = ticket;
                        if(m_cancel_out > 0)
                           if(hora+m_cancel_out <= TimeCurrent())
                              repetida = true;
                        break;
                     case 17:
                        grad_ticket[0] = ticket;
                        break;
                    }
                  break;
                 }
        }

      if(coment == "VIN#" || coment == "CIN#")
        {
         if(!in_pro.horario_operacional())
            repetida = true;

         if(!repetida)
            if(in_pro.horario_zeragem())
               repetida = true;
            else
               if(m_cancel_in > 0)
                  if(hora+m_cancel_in <= TimeCurrent())
                     repetida = true;
        }
      else
         if(coment != "SP1#" && coment != "SP2#" && coment != "SP3#" && coment != "SP4#" && coment != "OUT#" && coment != "GIN#" && coment != "GTP#")
           {
            double tp = OrderGetDouble(ORDER_TP);
            double sl = OrderGetDouble(ORDER_SL);

            if(tipo ==  ORDER_TYPE_BUY_STOP || tipo ==  ORDER_TYPE_BUY_LIMIT)
              {
               if((price >= pos_tp && pos_tp > 0.00) || price <= pos_sl)
                  repetida = true;
              }
            else
               if(price <= pos_tp || (price >= pos_sl && pos_sl > 0.00))
                  repetida = true;

            if(!repetida)
               if(sl != pos_sl || tp != pos_tp)
                  in_pro.enviar_ordem(TRADE_ACTION_MODIFY,tipo,price,ticket,pos_tp,pos_sl,OrderGetDouble(ORDER_VOLUME_CURRENT),comentario);
           }

      if(repetida || (coment != "VIN#" && coment != "CIN#" && (hora < abertura || abertura == 0)))
         if(state != ORDER_STATE_PARTIAL || repetida)
            in_pro.enviar_ordem(TRADE_ACTION_REMOVE,tipo,price,ticket);
     }

   return ord;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
s_history CONTROLE::historico(int &grad_qtd[], const datetime abertura=0, const bool iniciar=false)
  {
   static s_history his = {0};
   static int last_total = 0;
   static datetime last_data = 0;

   datetime hora_atual = TimeCurrent();
   datetime dia = StringToTime(TimeToString(hora_atual,TIME_DATE));

   HistorySelect(0,hora_atual+2);
   int total = HistoryDealsTotal();

   if(total != last_total || dia > last_data || iniciar)
     {
      _atualizar = true;
      ZeroMemory(his);
      ZeroMemory(grad_qtd);
     }
   else
      return his;

   datetime sem = iTime(M_SYMBOL,PERIOD_W1,0);
   datetime mes = iTime(M_SYMBOL,PERIOD_MN1,0);
   int ganhos_dia = 0;
   int ganhos_sem = 0;
   int ganhos_mes = 0;
   int ganhos_tot = 0;
   double vol = 0.00;
   ulong grad[];

   for(int i=0; i<total; i++)
     {
      ulong ticket = HistoryDealGetTicket(i);
      if(ticket <= 0)
         continue;

      ENUM_DEAL_TYPE tipo = (ENUM_DEAL_TYPE)HistoryDealGetInteger(ticket,DEAL_TYPE);

      if(tipo != DEAL_TYPE_BUY && tipo != DEAL_TYPE_SELL)
         continue;

      string   simbolo = HistoryDealGetString(ticket,DEAL_SYMBOL);
      ulong    magic = HistoryDealGetInteger(ticket,DEAL_MAGIC);
      datetime hora = (datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
      double   lucro = HistoryDealGetDouble(ticket,DEAL_PROFIT);
      ENUM_DEAL_REASON reason = (ENUM_DEAL_REASON)HistoryDealGetInteger(ticket,DEAL_REASON);

      if(simbolo == M_SYMBOL || !m_ativo_conta)
         if((magic == 0 && !m_manual_conta) ||
            (magic > 0 && (!m_expert_conta || (magic >= m_ticket_min_conta && magic <= m_ticket_max_conta))))
           {
            datetime referencia_conta = hora_atual+1;

            switch(m_refere_conta)
              {
               case es_dia:
                  referencia_conta = dia;
                  break;
               case es_sem:
                  referencia_conta = sem;
                  break;
               case es_mes:
                  referencia_conta = mes;
                  break;
               default:
                  break;
              }

            if(hora >= referencia_conta)
               his.saldo_conta += lucro;

            if(his.saldo_conta > his.max_conta)
               his.max_conta = his.saldo_conta;

            if(his.saldo_conta < his.min_conta)
               his.min_conta = his.saldo_conta;
           }

      if(magic == m_magic)
         if(simbolo == M_SYMBOL)
           {
            double volume = HistoryDealGetDouble(ticket,DEAL_VOLUME);
            double price = HistoryDealGetDouble(ticket,DEAL_PRICE);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)HistoryDealGetInteger(ticket,DEAL_ENTRY);

            if(tipo == DEAL_TYPE_SELL)
               volume *= -1;

            if(hora >= dia)
              {
               his.saldo_dia += lucro;

               if(entry != DEAL_ENTRY_IN)
                 {
                  his.cnt_dia++;

                  if(lucro > 0.00)
                     his.gains_dia++;

                  if(entry == DEAL_ENTRY_OUT_BY)
                     ganhos_dia++;
                 }
              }

            if(hora >= sem)
              {
               his.saldo_sem += lucro;

               if(entry != DEAL_ENTRY_IN)
                 {
                  his.cnt_sem++;

                  if(lucro > 0.00)
                     his.gains_sem++;

                  if(entry == DEAL_ENTRY_OUT_BY)
                     ganhos_sem++;
                 }
              }

            if(hora >= mes)
              {
               his.saldo_mes += lucro;

               if(entry != DEAL_ENTRY_IN)
                 {
                  his.cnt_mes++;

                  if(lucro > 0.00)
                     his.gains_mes++;

                  if(entry == DEAL_ENTRY_OUT_BY)
                     ganhos_mes++;
                 }
              }

            switch(m_refere)
              {
               case es_dia:
                  his.saldo = his.saldo_dia;
                  his.cnt = his.cnt_dia;
                  his.gains = his.gains_dia;
                  break;
               case es_sem:
                  his.saldo = his.saldo_sem;
                  his.cnt = his.cnt_sem;
                  his.gains = his.gains_sem;
                  break;
               case es_mes:
                  his.saldo = his.saldo_mes;
                  his.cnt = his.cnt_mes;
                  his.gains = his.gains_mes;
                  break;
               default:
                  break;
              }

            his.saldo_total += lucro;

            if(entry != DEAL_ENTRY_IN)
              {
               his.cnt_total++;

               if(lucro > 0.00)
                  his.gains_total++;

               if(his.saldo > his.max)
                  his.max = his.saldo;

               if(his.saldo < his.min)
                  his.min = his.saldo;

               if(entry == DEAL_ENTRY_OUT_BY)
                  ganhos_tot++;
              }

            if(hora >= his.ult_time)
               his.ult_time = hora;

            if(abertura > 0)
               if(hora >= abertura)
                 {
                  if(hora == abertura)
                     if(his.entrada == 0)
                        his.entrada = price;

                  string comentario = HistoryDealGetString(ticket,DEAL_COMMENT);
                  string coment = StringSubstr(comentario,0,4);

                  if(coment == "GIN#" || coment == "GTP#")
                    {
                     if(entry != DEAL_ENTRY_OUT_BY)
                       {
                        int pos = ArraySize(grad);

                        if(coment == "GTP#")
                          {
                           grad_qtd[0]++;
                           if(pos > 0)
                             {
                              ArrayRemove(grad,pos,1);
                              ArrayResize(grad,pos-1,1);
                             }
                          }
                        else
                          {
                           int id = (int)StringSubstr(comentario,4,StringFind(comentario,"#",4)-4);

                           if(id > m_grad_qtd || id < 0)
                              filtro_log("Divergência no histórico do gradiente");
                           else
                             {
                              ArrayResize(grad,pos+1,1);
                              grad[pos] = ticket;
                              grad_qtd[id]++;
                             }
                          }
                       }
                    }
                  else
                     if(coment == "AF1#")
                        his.af1 = ticket;
                     else
                        if(coment == "AF2#")
                           his.af2 = ticket;
                        else
                           if(coment == "AF3#")
                              his.af3 = ticket;
                           else
                              if(coment == "AF4#")
                                 his.af4 = ticket;
                              else
                                 if(coment == "AF5#")
                                    his.af5 = ticket;
                                 else
                                    if(coment == "AC1#")
                                       his.ac1 = ticket;
                                    else
                                       if(coment == "AC2#")
                                          his.ac2 = ticket;
                                       else
                                          if(coment == "AC3#")
                                             his.ac3 = ticket;
                                          else
                                             if(coment == "AC4#")
                                                his.ac4 = ticket;
                                             else
                                                if(coment == "AC5#")
                                                   his.ac5 = ticket;
                                                else
                                                   if(coment == "SP1#")
                                                      his.p1 = ticket;
                                                   else
                                                      if(coment == "SP2#")
                                                         his.p2 = ticket;
                                                      else
                                                         if(coment == "SP3#")
                                                            his.p3 = ticket;
                                                         else
                                                            if(coment == "SP4#")
                                                               his.p4 = ticket;

                  if(coment != "RED#")
                     if(_ajustar || (coment != "SP1#" && coment != "SP2#" && coment != "SP3#" && coment != "SP4#" && coment != "GTP#"))
                        if(entry != DEAL_ENTRY_OUT_BY)
                          {
                           vol += volume;
                           his.medio += (price*volume);
                          }
                 }
           }
     }

   last_data = dia;
   last_total = total;
   his.medio = (vol == 0.00) ? 0.00 : fabs(his.medio/vol);

   if(his.entrada > 0.00 && his.medio <= 0.00)
      his.medio = his.entrada;

   if(m_grad_qtd > 0)
     {
      int pos = ArraySize(grad);

      if(pos > 0)
         if(grad[pos-1] > 0)
            his.last = grad[pos-1];
     }

   his.cnt_dia -= (int)(ganhos_dia*0.5);
   his.cnt_sem -= (int)(ganhos_sem*0.5);
   his.cnt_mes -= (int)(ganhos_mes*0.5);
   his.cnt_total -= (int)(ganhos_tot*0.5);

   update_painel_history(his);
   return his;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_volumes(void)
  {
   if(!check_volume_inicial(m_volume))
      return false;

   if(m_grad_qtd > 0 && m_gra_dis > 0)
      if(!check_volume_inicial(m_grad_vol))
         return false;

   double dis[14] = {m_af1_dis,m_af2_dis,m_af3_dis,m_af4_dis,m_af5_dis,m_ac1_dis,m_ac2_dis,m_ac3_dis,m_ac4_dis,m_ac5_dis,
                     fabs(m_p1_dis),fabs(m_p2_dis),fabs(m_p3_dis),fabs(m_p4_dis)
                    };
   double lot[14] = {m_af1_lot,m_af2_lot,m_af3_lot,m_af4_lot,m_af5_lot,m_ac1_lot,m_ac2_lot,m_ac3_lot,m_ac4_lot,m_ac5_lot,
                     m_p1_lot,m_p2_lot,m_p3_lot,m_p4_lot
                    };

   for(int i=0; i<14; i++)
      if(dis[i] > 0 && lot[i] > 0)
         if(!check_volume_inicial(lot[i]))
            return false;

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_volume_inicial(const double volume)
  {
   double max = SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_MAX);
   double min = SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_MIN);
   double step = SymbolInfoDouble(M_SYMBOL,SYMBOL_VOLUME_STEP);
   double resto = NormalizeDouble(MathMod(volume*100000,step*100000),0);

   if(_vol_digitos < 0)
     {
      for(int i=0; i<5; i++)
         if(pow(10,i)*min >= 1.00)
           {
            _vol_digitos = i;
            break;
           }

      for(int i=fmax(_vol_digitos,0); i<5; i++)
         if(pow(10,i)*step >= 1.00)
           {
            _vol_digitos = i;
            break;
           }
     }

   if(volume < min || volume > max)
     {
      string msg = "Volume de "+DoubleToString(volume,_vol_digitos)+" fora da faixa de "+DoubleToString(min,_vol_digitos)+" a "+DoubleToString(max,_vol_digitos);
      filtro_log(msg);
      return false;
     }

   if(resto > 0.0)
     {
      string msg = "Volume de "+DoubleToString(volume,_vol_digitos)+" fora do passo de "+DoubleToString(step,_vol_digitos);
      filtro_log(msg);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CONTROLE::check_windows(const int &window[])
  {
   if(m_inserir && _visual)
      for(int i=0; i<8; i++)
         if(window[i] >= 0)
           {
            int total = (int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);
            int handle = INVALID_HANDLE;

            switch(i)
              {
               case 0:
                  handle = _handle_1;
                  break;
               case 1:
                  handle = _handle_2;
                  break;
               case 2:
                  handle = _handle_3;
                  break;
               case 3:
                  handle = _handle_4;
                  break;
               case 4:
                  handle = _handle_5;
                  break;
               case 5:
                  handle = _handle_6;
                  break;
               case 6:
                  handle = _handle_7;
                  break;
               case 7:
                  handle = _handle_8;
                  break;
              }

            if(handle != INVALID_HANDLE)
               if(window[i] == 0)
                  ChartIndicatorAdd(0,0,handle);
               else
                  if(ChartIndicatorAdd(0,total,handle))
                     total++;
           }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_ativo(void)
  {
   if(!m_cross_order)
      return true;

   bool personalizado;

   if(!SymbolExist(m_cross_ativo,personalizado))
     {
      filtro_log("Falha no cross order. O ativo ("+m_cross_ativo+") não existe");
      return false;
     }
   else
      if(SymbolSelect(m_cross_ativo,true))
         filtro_log("Ativo ("+m_cross_ativo+") validado com sucesso para cross order");
      else
        {
         filtro_log("Falha ao selecionar o ativo cross-order no observador de mercado");
         return false;
        }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_ticks(void)
  {
   MqlTick tick;
   ZeroMemory(tick);

   if(!SymbolInfoTick(M_SYMBOL,tick))
     {
      string msg = StringFormat("Falha na atualização dos ticks em %s",M_SYMBOL);
      update_painel_descritivo(msg);
      filtro_log(msg);
      return false;
     }

   if(tick.ask <= 0.0 || tick.bid <= 0.0)
     {
      string msg = StringFormat("Falha na coleta da cotação em %s",M_SYMBOL);
      update_painel_descritivo(msg);
      filtro_log(msg);
      return false;
     }

   if(tick.bid > tick.ask)
     {
      string msg = StringFormat("Ativo %s em leilão",M_SYMBOL);
      update_painel_descritivo(msg);
      filtro_log(msg);
      return false;
     }

   if(tick.time+60 <= TimeCurrent())
     {
      string msg = StringFormat("Um minuto sem novos ticks em %s",M_SYMBOL);
      update_painel_descritivo(msg);
      filtro_log(msg);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_filling(const ENUM_TRADE_REQUEST_ACTIONS action, ENUM_ORDER_TYPE_FILLING &filling)
  {
   if(_validade == ORDER_TIME_GTC)
     {
      int flag = (int)SymbolInfoInteger(M_SYMBOL,SYMBOL_EXPIRATION_MODE);

      if((flag&SYMBOL_EXPIRATION_GTC) == 0)
         _validade = ORDER_TIME_DAY;
     }

   ENUM_SYMBOL_TRADE_EXECUTION exec = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(M_SYMBOL,SYMBOL_TRADE_EXEMODE);
   uint modo = (uint)SymbolInfoInteger(M_SYMBOL,SYMBOL_FILLING_MODE);

   if(exec == SYMBOL_TRADE_EXECUTION_REQUEST || exec == SYMBOL_TRADE_EXECUTION_INSTANT)
      return true;

   if(action == TRADE_ACTION_PENDING)
     {
      if(exec == SYMBOL_TRADE_EXECUTION_MARKET)
         return true;

      filling = ORDER_FILLING_RETURN;
      return true;
     }
   else
     {
      if(_filling == ORDER_FILLING_RETURN)
        {
         filling = ORDER_FILLING_RETURN;
         return true;
        }

      if((modo&SYMBOL_FILLING_FOK) == SYMBOL_FILLING_FOK)
        {
         filling = ORDER_FILLING_FOK;
         return true;
        }

      if((modo&SYMBOL_FILLING_IOC) == SYMBOL_FILLING_IOC)
        {
         filling = ORDER_FILLING_IOC;
         return true;
        }
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_expiration(ENUM_ORDER_TYPE_TIME &type_time)
  {
   int flags = (int)SymbolInfoInteger(M_SYMBOL,SYMBOL_EXPIRATION_MODE);
   type_time = _validade;

   switch(_validade)
     {
      case ORDER_TIME_GTC:
         if((flags&SYMBOL_EXPIRATION_GTC) != 0)
            return true;
         else
            if((flags&SYMBOL_EXPIRATION_DAY) != 0)
              {
               type_time = ORDER_TIME_DAY;
               return true;
              }
         break;
      case ORDER_TIME_DAY:
         if((flags&SYMBOL_EXPIRATION_DAY) != 0)
            return true;
         else
            if((flags&SYMBOL_EXPIRATION_GTC) != 0)
              {
               type_time = ORDER_TIME_GTC;
               return true;
              }
         break;
      default:
         filtro_log("Tipo de expiração inválida");
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_metas(const double saldo, const double lucro, const double topo, const double fundo, const bool conta, const bool pos)
  {
   e_meta referencia = (conta) ? m_refere_conta : m_refere;
   e_saldo calc = (conta) ? m_ref_calc_conta : m_ref_calc;

   if(referencia == es_off)
      return false;

   double ref_gain = m_gain;
   double ref_loss = m_loss;
   double ref_dd = m_dd;
   double ref_rec = m_rec;
   double ref_dd_gat = m_dd_gat;
   double ref_rec_gat = m_dd_gat;
   bool gain_out = m_gain_out;
   bool loss_out = m_loss_out;
   bool dd_out = m_dd_out;
   bool rec_out = m_rec_out;
   string meta = "do expert";

   if(conta)
     {
      ref_gain = m_gain_conta;
      ref_loss = m_loss_conta;
      ref_dd = m_dd_conta;
      ref_rec = m_rec_conta;
      ref_dd_gat = m_dd_gat_conta;
      ref_rec_gat = m_dd_gat_conta;
      gain_out = m_gain_out_conta;
      loss_out = m_loss_out_conta;
      dd_out = m_dd_out_conta;
      rec_out =  m_rec_out_conta;
      meta = "da conta";
     }

   double gain = (gain_out) ? (saldo+lucro) : saldo;
   double loss = (loss_out) ? (saldo+lucro) : saldo;
   double dd = (dd_out) ? (saldo+lucro) : saldo;
   double rec = (rec_out) ? (saldo+lucro) : saldo;
   double max = topo;
   double min = fundo;
   string desc = "($)";

   if(calc == es_saldo_perce)
     {
      double balance = AccountInfoDouble(ACCOUNT_BALANCE)+m_ref_saldo;
      desc = "(%)";

      gain = (balance == 0.00) ? 0.00 : gain/(balance*0.01);
      loss = (balance == 0.00) ? 0.00 : loss/(balance*0.01);
      dd = (balance == 0.00) ? 0.00 : dd/(balance*0.01);
      rec = (balance == 0.00) ? 0.00 : rec/(balance*0.01);
      max = (balance == 0.00) ? 0.00 : topo/(balance*0.01);
      min = (balance == 0.00) ? 0.00 : fundo/(balance*0.01);
     }

   if(gain_out || !pos)
      if(fabs(ref_gain) > 0)
         if(NormalizeDouble(gain,2) >= fabs(ref_gain))
           {
            string msg = StringFormat("Ganho %s [%.2f %s] batida",meta,ref_gain,desc);
            filtro_log(msg);
            update_painel_descritivo(msg);
            return true;
           }

   if(loss_out || !pos)
      if(fabs(ref_loss) > 0)
         if(NormalizeDouble(loss,2) <= -fabs(ref_loss))
           {
            string msg = StringFormat("Loss %s [%.2f %s] acionado",meta,ref_loss,desc);
            filtro_log(msg);
            update_painel_descritivo(msg);
            return true;
           }

   if(dd_out || !pos)
      if(fabs(ref_dd) > 0)
         if(max >= fabs(ref_dd_gat))
            if(max-dd >= fabs(ref_dd))
              {
               string msg = StringFormat("Rebaixamento %s [%.2f %s] acionado",meta,ref_dd,desc);
               filtro_log(msg);
               update_painel_descritivo(msg);
               return true;
              }

   if(rec_out || !pos)
      if(fabs(ref_rec) > 0)
         if(min <= -fabs(ref_rec_gat))
            if(rec-min >= fabs(ref_rec))
              {
               string msg = StringFormat("Recuperação %s [%.2f %s] acionada",meta,ref_rec,desc);
               filtro_log(msg);
               update_painel_descritivo(msg);
               return true;
              }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_trades(const uint total, const uint gains)
  {
   if(m_refere == es_off)
      return false;

   if(m_op_total > 0)
      if(total >= m_op_total)
        {
         string msg = StringFormat("Limite total de trades (%d) acionado",m_op_total);
         filtro_log(msg);
         update_painel_descritivo(msg);
         return true;
        }

   if(m_op_gain > 0)
      if(gains >= m_op_gain)
        {
         string msg = StringFormat("Limite de trades vencedores (%d) acionado",m_op_gain);
         filtro_log(msg);
         update_painel_descritivo(msg);
         return true;
        }

   if(m_op_loss > 0)
      if((total-gains) >= m_op_loss)
        {
         string msg = StringFormat("Limite de trades perdedores (%d) acionado",(total-gains));
         filtro_log(msg);
         update_painel_descritivo(msg);
         return true;
        }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_conexao(void)
  {
   if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
     {
      update_painel_descritivo("Trade desabilitado no terminal");
      return false;
     }

   if(!TerminalInfoInteger(TERMINAL_CONNECTED))
     {
      filtro_log("Sem conexão com o servidor");
      update_painel_descritivo("Sem conexão com o servidor");
      return false;
     }

   if(!AccountInfoInteger(ACCOUNT_TRADE_ALLOWED))
     {
      filtro_log("Conta desabilitada para algo trading");
      update_painel_descritivo("Conta desabilitada para algo trading");
      return false;
     }

   if(!AccountInfoInteger(ACCOUNT_TRADE_EXPERT))
     {
      filtro_log("Não permitido robô nesta conta");
      update_painel_descritivo("Não permitido robô nesta conta");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CONTROLE::check_visual(void)
  {
   _visual = true;

   if(MQLInfoInteger(MQL_OPTIMIZATION))
      _visual = false;
   else
      if(MQLInfoInteger(MQL_TESTER))
        {
         _teste = true;
         _visual = MQLInfoInteger(MQL_VISUAL_MODE);
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_espera(const datetime time, const int espera)
  {
   if(espera <= 0)
      return true;

   if(check_temporizador(time,espera,m_espera_ref))
      return true;

   filtro_log("Sinais bloqueados pelo temporizador");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CONTROLE::check_temporizador(const datetime time, const int espera, const e_tempo referencia)
  {
   switch(referencia)
     {
      case 0:
         if(TimeCurrent() >= time+espera)
            return true;
         break;
      case 1:
         if(TimeCurrent() >= time+(espera*PeriodSeconds(PERIOD_M1)))
            return true;
         break;
      case 2:
         if(TimeCurrent() >= time+(espera*PeriodSeconds(PERIOD_H1)))
            return true;
         break;
      case 3:
         if(iTime(M_SYMBOL,m_timeframe,espera-1) > time)
            return true;
         break;
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CONTROLE::iniciar_handles(void)
  {
   _handle_1 = INVALID_HANDLE;
   _handle_2 = INVALID_HANDLE;
   _handle_3 = INVALID_HANDLE;
   _handle_4 = INVALID_HANDLE;
   _handle_5 = INVALID_HANDLE;
   _handle_6 = INVALID_HANDLE;
   _handle_7 = INVALID_HANDLE;
   _handle_8 = INVALID_HANDLE;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CONTROLE::check_buffers(void)
  {
   double buffers[];
   ArraySetAsSeries(buffers,true);

   for(int k=1; k<=8; k++)
     {
      int cnt = 0;
      int handle = INVALID_HANDLE;
      string nome;

      switch(k)
        {
         case 1:
            handle = _handle_1;
            nome = "Indicador [1]";
            break;
         case 2:
            handle = _handle_2;
            nome = "Indicador [2]";
            break;
         case 3:
            handle = _handle_3;
            nome = "Indicador [3]";
            break;
         case 4:
            handle = _handle_4;
            nome = "Indicador [4]";
            break;
         case 5:
            handle = _handle_5;
            nome = "[Indicador Canais]";
            break;
         case 6:
            handle = _handle_6;
            nome = "[Sinal Rápido]";
            break;
         case 7:
            handle = _handle_7;
            nome = "[Sinal Lento]";
            break;
         case 8:
            handle = _handle_8;
            nome = "[Oscilador]";
            break;
        }

      if(handle != INVALID_HANDLE)
         for(int i=0; i<255; i++)
           {
            ZeroMemory(buffers);

            if(CopyBuffer(handle,i,0,2,buffers) == 2)
              {
               string n1 = (buffers[0] == EMPTY_VALUE) ? "EMPTY VALUE" : ((buffers[0] == DBL_MIN) ? "DBL MIN" : DoubleToString(buffers[0]));
               string n2 = (buffers[1] == EMPTY_VALUE) ? "EMPTY VALUE" : ((buffers[1] == DBL_MIN) ? "DBL MIN" : DoubleToString(buffers[1]));

               filtro_log(nome+" -> Buffer "+(string)i+" |Atual:"+n1+"| Anterior:"+n2);
               cnt++;
              }

            if(i == 254)
               if(cnt == 0)
                  filtro_log(nome+" -> ERRO: NENHUM BUFFER RECONHECIDO");
               else
                  filtro_log(nome+" -> Total de buffers: "+(string)cnt);
           }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_permissao(void)
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong ticket = OrderGetTicket(i);
      if(!OrderSelect(ticket))
        {
         filtro_log("Falha em selecionar todas as ordens");
         return false;
        }

      if(OrderGetInteger(ORDER_MAGIC) != m_magic)
         continue;

      if(OrderGetString(ORDER_SYMBOL) != M_SYMBOL)
         continue;

      ENUM_ORDER_TYPE tipo = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      ENUM_ORDER_STATE state = (ENUM_ORDER_STATE)OrderGetInteger(ORDER_STATE);

      if(tipo == ORDER_TYPE_BUY || tipo == ORDER_TYPE_SELL || tipo == ORDER_TYPE_CLOSE_BY)
        {
         filtro_log("Aguardando resultado da ordem #"+IntegerToString(ticket));
         Sleep(1000);
         return false;
        }

      if(state == ORDER_STATE_REQUEST_ADD || state == ORDER_STATE_REQUEST_MODIFY || state == ORDER_STATE_REQUEST_CANCEL)
        {
         filtro_log("Processando modificação do status da ordem #"+IntegerToString(ticket));
         Sleep(1000);
         return false;
        }

      if(state == ORDER_STATE_STARTED)
        {
         filtro_log("Há uma ordem verificada, mas ainda não aceita pela corretora");
         Sleep(1000);
         return false;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_stoplevel(double &price, const ENUM_ORDER_TYPE tipo, const bool corrigir=false, const double ajustar=0.00)
  {
   double stoplevel = SymbolInfoInteger(M_SYMBOL,SYMBOL_TRADE_STOPS_LEVEL)*M_POINT;
   double bid = (ajustar > 0) ? ajustar : SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);
   double ask = (ajustar > 0) ? ajustar : SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

   switch(tipo)
     {
      case ORDER_TYPE_BUY_LIMIT:
         if(price > ask-stoplevel)
            if(corrigir)
               price = normalizar(ask-stoplevel);
            else
              {
               string msg;
               StringConcatenate(msg,"Compra limit (",DoubleToString(price,M_DIGITS),") negado por stoplevel de ",DoubleToString(ask-stoplevel,M_DIGITS));
               filtro_log(msg);
               return false;
              }
         break;
      case ORDER_TYPE_SELL_LIMIT:
         if(price < bid+stoplevel)
            if(corrigir)
               price = normalizar(bid+stoplevel);
            else
              {
               string msg;
               StringConcatenate(msg,"Venda limit (",DoubleToString(price,M_DIGITS),") negado por stoplevel de ",DoubleToString(bid+stoplevel,M_DIGITS));
               filtro_log(msg);
               return false;
              }
         break;
      case ORDER_TYPE_BUY_STOP:
         if(price < ask+stoplevel)
            if(corrigir)
               price = normalizar(ask+stoplevel);
            else
              {
               string msg;
               StringConcatenate(msg,"Compra gatilho (",DoubleToString(price,M_DIGITS),") negado por stoplevel de ",DoubleToString(ask+stoplevel,M_DIGITS));
               filtro_log(msg);
               return false;
              }
         break;
      case ORDER_TYPE_SELL_STOP:
         if(price > bid-stoplevel)
            if(corrigir)
               price = normalizar(bid-stoplevel);
            else
              {
               string msg;
               StringConcatenate(msg,"Venda gatilho (",DoubleToString(price,M_DIGITS),") negado por stoplevel de ",DoubleToString(bid-stoplevel,M_DIGITS));
               filtro_log(msg);
               return false;
              }
         break;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_spread()
  {
   if(m_spread <= 0.0)
      return true;

   long spr = SymbolInfoInteger(M_SYMBOL,SYMBOL_SPREAD);

   if(spr > m_spread)
     {
      string msg = StringFormat("Ordem negada. Spread %d excede limite de %d",spr,m_spread);
      filtro_log(msg);
      update_painel_descritivo("Fora de spread");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double EXECUCAO::check_conversao(const bool pts, const double valor, const double price=0.0)
  {
   double resul = (pts) ? valor*M_POINT : price*valor*0.01;
   return NormalizeDouble(resul,M_DIGITS);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double EXECUCAO::check_sl(const ENUM_ORDER_TYPE tipo, const double price)
  {
   double sl = 0.00;

   if(m_sl > 0.00)
     {
      double alvo = check_conversao(_pts_sl,m_sl,price);
      sl = (tipo == ORDER_TYPE_BUY) ? normalizar(price-alvo) : normalizar(price+alvo);
     }

   if(m_alvos_sl2)
     {
      double price_sl = (tipo == ORDER_TYPE_BUY) ? check_price(m_price_sl2_buy) : check_price(m_price_sl2_sell);
      double conversao = check_conversao(_pts_cus,m_dis_sl2,price_sl);
      double sl2 = (tipo == ORDER_TYPE_BUY) ? normalizar(price_sl-conversao) : normalizar(price_sl+conversao);

      if(sl2 > 0.00)
         if((sl2 > sl && tipo == ORDER_TYPE_BUY) || (sl2 < sl && tipo == ORDER_TYPE_SELL) || sl == 0.00)
            sl = sl2;
     }

   return sl;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double EXECUCAO::check_tp(const ENUM_ORDER_TYPE tipo, const double price)
  {
   double tp = 0.00;

   if(m_tp > 0.00)
     {
      double alvo = check_conversao(_pts_tp,m_tp,price);
      tp = (tipo == ORDER_TYPE_BUY) ? normalizar(price+alvo) : normalizar(price-alvo);
     }

   if(m_alvos_tp2)
     {
      double price_tp = (tipo == ORDER_TYPE_BUY) ? check_price(m_price_tp2_buy) : check_price(m_price_tp2_sell);
      double conversao = check_conversao(_pts_cus,m_dis_tp2,price_tp);
      double tp2 = (tipo == ORDER_TYPE_BUY) ? normalizar(price_tp+conversao) : normalizar(price_tp-conversao);

      if(tp2 > 0.00)
         if((tp2 < tp && tipo == ORDER_TYPE_BUY) || (tp2 > tp && tipo == ORDER_TYPE_SELL) || tp == 0.00)
            tp = tp2;
     }

   return tp;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::enviar_compra(void)
  {
   if(!_comprar)
      return false;

   if(!check_permissao())
      return false;

   if(!check_spread())
      return false;

   double ask = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);
   double price = (m_price_buy == 0 || !m_pendente_in) ? ask : check_price(m_price_buy);

   if(fabs(m_dis_in) > 0 && m_pendente_in)
      price = normalizar(price+check_conversao(_pts_inout,m_dis_in,price));

   ENUM_TRADE_REQUEST_ACTIONS action = TRADE_ACTION_DEAL;
   ENUM_ORDER_TYPE tipo = ORDER_TYPE_BUY;

   if(m_pendente_in)
     {
      action = TRADE_ACTION_PENDING;

      if(m_dis_in > 0.0 && check_stoplevel(price,ORDER_TYPE_BUY_STOP))
         tipo = ORDER_TYPE_BUY_STOP;
      else
         if(check_stoplevel(price,ORDER_TYPE_BUY_LIMIT,true))
            tipo = ORDER_TYPE_BUY_LIMIT;
     }

   double tp = check_tp(ORDER_TYPE_BUY,price);
   double sl = check_sl(ORDER_TYPE_BUY,price);

   if(sl > 0.00)
      if(sl >= price)
        {
         filtro_log("Stoploss inválido para compra");
         return false;
        }
      else
         if(!check_stoplevel(sl,ORDER_TYPE_SELL_STOP,true,price))
            return false;

   if(tp > 0.00)
      if(tp <= price)
        {
         filtro_log("Takeprofit inválido para compra");
         return false;
        }
      else
         if(!check_stoplevel(tp,ORDER_TYPE_SELL_LIMIT,true,price))
            return false;

   if(enviar_ordem(action,tipo,price,0,tp,sl,m_volume,"CIN#"))
     {
      filtro_log("Ordem de compra enviada com sucesso");
      return true;
     }

   filtro_log("Falha no envio da abertura da compra");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::enviar_venda(void)
  {
   if(!_vender)
      return false;

   if(!check_permissao())
      return false;

   if(!check_spread())
      return false;

   double bid = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);
   double price = (m_price_sell == 0 || !m_pendente_in) ? bid : check_price(m_price_sell);

   if(fabs(m_dis_in) > 0 && m_pendente_in)
      price = normalizar(price-check_conversao(_pts_inout,m_dis_in,price));

   ENUM_TRADE_REQUEST_ACTIONS action = TRADE_ACTION_DEAL;
   ENUM_ORDER_TYPE tipo = ORDER_TYPE_SELL;

   if(m_pendente_in)
     {
      action = TRADE_ACTION_PENDING;

      if(m_dis_in > 0.0 && check_stoplevel(price,ORDER_TYPE_SELL_STOP))
         tipo = ORDER_TYPE_SELL_STOP;
      else
         if(check_stoplevel(price,ORDER_TYPE_SELL_LIMIT,true))
            tipo = ORDER_TYPE_SELL_LIMIT;
     }

   double tp = check_tp(ORDER_TYPE_SELL,price);
   double sl = check_sl(ORDER_TYPE_SELL,price);

   if(sl > 0.00)
      if(sl <= price)
        {
         filtro_log("Stoploss inválido para venda");
         return false;
        }
      else
         if(!check_stoplevel(sl,ORDER_TYPE_BUY_STOP,true,price))
            return false;

   if(tp > 0.00)
      if(tp >= price)
        {
         filtro_log("Takeprofit inválido para venda");
         return false;
        }
      else
         if(!check_stoplevel(tp,ORDER_TYPE_BUY_LIMIT,true,price))
            return false;

   if(enviar_ordem(action,tipo,price,0,tp,sl,m_volume,"VIN#"))
     {
      filtro_log("Ordem de venda enviada com sucesso");
      return true;
     }

   filtro_log("Falha no envio da abertura da venda");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::enviar_saida(const double pos, const ulong ticket_out)
  {
   if(fabs(pos) > 0.00)
      if(!m_pendente_out)
        {
         zeragem_compulsoria();
         return true;
        }
      else
         if(ticket_out == 0)
           {
            if(!check_permissao())
               return false;

            double price;
            ENUM_ORDER_TYPE tipo;

            if(pos > 0.00)
              {
               double bid = check_price(m_price_out_buy);
               price = normalizar(bid+check_conversao(_pts_inout,m_dis_out,bid));
               tipo = (m_dis_out < 0.0) ? ORDER_TYPE_SELL_STOP : ORDER_TYPE_SELL_LIMIT;
              }
            else
              {
               double ask = check_price(m_price_out_sell);
               price = normalizar(ask-check_conversao(_pts_inout,m_dis_out,ask));
               tipo = (m_dis_out < 0.0) ? ORDER_TYPE_BUY_STOP : ORDER_TYPE_BUY_LIMIT;
              }

            if(check_stoplevel(price,tipo,true))
               return enviar_ordem(TRADE_ACTION_PENDING,tipo,price,0,0,0,fabs(pos),"OUT#");
           }
         else
            if(OrderSelect(ticket_out))
              {
               double vol = OrderGetDouble(ORDER_VOLUME_CURRENT);
               ENUM_ORDER_TYPE tipo = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);

               if((pos < 0 && (tipo == ORDER_TYPE_SELL_LIMIT || tipo == ORDER_TYPE_SELL_STOP)) ||
                  (pos > 0 && (tipo == ORDER_TYPE_BUY_LIMIT || tipo == ORDER_TYPE_BUY_STOP)) || fabs(pos) != vol)
                  if(OrderGetInteger(ORDER_STATE) != ORDER_STATE_PARTIAL)
                     return enviar_ordem(TRADE_ACTION_REMOVE,tipo,OrderGetDouble(ORDER_PRICE_OPEN),ticket_out);
              }
            else
               filtro_log("Falha em selecionar a ordem de saída pendente");

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_delay(void)
  {
   uint delay = _ticks_count-_ticks_deal;

   if(_ticks_count < _ticks_deal)
      _ticks_deal = _ticks_count;

   if(m_delay_ticks > 0)
      if(delay < m_delay_ticks)
        {
         filtro_log(StringFormat("Ordem recém enviada com excesso de ticks processados. Aguardando %d mili segundos",m_delay_ticks));
         Sleep(delay);
         return false;
        }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::breakeven_sl(const ulong ticket, const double price)
  {
   if(m_sl_be <= 0.0 || m_sl_be_dis <= 0.0)
      return false;

   if(!PositionSelectByTicket(ticket))
      return false;

   ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   double sl = PositionGetDouble(POSITION_SL);
   double tp = PositionGetDouble(POSITION_TP);
   double dis = check_conversao(_pts_sl,m_sl_be-m_sl_be_dis,price);
   double new_sl = sl;

   if(tipo == POSITION_TYPE_BUY)
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);

      if(referencia >= price+check_conversao(_pts_sl,m_sl_be,price))
         if(sl == 0.0)
            new_sl = normalizar(price+dis);
         else
            if(normalizar(price+dis) > sl)
               new_sl = normalizar(price+dis);
     }
   else
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

      if(referencia <= price-check_conversao(_pts_sl,m_sl_be,price))
         if(sl == 0.0)
            new_sl = normalizar(price-dis);
         else
            if(normalizar(price-dis) < sl)
               new_sl = normalizar(price-dis);
     }

   if(new_sl != sl)
     {
      string msg;
      StringConcatenate(msg,"Mover Breakeven SL de ",DoubleToString(sl,M_DIGITS)," p/ ",DoubleToString(new_sl,M_DIGITS));
      filtro_log(msg);
      return enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,tp,new_sl,0,PositionGetString(POSITION_COMMENT));
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::trailling_sl(const ulong ticket, const double price)
  {
   if(m_sl_ts <= 0 || m_sl_ts_step <= 0)
      return false;

   if(!PositionSelectByTicket(ticket))
      return false;

   ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   double sl = PositionGetDouble(POSITION_SL);
   double tp = PositionGetDouble(POSITION_TP);
   double dis = (m_sl_ts+m_sl);

   if(m_sl_be > 0 && m_sl_be_dis > 0)
      dis = (m_sl_ts >= m_sl_be) ? (m_sl_ts-m_sl_be+m_sl_be_dis) : (m_sl_be-m_sl_be_dis);

   double new_sl = sl;
   dis = check_conversao(_pts_sl,dis,price);

   if(tipo == POSITION_TYPE_BUY)
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);

      if(referencia >= price+check_conversao(_pts_sl,m_sl_ts,price))
         if(sl == 0.0)
            new_sl = normalizar(price);
         else
            if(normalizar(referencia-dis) > sl)
              {
               new_sl += check_conversao(_pts_sl,m_sl_ts_step,price);
               new_sl = normalizar(new_sl);
              }
     }
   else
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

      if(referencia <= price-check_conversao(_pts_sl,m_sl_ts,price))
         if(sl == 0.0)
            new_sl = normalizar(price);
         else
            if(normalizar(referencia+dis) < sl)
              {
               new_sl -= check_conversao(_pts_sl,m_sl_ts_step,price);
               new_sl = normalizar(new_sl);
              }
     }

   if(new_sl != sl)
     {
      string msg;
      StringConcatenate(msg,"Mover Trailling stop de ",DoubleToString(sl,M_DIGITS)," p/ ",DoubleToString(new_sl,M_DIGITS));
      filtro_log(msg);
      return enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,tp,new_sl,0,PositionGetString(POSITION_COMMENT));
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::breakeven_tp(const ulong ticket, const double price)
  {
   if(m_tp_be <= 0.0 || m_tp_be_dis <= 0.0)
      return false;

   if(!PositionSelectByTicket(ticket))
      return false;

   ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   double sl = PositionGetDouble(POSITION_SL);
   double tp = PositionGetDouble(POSITION_TP);
   double dis = check_conversao(_pts_tp,m_tp_be-m_tp_be_dis,price);
   double new_tp = tp;

   if(tipo == POSITION_TYPE_SELL)
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

      if(referencia >= price+check_conversao(_pts_tp,m_tp_be,price))
         if(tp == 0.0)
            new_tp = normalizar(price+dis);
         else
            if(normalizar(price+dis) > tp)
               new_tp = normalizar(price+dis);
     }
   else
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);

      if(referencia <= price-check_conversao(_pts_tp,m_tp_be,price))
         if(tp == 0.0)
            new_tp = normalizar(price-dis);
         else
            if(normalizar(price-dis) < tp)
               new_tp = normalizar(price-dis);
     }

   if(new_tp != tp)
     {
      string msg;
      StringConcatenate(msg,"Mover Breakeven TP de ",DoubleToString(tp,M_DIGITS)," p/ ",DoubleToString(new_tp,M_DIGITS));
      filtro_log(msg);
      return enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,new_tp,sl,0,PositionGetString(POSITION_COMMENT));
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::trailling_tp(const ulong ticket, const double price)
  {
   if(m_tp_ts <= 0 || m_tp_ts_step <= 0)
      return false;

   if(!PositionSelectByTicket(ticket))
      return false;

   ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   double sl = PositionGetDouble(POSITION_SL);
   double tp = PositionGetDouble(POSITION_TP);
   double dis = (m_tp_ts+m_tp);

   if(m_tp_be > 0 && m_tp_be_dis > 0)
      dis = (m_tp_ts >= m_tp_be) ? (m_tp_ts-m_tp_be+m_tp_be_dis) : (m_tp_be-m_tp_be_dis);

   double new_tp = tp;
   dis = check_conversao(_pts_tp,dis,price);

   if(tipo == POSITION_TYPE_SELL)
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

      if(referencia >= price+check_conversao(_pts_tp,m_tp_ts,price))
         if(tp == 0.00)
            new_tp = normalizar(price);
         else
            if(normalizar(referencia-dis) > tp)
              {
               new_tp += check_conversao(_pts_tp,m_tp_ts_step,price);
               new_tp = normalizar(new_tp);
              }
     }
   else
     {
      double referencia = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);

      if(referencia <= price-check_conversao(_pts_tp,m_tp_ts,price))
         if(tp == 0.0)
            new_tp = normalizar(price);
         else
            if(normalizar(referencia+dis) < tp)
              {
               new_tp -= check_conversao(_pts_tp,m_tp_ts_step,price);
               new_tp = normalizar(new_tp);
              }
     }

   if(new_tp != tp)
     {
      string msg;
      StringConcatenate(msg,"Mover Trailling profit de ",DoubleToString(tp,M_DIGITS)," p/ ",DoubleToString(new_tp,M_DIGITS));
      filtro_log(msg);
      return enviar_ordem(TRADE_ACTION_SLTP,(ENUM_ORDER_TYPE)tipo,price,ticket,new_tp,sl,0,PositionGetString(POSITION_COMMENT));
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EXECUCAO::check_alvos(const double pos, const ulong ticket, const double primeira, const double medio)
  {
   double price_sl = (_medio_sl) ? medio : primeira;
   double price_tp = (_medio_tp) ? medio : primeira;

   if(PositionSelectByTicket(ticket))
     {
      double sl = PositionGetDouble(POSITION_SL);
      double tp = PositionGetDouble(POSITION_TP);
      double entrada = PositionGetDouble(POSITION_PRICE_OPEN);
      string coment = PositionGetString(POSITION_COMMENT);
      datetime time = (datetime)PositionGetInteger(POSITION_TIME);
      ENUM_ORDER_TYPE tipo = (pos > 0) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;

      if(m_alvos_check > 0)
         if(TimeCurrent()-time < m_alvos_check)
           {
            double corrigir_sl = check_sl(tipo,primeira);
            double corrigir_tp = check_tp(tipo,primeira);

            if((tipo == ORDER_TYPE_BUY && (corrigir_sl < sl || corrigir_tp > tp)) || (tipo == ORDER_TYPE_SELL && (corrigir_sl > sl || corrigir_tp < tp)))
               enviar_ordem(TRADE_ACTION_SLTP,tipo,entrada,ticket,corrigir_tp,corrigir_sl,fabs(pos),coment);

            return;
           }

      if(sl == 0.0 || !m_alvos_sl2)
        {
         double ajuste_sl = check_sl(tipo,price_sl);
         ENUM_ORDER_TYPE stop = (pos > 0) ? ORDER_TYPE_SELL_STOP : ORDER_TYPE_BUY_STOP;

         if(ajuste_sl > 0.0)
            if((fabs(pos) > m_volume && _repo_sl) || sl == 0.0)
               if((sl < ajuste_sl && pos > 0) || (sl > ajuste_sl && pos < 0) || sl == 0.00)
                  if(check_stoplevel(ajuste_sl,stop))
                     if(enviar_ordem(TRADE_ACTION_SLTP,tipo,entrada,ticket,tp,ajuste_sl,fabs(pos),coment))
                        sl = ajuste_sl;
        }

      if(tp == 0.0 || !m_alvos_tp2)
        {
         double ajuste_tp = check_tp(tipo,price_tp);
         ENUM_ORDER_TYPE take = (pos > 0) ? ORDER_TYPE_SELL_LIMIT : ORDER_TYPE_BUY_LIMIT;

         if(ajuste_tp > 0.0)
            if((fabs(pos) > m_volume && _repo_tp) || tp == 0.0)
               if((tp < ajuste_tp && pos < 0) || (tp > ajuste_tp && pos > 0) || tp == 0.00)
                  if(check_stoplevel(ajuste_tp,take))
                     if(enviar_ordem(TRADE_ACTION_SLTP,tipo,entrada,ticket,ajuste_tp,sl,fabs(pos),coment))
                        tp = ajuste_tp;
        }
     }

   if(!breakeven_sl(ticket,price_sl))
      trailling_sl(ticket,price_sl);

   if(!breakeven_tp(ticket,price_tp))
      trailling_tp(ticket,price_tp);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::enviar_ordem(const ENUM_TRADE_REQUEST_ACTIONS action,
                            const ENUM_ORDER_TYPE tipo,
                            double price=0,
                            ulong  ticket=0,
                            double tp=0,
                            double sl=0,
                            double lot=0,
                            string coment=NULL,
                            ulong ticket_by=0)
  {
   MqlTradeRequest request;
   MqlTradeResult  result;
   MqlTradeCheckResult check;

   ZeroMemory(request);
   ZeroMemory(result);
   ZeroMemory(check);
   ResetLastError();

   if(action == TRADE_ACTION_PENDING || action == TRADE_ACTION_MODIFY)
      if(!check_expiration(request.type_time))
        {
         filtro_log("Falha ao atribuir uma expiração válida");
         return false;
        }

   if(action == TRADE_ACTION_DEAL || action == TRADE_ACTION_PENDING)
      if(!check_filling(action,request.type_filling))
        {
         filtro_log("Falha ao atribuir preenchimento para o envio da ordem");
         return false;
        }

   if(action == TRADE_ACTION_REMOVE || action == TRADE_ACTION_MODIFY)
      request.order = ticket;
   else
     {
      request.position = ticket;
      request.position_by = ticket_by;
     }

   request.action    = action;
   request.symbol    = M_SYMBOL;
   request.volume    = lot;
   request.type      = tipo;
   request.price     = normalizar(price);
   request.deviation = 10;
   request.magic     = m_magic;
   request.comment   = coment+Expert;
   request.tp        = tp;
   request.sl        = sl;

   switch(action)
     {
      case TRADE_ACTION_DEAL:
         filtro_log("Solicitado envio de ordem a mercado");
         break;
      case TRADE_ACTION_PENDING:
         filtro_log("Solicitado abertura de ordem pendente");
         break;
      case TRADE_ACTION_SLTP:
         filtro_log("Solicitado modificação do SL e/ou TP");
         break;
      case TRADE_ACTION_MODIFY:
         filtro_log("Solicitado modificação de ordem pendente");
         break;
      case TRADE_ACTION_REMOVE:
         filtro_log("Solicitado remoção de ordem pendente");
         break;
      case TRADE_ACTION_CLOSE_BY:
         filtro_log("Solicitado fechamento pela oposta");
         break;
     }

   if(!check_permissao())
     {
      filtro_log("Falha na verificação secundária de permisssão");
      Sleep(1000);
      return false;
     }

   if(!OrderCheck(request,check))
     {
      filtro_log(StringFormat("Erro %d na checagem da ordem",GetLastError()));
      filtro_log(StringFormat("Retorno %d (%s)",check.retcode,check.comment));
      Sleep(1000);
      return false;
     }

   if(!OrderSend(request,result))
     {
      filtro_log(StringFormat("Erro %d no envio da ordem",GetLastError()));
      filtro_log(StringFormat("Retorno %d (%s)",result.retcode,result.comment));
      Sleep(1000);
      return false;
     }

   filtro_log(StringFormat("Ordem enviada. %d (%s)",result.retcode,result.comment));
   string msg = NULL;

   if(result.deal > 0)
      msg = StringFormat("Negócio #%I64u. ",result.deal);

   if(result.order > 0)
      msg += StringFormat("Ordem #%I64u",result.order);

   if(msg != NULL)
      filtro_log(msg);
      
   if(action == TRADE_ACTION_DEAL || action == TRADE_ACTION_PENDING || action == TRADE_ACTION_CLOSE_BY)
      _ticks_deal = GetTickCount();

   _atualizar = true;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EXECUCAO::zeragem_compulsoria(void)
  {
   if(check_delay())
      if(check_permissao())
         for(int i=PositionsTotal()-1; i>=0 && !IsStopped(); i--)
           {
            ulong ticket = PositionGetTicket(i);
            PositionSelectByTicket(ticket);

            if(PositionGetString(POSITION_SYMBOL) != M_SYMBOL)
               continue;

            if(PositionGetInteger(POSITION_MAGIC) != m_magic)
               continue;

            ENUM_POSITION_TYPE tipo = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
            double vol = PositionGetDouble(POSITION_VOLUME);

            if(tipo == POSITION_TYPE_BUY)
              {
               double price = SymbolInfoDouble(M_SYMBOL,SYMBOL_BID);

               if(enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_SELL,price,ticket,0,0,vol,"OUT#"))
                 {
                  string msg = "Encerrada COMPRA #"+IntegerToString(ticket)+" e volume "+DoubleToString(vol,_vol_digitos);
                  filtro_log(msg);
                 }
              }
            else
              {
               double price = SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

               if(enviar_ordem(TRADE_ACTION_DEAL,ORDER_TYPE_BUY,price,ticket,0,0,vol,"OUT#"))
                 {
                  string msg = "Encerrada VENDA #"+IntegerToString(ticket)+" e volume "+DoubleToString(vol,_vol_digitos);
                  filtro_log(msg);
                 }
              }
           }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_pendentes(const s_position &pos, const s_ordem &ord, const s_history &his)
  {
   if(pos.volume == 0.00)
      return false;

   confirmar_aumento(false,pos.volume,his.entrada,pos.sl,pos.tp,m_af1_dis,m_af1_lot,ord.af1,his.af1,"AF1#");
   confirmar_aumento(false,pos.volume,his.entrada,pos.sl,pos.tp,m_af2_dis,m_af2_lot,ord.af2,his.af2,"AF2#");
   confirmar_aumento(false,pos.volume,his.entrada,pos.sl,pos.tp,m_af3_dis,m_af3_lot,ord.af3,his.af3,"AF3#");
   confirmar_aumento(false,pos.volume,his.entrada,pos.sl,pos.tp,m_af4_dis,m_af4_lot,ord.af4,his.af4,"AF4#");
   confirmar_aumento(false,pos.volume,his.entrada,pos.sl,pos.tp,m_af5_dis,m_af5_lot,ord.af5,his.af5,"AF5#");

   confirmar_aumento(true,pos.volume,his.entrada,pos.sl,pos.tp,m_ac1_dis,m_ac1_lot,ord.ac1,his.ac1,"AC1#");
   confirmar_aumento(true,pos.volume,his.entrada,pos.sl,pos.tp,m_ac2_dis,m_ac2_lot,ord.ac2,his.ac2,"AC2#");
   confirmar_aumento(true,pos.volume,his.entrada,pos.sl,pos.tp,m_ac3_dis,m_ac3_lot,ord.ac3,his.ac3,"AC3#");
   confirmar_aumento(true,pos.volume,his.entrada,pos.sl,pos.tp,m_ac4_dis,m_ac4_lot,ord.ac4,his.ac4,"AC4#");
   confirmar_aumento(true,pos.volume,his.entrada,pos.sl,pos.tp,m_ac5_dis,m_ac5_lot,ord.ac5,his.ac5,"AC5#");

   double parcial = (_medio_pn) ? his.medio : his.entrada;
   confirmar_parciais(pos.volume,parcial,pos.sl,pos.tp,m_p1_dis,m_p1_lot,ord.p1,his.p1,"SP1#");
   confirmar_parciais(pos.volume,parcial,pos.sl,pos.tp,m_p2_dis,m_p2_lot,ord.p2,his.p2,"SP2#");
   confirmar_parciais(pos.volume,parcial,pos.sl,pos.tp,m_p3_dis,m_p3_lot,ord.p3,his.p3,"SP3#");
   confirmar_parciais(pos.volume,parcial,pos.sl,pos.tp,m_p4_dis,m_p4_lot,ord.p4,his.p4,"SP4#");

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EXECUCAO::confirmar_aumento(const bool contra, const double pos, const double entrada, const double sl, const double tp,
                                 const double dis, const double lot, const ulong ticket, const ulong history, const string nome)
  {
   if(entrada > 0.00)
      if(dis > 0.00 && lot > 0.00)
        {
         ENUM_ORDER_TYPE tipo = (pos > 0.00) ? ORDER_TYPE_BUY_STOP : ORDER_TYPE_SELL_STOP;
         bool pts = (contra) ? _pts_ac : _pts_af;
         double conversao = check_conversao(pts,dis,entrada);
         double price = ((pos > 0.00 && !contra) || (pos < 0.00 && contra)) ? entrada+conversao : entrada-conversao;

         if(contra)
            tipo = (pos > 0.00) ? ORDER_TYPE_BUY_LIMIT : ORDER_TYPE_SELL_LIMIT;

         if(((tipo == ORDER_TYPE_BUY_STOP || tipo ==  ORDER_TYPE_BUY_LIMIT) && ((price > tp && tp > 0.00) || price < sl)) ||
            ((tipo == ORDER_TYPE_SELL_STOP || tipo ==  ORDER_TYPE_SELL_LIMIT) && ((price > sl && sl > 0.00) || price < tp)))
           {
            if(ticket > 0)
              {
               filtro_log("Ordem de aumento fora da faixa dos alvos");
               enviar_ordem(TRADE_ACTION_REMOVE,tipo,0,ticket);
              }

            return;
           }

         if(ticket == 0 && history == 0)
            if(check_stoplevel(price,tipo))
               if(check_permissao())
                  enviar_ordem(TRADE_ACTION_PENDING,tipo,price,0,tp,sl,lot,nome);
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EXECUCAO::confirmar_parciais(const double pos, const double price, const double sl, const double tp, const double dis, const double lot,
                                  const ulong ticket, const ulong history, const string nome)
  {
   string id = StringSubstr(nome,2,1);
   string name = "PEN_"+IntegerToString(StringToInteger(id)+9);

   if(price > 0.00 && fabs(dis) > 0.00 && lot > 0.00 && history == 0)
     {
      double conversao = check_conversao(_pts_pn,fabs(dis),price);
      double parcial = ((pos > 0 && dis > 0) || (pos < 0 && dis < 0)) ? normalizar(price+conversao) : normalizar(price-conversao);
      double vol = (lot > fabs(pos)) ? fabs(pos) : lot;
      ENUM_ORDER_TYPE tipo;

      if(pos > 0.00)
         tipo = (dis > 0) ? ORDER_TYPE_SELL_LIMIT : ORDER_TYPE_SELL_STOP;
      else
         tipo = (dis > 0) ? ORDER_TYPE_BUY_LIMIT : ORDER_TYPE_BUY_STOP;

      if(m_pendente_parcial)
        {
         if(ticket > 0)
           {
            if(OrderSelect(ticket))
              {
               double volume = OrderGetDouble(ORDER_VOLUME_CURRENT);

               if(tipo == OrderGetInteger(ORDER_TYPE))
                  if(volume > fabs(pos) || (volume < fabs(pos) && volume < lot))
                    {
                     if(OrderGetInteger(ORDER_STATE) != ORDER_STATE_PARTIAL)
                        enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket);
                    }
                  else
                     if(OrderGetDouble(ORDER_PRICE_OPEN) != parcial)
                        if(check_stoplevel(parcial,tipo))
                           enviar_ordem(TRADE_ACTION_MODIFY,tipo,parcial,ticket,0,0,volume,OrderGetString(ORDER_COMMENT));
              }
           }
         else
            if(check_stoplevel(parcial,tipo))
               if(check_permissao())
                  enviar_ordem(TRADE_ACTION_PENDING,tipo,parcial,0,0,0,vol,nome);
        }
      else
        {
         if(ticket > 0)
            if(OrderSelect(ticket))
               if(OrderGetInteger(ORDER_STATE) == ORDER_STATE_PARTIAL)
                  return;
               else
                 {
                  enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket);
                  return;
                 }

         double referencia = (tipo == ORDER_TYPE_SELL_LIMIT || tipo == ORDER_TYPE_SELL_STOP) ?
                             SymbolInfoDouble(M_SYMBOL,SYMBOL_BID) : SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

         if(((tipo == ORDER_TYPE_SELL_STOP || tipo ==  ORDER_TYPE_SELL_LIMIT) && ((parcial > tp && tp > 0.00) || parcial < sl)) ||
            ((tipo == ORDER_TYPE_BUY_STOP || tipo ==  ORDER_TYPE_BUY_LIMIT) && ((parcial > sl && sl > 0.00) || parcial < tp)))
            atualizar_linha(name,"",DBL_MIN,clrNONE);
         else
            if(referencia > 0 && parcial > 0)
              {
               if((referencia >= parcial && (tipo == ORDER_TYPE_SELL_LIMIT || tipo == ORDER_TYPE_BUY_STOP)) ||
                  (referencia <= parcial && (tipo == ORDER_TYPE_BUY_LIMIT || tipo == ORDER_TYPE_SELL_STOP)))
                  if(parcial_mercado(vol,nome))
                     filtro_log("Parcial ("+nome+") a mercado executada com sucesso");
                  else
                     filtro_log("Falha na execução total da parcial "+nome);

               color cor = (pos < 0.00) ? clrBlue : clrRed;
               string txt = ("Parcial (P"+id+") "+DoubleToString(vol,_vol_digitos));
               atualizar_linha(name,txt,parcial,cor);
              }
            else
               atualizar_linha(name,"",DBL_MIN,clrNONE);
        }
     }
   else
      atualizar_linha(name,"",DBL_MIN,clrNONE);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_gradiente_linear(const double posicao, const double entrada, const int &grad_qtd[], const ulong &grad_ticket[],
                                      const ulong last, const double tp, const double sl, const datetime ultima)
  {
   string comentario = HistoryDealGetString(last,DEAL_COMMENT);
   int id = (last > 0) ? (int)StringSubstr(comentario,4,StringFind(comentario,"#",4)-4) : 0;

   if(last > 0 && m_gra_tp > 0.0)
     {
      ulong ticket = grad_ticket[0];
      double vol = HistoryDealGetDouble(last,DEAL_VOLUME);
      double price = HistoryDealGetDouble(last,DEAL_PRICE);
      double conv_tp = check_conversao(_pts_grad,m_gra_tp,price);
      double alvo = (posicao > 0) ? normalizar(price+conv_tp) : normalizar(price-conv_tp);
      ENUM_ORDER_TYPE tipo = (posicao > 0) ? ORDER_TYPE_SELL_LIMIT : ORDER_TYPE_BUY_LIMIT;

      if(m_pendente_grad)
        {
         if(ticket > 0)
            if(OrderSelect(ticket))
              {
               double parcial = OrderGetDouble(ORDER_PRICE_OPEN);

               if(alvo == 0 || (posicao > 0 && parcial > alvo) || (posicao < 0 && parcial < alvo))
                  if(enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket))
                     ticket = 0;
              }

         if(ticket == 0 && vol > 0.0)
            if(check_stoplevel(alvo,tipo))
               if(check_permissao())
                  enviar_ordem(TRADE_ACTION_PENDING,tipo,alvo,0,0,0,vol,"GTP#");
        }
      else
        {
         if(ticket > 0)
            if(OrderSelect(ticket))
               if(OrderGetInteger(ORDER_STATE) == ORDER_STATE_PARTIAL)
                  return false;
               else
                  if(enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket))
                     return false;

         double referencia = (tipo == ORDER_TYPE_SELL_LIMIT) ? SymbolInfoDouble(M_SYMBOL,SYMBOL_BID) : SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

         if(((tipo == ORDER_TYPE_SELL_STOP || tipo ==  ORDER_TYPE_SELL_LIMIT) && ((alvo > tp && tp > 0.00) || alvo < sl)) ||
            ((tipo == ORDER_TYPE_BUY_STOP || tipo ==  ORDER_TYPE_BUY_LIMIT) && ((alvo > sl && sl > 0.00) || alvo < tp)))
            atualizar_linha("GIN_0","",DBL_MIN,clrNONE);
         else
            if(referencia > 0 && alvo > 0)
              {
               if((referencia >= alvo && tipo == ORDER_TYPE_SELL_LIMIT) || (referencia <= alvo && tipo == ORDER_TYPE_BUY_LIMIT))
                  if(parcial_mercado(vol,"GTP#"))
                     filtro_log("Parcial (GTP#) a mercado executada com sucesso");
                  else
                     filtro_log("Falha na execução total da parcial GTP#");

               string txt = ("Gradiente (TP) "+DoubleToString(vol,_vol_digitos));
               atualizar_linha("GIN_0",txt,alvo,clrYellowGreen);
              }
            else
               atualizar_linha("GIN_0","",DBL_MIN,clrNONE);
        }
     }
   else
      atualizar_linha("GIN_0","",DBL_MIN,clrNONE);

   for(int i=id+1; i<=m_grad_qtd && !IsStopped(); i++)
     {
      double price = 0.0;
      string nome = NULL;
      ulong ticket = grad_ticket[i];
      ENUM_ORDER_TYPE tipo = (posicao > 0) ? ORDER_TYPE_BUY_LIMIT : ORDER_TYPE_SELL_LIMIT;

      if(OrderSelect(ticket))
        {
         double ordem_pr = OrderGetDouble(ORDER_PRICE_OPEN);

         if(sl > 0.00 && ((tipo == ORDER_TYPE_BUY_LIMIT && ordem_pr <= sl) || (tipo == ORDER_TYPE_SELL_LIMIT && ordem_pr >= sl)))
           {
            filtro_log("Nivel do gradiente fora do stoploss");
            enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket);
           }
         else
            if(OrderGetDouble(ORDER_TP) != tp || OrderGetDouble(ORDER_SL) != sl)
              {
               filtro_log("Corrigindo alvos do gradiente");
               enviar_ordem(TRADE_ACTION_MODIFY,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),ordem_pr,ticket,tp,sl);
              }

         if(ultima > 0)
            if(ultima > OrderGetInteger(ORDER_TIME_SETUP))
               if(OrderGetInteger(ORDER_STATE) != ORDER_STATE_PARTIAL)
                 {
                  filtro_log("Solicitado atualizar ordem do gradiente");
                  enviar_ordem(TRADE_ACTION_REMOVE,(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE),0,ticket);
                 }
        }
      else
         if(grad_qtd[i] < m_grad_max)
           {
            double conv = check_conversao(_pts_grad,m_gra_dis*i,entrada);
            double ajuste = check_conversao(_pts_grad,m_grad_ajuste,entrada);
            ajuste *= (m_grad_repo) ? grad_qtd[0] : grad_qtd[i];

            price = (posicao > 0) ? normalizar(entrada-conv-ajuste) : normalizar(entrada+conv+ajuste);
            StringConcatenate(nome,"GIN#",IntegerToString(i),"#");
           }

      if(price > 0 && nome != NULL)
         if(sl == 0.0 || (posicao > 0 && price > sl) || (posicao < 0 && price < sl))
            if(check_stoplevel(price,tipo))
               if(check_permissao())
                  enviar_ordem(TRADE_ACTION_PENDING,tipo,price,0,tp,sl,m_grad_vol,nome);
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::parcial_mercado(const double vol, const string nome)
  {
   double lot = vol;
   int    cnt = 0;

   while(lot > 0.00 && cnt < 5)
     {
      cnt++;
      double max = 0.00;

      for(int i=PositionsTotal()-1; i>=0; i--)
        {
         ulong ticket = PositionGetTicket(i);
         PositionSelectByTicket(ticket);

         if(PositionGetString(POSITION_SYMBOL) != M_SYMBOL)
            continue;

         if(PositionGetInteger(POSITION_MAGIC) != m_magic)
            continue;

         double volume = PositionGetDouble(POSITION_VOLUME);
         double order_lot = fmin(volume,lot);
         max += volume;

         ENUM_ORDER_TYPE ordem_type = (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? ORDER_TYPE_SELL : ORDER_TYPE_BUY;
         double order_price = (ordem_type == ORDER_TYPE_SELL) ? SymbolInfoDouble(M_SYMBOL,SYMBOL_BID) : SymbolInfoDouble(M_SYMBOL,SYMBOL_ASK);

         if(enviar_ordem(TRADE_ACTION_DEAL,ordem_type,order_price,ticket,0,0,order_lot,nome))
            lot -= order_lot;

         if(lot <= 0.00)
            return true;

         if(max >= vol)
            i = 0;
        }
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_saida_temporal(const datetime hora, const double lucro)
  {
   int espera = m_temporal_pos_time;
   double max = m_temporal_pos_max;
   double min = m_temporal_pos_min;

   if(lucro < 0.00)
     {
      espera = m_temporal_neg_time;
      max = m_temporal_neg_max;
      min = m_temporal_neg_min;
     }

   if(espera <= 0)
      return false;

   if(fabs(max) > 0.00 && fabs(lucro) > fabs(max))
      return false;

   if(fabs(min) > 0.00 && fabs(lucro) < fabs(min))
      return false;

   if(check_temporizador(hora,espera,m_temporal_ref))
     {
      zeragem_compulsoria();
      return true;
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_filtro_barra(void)
  {
   MqlRates rates[];
   ZeroMemory(rates);
   ArraySetAsSeries(rates,true);

   if(CopyRates(M_SYMBOL,m_candle_tf,0,1,rates) < 1)
     {
      filtro_log("Falha em conferir o filtro de vela");
      return false;
     }

   double vela = NormalizeDouble((rates[0].high-rates[0].low)/M_POINT,0);
   double corpo = NormalizeDouble((rates[0].close-rates[0].open)/M_POINT,0);

   if(vela >= m_candle_min)
      if(vela < m_candle_max || m_candle_max == 0)
         if(fabs(corpo) >= m_corpo_min)
            if(fabs(corpo) < m_corpo_max || m_corpo_max == 0)
               return true;

   string msg = "Bloqueio por filtro de vela";
   filtro_log(msg);
   update_painel_descritivo(msg);
   return false;
  }
//+------------------------------------------------------------------+
//| Normalizar Preço                                                 |
//+------------------------------------------------------------------+
double EXECUCAO::normalizar(const double price)
  {
   double size = SymbolInfoDouble(M_SYMBOL,SYMBOL_TRADE_TICK_SIZE);

   if(size != 0.00)
      return(NormalizeDouble(MathRound(price/size)*size,M_DIGITS));

   return(NormalizeDouble(price,M_DIGITS));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EXECUCAO::check_procura_sinal(const bool compra, const bool saida, const datetime ultima)
  {
   bool usar = (saida) ? m_sinais_out : m_sinais_in;

   if(usar)
     {
      int max = (saida) ? _max_sell_out : _max_sell_in;

      if(compra)
         max = (saida) ? _max_buy_out : _max_buy_in;

      if(iTime(M_SYMBOL,m_timeframe,max) <= ultima)
        {
         string msg = "Aguardando liberação para buscar sinais";
         filtro_log(msg);
         update_painel_descritivo(msg);
         return false;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PROCESSAR::check_global(const bool excluir)
  {
   string global, txt;
   StringConcatenate(global,M_SYMBOL,"|",IntegerToString(m_magic));

   if(!excluir)
     {
      if(AccountInfoInteger(ACCOUNT_MARGIN_MODE) != ACCOUNT_MARGIN_MODE_RETAIL_HEDGING)
         for(int i=GlobalVariablesTotal()-1; i>=0; i--)
            if(StringFind(GlobalVariableName(i),M_SYMBOL+"|") == 0)
              {
               _magic_exist = true;
               filtro_log("A conta precisa ser HEDGING para adicionar mais de um robô no ativo");
               return false;
              }

      if(GlobalVariableCheck(global))
        {
         _magic_exist = true;
         StringConcatenate(txt,"ID do robô já em uso no ativo ",M_SYMBOL);
         filtro_log(txt);
         return false;
        }
      else
         if(GlobalVariableSet(global,m_magic) == 0)
           {
            StringConcatenate(txt,"Erro ",GetLastError()," ao tentar definir o ID para o robô em ",M_SYMBOL);
            filtro_log(txt);
            return false;
           }
     }
   else
      if(!_magic_exist)
         GlobalVariableDel(global);

   _magic_exist = false;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PROCESSAR::iniciando(void)
  {
   ResetLastError();
   ChartSetSymbolPeriod(0,_Symbol,m_timeframe);
   Sleep(300);

   _prefix_linha = Robot+"_LINHA_";
   _prefix_painel = Robot+"_PAINEL";
   _boleta = m_volume;
   _visual = false;
   _operar = true;

   if(!criar_log())
     {
      Alert("[",m_set,"] Falha ao criar as linhas do log");
      return false;
     }

   if(!check_ativo())
     {
      Alert("[",m_set,"] Falha em atribuir o ativo para cross order");
      return false;
     }

   if(m_sinais_in)
      if(m_compra_in > 0 || m_venda_in > 0)
        {
         Alert("[",m_set,"] Falha. Procura na vela seguinte da entrada inválido");
         Alert("[",m_set,"] Procura da vela só pode ser usado com o sinal de entrada 1");
         return false;
        }

   if(m_sinais_out)
      if(m_compra_out > 0 || m_venda_out > 0)
        {
         Alert("[",m_set,"] Falha. Procura na vela seguinte na saída inválido");
         Alert("[",m_set,"] Procura da vela só pode ser usado com o sinal de saída 1");
         return false;
        }

   check_visual();
   check_globais();

   if(m_inverte_in)
     {
      int inverter = _max_sell_in;
      _max_sell_in = _max_buy_in;
      _max_buy_in = inverter;
     }

   if(m_inverte_out)
     {
      int inverter = _max_sell_out;
      _max_sell_out = _max_buy_out;
      _max_buy_out = inverter;
     }

   if(!verificar_licenca())
     {
      Alert("[",m_set,"] Falha. Sem permissão de licença para esta conta");
      return false;
     }

   _vol_digitos = -1;

   if(!check_volumes())
     {
      Alert("[",m_set,"] Falha na verificação dos volumes");
      return false;
     }

   if(!criar_painel())
     {
      Alert("[",m_set,"] Falha em iniciar o painel gráfico");
      return false;
     }

   if(!check_linhas())
     {
      Alert("[",m_set,"] Falha em criar as etiquetas personalizadas");
      return false;
     }

   if(!check_indicadores())
     {
      Alert("[",m_set,"] Falha em iniciar os indicadores");
      return false;
     }

   if(!check_global(false))
     {
      Alert("[",m_set,"] Falha. Verifique IDs e símbolos em uso pressionando F3");
      return false;
     }

   EventSetTimer(1);
   _atualizar = true;

   int   grad_qtd[];
   ulong grad_ticket[];

   ArrayResize(grad_qtd,m_grad_qtd+1);
   ArrayResize(grad_ticket,m_grad_qtd+1);
   ZeroMemory(grad_qtd);
   ZeroMemory(grad_ticket);

   set_horario();
   set_grafico();
   s_position pos = posicao();
   s_ordem ord = ordens(grad_ticket,pos.hora,pos.tp,pos.sl);
   s_history his = historico(grad_qtd,pos.hora,true);
   _price_entrada = his.entrada;
   _price_medio = his.medio;

   update_painel_position(pos);
   update_painel_history(his);
   gerenciar_linhas(pos,ord,grad_ticket,his.entrada,his.medio);
   ChartRedraw();

   filtro_log("Robô ["+IntegerToString(m_magic)+"] iniciado com sucesso para "+M_SYMBOL);
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PROCESSAR::desligando(void)
  {
   check_global(true);
   excluir_indicadores();
   ObjectsDeleteAll(0,Robot,0);
   EventKillTimer();

   ChartSetInteger(0,CHART_SHOW_TRADE_LEVELS,true);
   ChartSetInteger(0,CHART_DRAG_TRADE_LEVELS,true);
   ChartSetInteger(0,CHART_COLOR_STOP_LEVEL,clrRed);
   ChartSetInteger(0,CHART_COLOR_VOLUME,clrLimeGreen);
   ChartRedraw();

   filtro_log("Robô ["+IntegerToString(m_magic)+"] removido completamente");
   Sleep(500);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PROCESSAR::processar_posicionado(const s_position &pos, const s_ordem &ord, const s_history &his, const int &grad_qtd[], const ulong &grad_ticket[])
  {
   check_alvos(pos.volume,pos.ticket,his.entrada,his.medio);
   check_pendentes(pos,ord,his);
   check_gradiente_linear(pos.volume,his.entrada,grad_qtd,grad_ticket,his.last,pos.tp,pos.sl,his.ult_time);
   update_painel_descritivo("Em operação");

   if(_teste)
      if(m_tarjas && _visual)
         processar_grafico(CHARTEVENT_CHART_CHANGE,0,0,NULL);

   if(check_metas(his.saldo,pos.lucro,his.max,his.min,false,true) ||
      check_metas(his.saldo_conta,pos.lucro,his.max_conta,his.min_conta,true,true))
     {
      zeragem_compulsoria();
      filtro_log("Zeragem por meta durante posição");
     }
   else
      if(!check_barra(false,pos.hora))
         update_painel_descritivo("Barra bloqueada para saída por execução");
      else
         if(check_saida_temporal(pos.hora,pos.lucro))
            filtro_log("Acionado saída por tempo");
         else
            if(!check_espera(pos.hora,m_espera_out))
               update_painel_descritivo("Aguardando tempo minímo para procurar saída");
            else
               if(check_delay())
                  if(pos.volume > 0.00)
                    {
                     if(check_procura_sinal(true,true,his.ult_time))
                       {
                        bool saida_compra = (m_inverte_out) ? check_saida_venda() : check_saida_compra();

                        if(saida_compra)
                           enviar_saida(pos.volume,ord.out);
                       }
                    }
                  else
                     if(check_procura_sinal(false,true,his.ult_time))
                       {
                        bool saida_venda = (m_inverte_out) ? check_saida_compra() : check_saida_venda();

                        if(saida_venda)
                           enviar_saida(pos.volume,ord.out);
                       }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PROCESSAR::processar_zerado(const s_history &his, ulong &grad_ticket[])
  {
   s_ordem ord = ordens(grad_ticket,0);

   if(!check_trades(his.cnt,his.gains))
      if(!check_metas(his.saldo,0.00,his.max,his.min,false,false))
         if(!check_metas(his.saldo_conta,0.00,his.max_conta,his.min_conta,true,false))
            if(!horario_operacional())
               update_painel_descritivo("Fora do horário operacional");
            else
               if(horario_espera())
                  update_painel_descritivo("Pausa no horário operacional");
               else
                  if(!check_barra(true,his.ult_time))
                     update_painel_descritivo("Barra bloqueada para entrada por execução");
                  else
                     if(!check_espera(his.ult_time,m_espera_in))
                        update_painel_descritivo("Aguardando tempo minímo para procurar entrada");
                     else
                        if(check_delay())
                           if(check_filtro_barra())
                             {
                              update_painel_descritivo("Procurando novas entradas");
                              bool comprar = false, vender = false;

                              if(check_procura_sinal(false,false,his.ult_time))
                                 vender = (m_inverte_in) ? check_entrada_compra() : check_entrada_venda();

                              if(vender)
                                {
                                 if(ord.buy > 0)
                                   {
                                    if(_cancel_oposto)
                                       enviar_ordem(TRADE_ACTION_REMOVE,ORDER_TYPE_BUY,0,ord.buy);
                                   }
                                 else
                                    if(ord.sell == 0)
                                       enviar_venda();

                                 return;
                                }

                              if(check_procura_sinal(true,false,his.ult_time))
                                 comprar = (m_inverte_in) ? check_entrada_venda() : check_entrada_compra();

                              if(comprar)
                                 if(ord.sell > 0)
                                   {
                                    if(_cancel_oposto)
                                       enviar_ordem(TRADE_ACTION_REMOVE,ORDER_TYPE_SELL,0,ord.sell);
                                   }
                                 else
                                    if(ord.buy == 0)
                                       enviar_compra();
                             }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PROCESSAR::processando(void)
  {
   static int grad_qtd[];
   static ulong grad_ticket[];

   if(ArraySize(grad_ticket) <= m_grad_qtd)
     {
      ArrayResize(grad_qtd,m_grad_qtd+1);
      ArrayResize(grad_ticket,m_grad_qtd+1);
     }

   _ticks_count = GetTickCount();
   s_position pos = posicao();
   s_ordem ord = ordens(grad_ticket,pos.hora,pos.tp,pos.sl);
   s_history his = historico(grad_qtd,pos.hora);

   _price_entrada = his.entrada;
   _price_medio = his.medio;
   gerenciar_linhas(pos,ord,grad_ticket,his.entrada,his.medio);

   if(!_operar)
     {
      update_painel_descritivo("Expert desabilitado pelo usuário");
      return;
     }

   if(check_conexao())
      if(check_ticks())
         if(horario_zeragem())
           {
            if(fabs(pos.volume) > 0.00)
               zeragem_compulsoria();

            ordens(grad_ticket,0);
            update_painel_descritivo("Horário de zeragem compulsória");
           }
         else
            if(fabs(pos.volume) > 0.00)
               processar_posicionado(pos,ord,his,grad_qtd,grad_ticket);
            else
               processar_zerado(his,grad_ticket);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit(void)
  {
   if(!in_pro.iniciando())
     {
      MessageBox("Consulte mais detalhes sobre o erro na aba diário e/ou na aba expert na caixa de ferramentas","FALHA NA INICIALIZAÇÃO!",MB_OK);
      return INIT_FAILED;
     }

   return INIT_SUCCEEDED;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   in_pro.desligando();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer(void)
  {
   in_pro.atualizar_hora();

   if(m_processo == es_seg || in_pro._atualizar)
      in_pro.processando();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick(void)
  {
   if(m_processo == es_tick)
      if(!in_pro._atualizar)
         in_pro.processando();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  {
   in_pro.processar_grafico(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTrade()
  {
   in_pro._atualizar = true;
  }
//+------------------------------------------------------------------+