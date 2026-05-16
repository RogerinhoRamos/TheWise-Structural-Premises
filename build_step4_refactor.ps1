$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$content = Get-Content $file -Encoding UTF8 -Raw

# Replace struct definition
$content = $content -replace "(?s)struct s_tsp_structural \{.*?\};", "struct s_tsp_context {
   int trend_macro;
   int trend_dominante;
   int trend_estrutural;
   int trend_setup;
   int trend_confirm;
   double str_last_high;
   double str_last_low;
};"

# Replace variable declaration
$content = $content -replace "s_tsp_structural\s+_tsp_structural;", "s_tsp_context           _tsp_context;"

# Replace usage in switch cases
$content = $content -replace "_tsp_structural\.trend", "_tsp_context.trend_estrutural"
$content = $content -replace "_tsp_structural\.last_high", "_tsp_context.str_last_high"
$content = $content -replace "_tsp_structural\.last_low", "_tsp_context.str_last_low"

# Replace function declarations
$content = $content -replace "void\s+tsp_classificar_tendencia\(void\);", "int               tsp_get_trend(ENUM_TIMEFRAMES tf, double &last_high, double &last_low);"

# Replace method implementations at the end of the file
$old_implementations = @"
void EXECUCAO::tsp_update(void) {
   // Update a cada tick
   tsp_detectar_pivots();
   tsp_classificar_tendencia();
}
"@

$new_update = @"
void EXECUCAO::tsp_update(void) {
   // 1. Atualizar pivos estruturais (H2) para o desenho visual e zonas de pullback
   tsp_detectar_pivots();
   
   // 2. Classificar tendencia de TODOS os 5 Timeframes hierarquicos
   double h = 0, l = 0;
   _tsp_context.trend_macro      = tsp_get_trend(m_tf_macro, h, l);
   _tsp_context.trend_dominante  = tsp_get_trend(m_tf_dominante, h, l);
   _tsp_context.trend_estrutural = tsp_get_trend(m_tf_estrutural, _tsp_context.str_last_high, _tsp_context.str_last_low);
   _tsp_context.trend_setup      = tsp_get_trend(m_tf_setup, h, l);
   _tsp_context.trend_confirm    = tsp_get_trend(m_tf_confirm, h, l);
}
"@

$content = $content.Replace($old_implementations, $new_update)

$old_classificar = @"
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
"@

$new_get_trend = @"
int EXECUCAO::tsp_get_trend(ENUM_TIMEFRAMES tf, double &last_high, double &last_low) {
   double high[], low[];
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   
   if(CopyHigh(_Symbol, tf, 0, m_tsp_pivot_lookback, high) <= 0) return 0;
   if(CopyLow(_Symbol, tf, 0, m_tsp_pivot_lookback, low) <= 0) return 0;
   
   int fb = m_tsp_fractal_bars;
   
   double t1 = 0, t2 = 0; 
   double f1 = 0, f2 = 0; 
   int found_t = 0, found_f = 0;
   
   for(int i = fb; i < m_tsp_pivot_lookback - fb; i++) {
      bool is_high = true;
      bool is_low = true;
      
      for(int j = 1; j <= fb; j++) {
         if(high[i] <= high[i-j] || high[i] <= high[i+j]) is_high = false;
         if(low[i] >= low[i-j] || low[i] >= low[i+j]) is_low = false;
      }
      
      if(is_high && found_t < 2) {
         if(found_t == 0) t1 = high[i];
         if(found_t == 1) t2 = high[i];
         found_t++;
      }
      
      if(is_low && found_f < 2) {
         if(found_f == 0) f1 = low[i];
         if(found_f == 1) f2 = low[i];
         found_f++;
      }
      
      if(found_t == 2 && found_f == 2) break;
   }
   
   if(found_t > 0) last_high = t1;
   if(found_f > 0) last_low = f1;
   
   if(found_t == 2 && found_f == 2) {
      if(t1 > t2 && f1 > f2) return 1;
      if(t1 < t2 && f1 < f2) return -1;
   }
   return 0;
}
"@

$content = $content.Replace($old_classificar, $new_get_trend)

[IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Refactored successfully"
