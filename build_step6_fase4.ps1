$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$content = Get-Content $file -Encoding UTF8 -Raw

$old_falhas = @"
bool EXECUCAO::tsp_falha_compra(void) { return false; }
bool EXECUCAO::tsp_falha_venda(void) { return false; }
int EXECUCAO::tsp_calcular_score_compra(void) { return 0; }
int EXECUCAO::tsp_calcular_score_venda(void) { return 0; }
bool EXECUCAO::tsp_adx_favoravel(void) { return false; }
bool EXECUCAO::tsp_hilo_alta(void) { return false; }
bool EXECUCAO::tsp_hilo_baixa(void) { return false; }
"@

$new_falhas = @"
bool EXECUCAO::tsp_falha_compra(void) {
   return (_tsp_context.trend_confirm == 1);
}

bool EXECUCAO::tsp_falha_venda(void) {
   return (_tsp_context.trend_confirm == -1);
}

int EXECUCAO::tsp_calcular_score_compra(void) {
   int score = 0;
   
   if(_tsp_context.trend_macro == 1) score += m_tsp_w_macro;
   if(_tsp_context.trend_dominante == 1) score += m_tsp_w_dominante;
   else if(_tsp_context.trend_dominante == -1) score += m_tsp_penalidade;
   
   if(_tsp_context.trend_estrutural == 1) score += m_tsp_w_estrut;
   if(_tsp_context.trend_setup == 1) score += m_tsp_w_setup;
   
   if(tsp_falha_compra()) score += m_tsp_w_falha;
   
   if(m_tsp_usar_adx && tsp_adx_favoravel()) score += m_tsp_w_adx;
   if(m_tsp_usar_hilo && tsp_hilo_alta()) score += m_tsp_w_hilo;
   
   return score;
}

int EXECUCAO::tsp_calcular_score_venda(void) {
   int score = 0;
   
   if(_tsp_context.trend_macro == -1) score += m_tsp_w_macro;
   if(_tsp_context.trend_dominante == -1) score += m_tsp_w_dominante;
   else if(_tsp_context.trend_dominante == 1) score += m_tsp_penalidade;
   
   if(_tsp_context.trend_estrutural == -1) score += m_tsp_w_estrut;
   if(_tsp_context.trend_setup == -1) score += m_tsp_w_setup;
   
   if(tsp_falha_venda()) score += m_tsp_w_falha;
   
   if(m_tsp_usar_adx && tsp_adx_favoravel()) score += m_tsp_w_adx;
   if(m_tsp_usar_hilo && tsp_hilo_baixa()) score += m_tsp_w_hilo;
   
   return score;
}

bool EXECUCAO::tsp_adx_favoravel(void) {
   if(!m_tsp_usar_adx) return false;
   double adx = 0;
   if(!get_indicator_value(_handle_5, 0, 1, adx)) return false;
   return (adx >= m_tsp_adx_min);
}

bool EXECUCAO::tsp_hilo_alta(void) {
   if(!m_tsp_usar_hilo) return false;
   double hilo = 0;
   if(!get_indicator_value(_handle_4, 0, 1, hilo)) return false;
   double close[];
   if(CopyClose(_Symbol, _Period, 1, 1, close) <= 0) return false;
   return (close[0] > hilo);
}

bool EXECUCAO::tsp_hilo_baixa(void) {
   if(!m_tsp_usar_hilo) return false;
   double hilo = 0;
   if(!get_indicator_value(_handle_4, 0, 1, hilo)) return false;
   double close[];
   if(CopyClose(_Symbol, _Period, 1, 1, close) <= 0) return false;
   return (close[0] < hilo);
}
"@

$content = $content.Replace($old_falhas, $new_falhas)
[IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Fase 4 OK!"
