$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$lines = Get-Content $file -Encoding UTF8
$out = @()

for($i=0; $i -lt $lines.Count; $i++) {
    $ln = $lines[$i]
    if ($ln -match "// Funcoes TSP") {
        $out += $ln
        $out += "   void              tsp_update(void);"
        $out += "   void              tsp_detectar_pivots(void);"
        $out += "   void              tsp_classificar_tendencia(void);"
        # we skip the existing tsp_update in the loop to avoid duplication
        continue
    }
    if ($ln -match "void              tsp_update\(void\);") {
        continue
    }
    $out += $ln
}

$out | Set-Content $file -Encoding UTF8

$implementations = @"

//+------------------------------------------------------------------+
//| [TSP] MOTOR ESTRUTURAL (FASE 2)                                  |
//+------------------------------------------------------------------+
void EXECUCAO::tsp_update(void) {
   // Update a cada tick
   tsp_detectar_pivots();
   tsp_classificar_tendencia();
}

void EXECUCAO::tsp_detectar_pivots(void) {
   // Logica simplificada de deteccao de fractais
   ENUM_TIMEFRAMES tf = m_tf_estrutural;
   double high[], low[];
   datetime time[];
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(time, true);
   
   if(CopyHigh(_Symbol, tf, 0, m_tsp_pivot_lookback, high) <= 0) return;
   if(CopyLow(_Symbol, tf, 0, m_tsp_pivot_lookback, low) <= 0) return;
   if(CopyTime(_Symbol, tf, 0, m_tsp_pivot_lookback, time) <= 0) return;
   
   int fb = m_tsp_fractal_bars;
   
   _tsp_pivot_str_count = 0;
   
   for(int i = fb; i < m_tsp_pivot_lookback - fb; i++) {
      bool is_high = true;
      bool is_low = true;
      
      for(int j = 1; j <= fb; j++) {
         if(high[i] <= high[i-j] || high[i] <= high[i+j]) is_high = false;
         if(low[i] >= low[i-j] || low[i] >= low[i+j]) is_low = false;
      }
      
      if(is_high || is_low) {
         if(_tsp_pivot_str_count < m_tsp_pivot_count) {
            _tsp_pivots_str[_tsp_pivot_str_count].time = time[i];
            _tsp_pivots_str[_tsp_pivot_str_count].price = is_high ? high[i] : low[i];
            _tsp_pivots_str[_tsp_pivot_str_count].type = is_high ? 1 : -1;
            _tsp_pivot_str_count++;
         }
      }
   }
}

void EXECUCAO::tsp_classificar_tendencia(void) {
   // Se nao tivermos pivos suficientes, tendencia eh indefinida
   if(_tsp_pivot_str_count < 4) {
      _tsp_structural.trend = 0;
      return;
   }
   
   double t1 = 0, t2 = 0; // t1 = ultimo, t2 = penultimo
   double f1 = 0, f2 = 0; // f1 = ultimo, f2 = penultimo
   
   int found_t = 0, found_f = 0;
   
   for(int i = 0; i < _tsp_pivot_str_count; i++) {
      if(_tsp_pivots_str[i].type == 1 && found_t < 2) {
         if(found_t == 0) t1 = _tsp_pivots_str[i].price;
         if(found_t == 1) t2 = _tsp_pivots_str[i].price;
         found_t++;
      }
      if(_tsp_pivots_str[i].type == -1 && found_f < 2) {
         if(found_f == 0) f1 = _tsp_pivots_str[i].price;
         if(found_f == 1) f2 = _tsp_pivots_str[i].price;
         found_f++;
      }
   }
   
   _tsp_structural.last_high = t1;
   _tsp_structural.last_low = f1;
   
   // Classificar HH, HL, LH, LL
   if(found_t == 2 && found_f == 2) {
      if(t1 > t2 && f1 > f2) _tsp_structural.trend = 1; // Alta (Topos e fundos ascendentes)
      else if(t1 < t2 && f1 < f2) _tsp_structural.trend = -1; // Baixa (Topos e fundos descendentes)
      else _tsp_structural.trend = 0; // Lateral
   } else {
      _tsp_structural.trend = 0;
   }
}

// Stubs para funcoes futuras compilar
bool EXECUCAO::tsp_em_zona_compra(void) { return false; }
bool EXECUCAO::tsp_em_zona_venda(void) { return false; }
bool EXECUCAO::tsp_falha_compra(void) { return false; }
bool EXECUCAO::tsp_falha_venda(void) { return false; }
int EXECUCAO::tsp_calcular_score_compra(void) { return 0; }
int EXECUCAO::tsp_calcular_score_venda(void) { return 0; }
bool EXECUCAO::tsp_adx_favoravel(void) { return false; }
bool EXECUCAO::tsp_hilo_alta(void) { return false; }
bool EXECUCAO::tsp_hilo_baixa(void) { return false; }

"@

Add-Content -Path $file -Value $implementations -Encoding UTF8

Write-Host "Fase 2 completed!"
