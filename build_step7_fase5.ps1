$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$content = Get-Content $file -Encoding UTF8 -Raw

# 1. Add declarations
$content = $content -replace "void\s+tsp_detectar_pivots\(void\);", "void              tsp_detectar_pivots(void);`r`n   void              tsp_draw_pivots(void);`r`n   void              tsp_draw_zones(void);`r`n   void              tsp_log_estrutural(void);"

# 2. Add calls to tsp_update
$old_update = @"
   _tsp_context.trend_setup      = tsp_get_trend(m_tf_setup, h, l);
   _tsp_context.trend_confirm    = tsp_get_trend(m_tf_confirm, h, l);
}
"@
$new_update = @"
   _tsp_context.trend_setup      = tsp_get_trend(m_tf_setup, h, l);
   _tsp_context.trend_confirm    = tsp_get_trend(m_tf_confirm, h, l);
   
   tsp_draw_pivots();
   tsp_draw_zones();
   tsp_log_estrutural();
}
"@
$content = $content.Replace($old_update, $new_update)

# 3. Add implementations
$implementations = @"

void EXECUCAO::tsp_draw_pivots(void) {
   if(!m_tsp_draw_pivots || _tsp_pivot_str_count < 2) return;
   
   for(int i = 0; i < _tsp_pivot_str_count - 1; i++) {
      string name = "TSP_PIVOT_" + IntegerToString(i);
      if(ObjectFind(0, name) < 0) {
         ObjectCreate(0, name, OBJ_TREND, 0, _tsp_pivots_str[i].time, _tsp_pivots_str[i].price, _tsp_pivots_str[i+1].time, _tsp_pivots_str[i+1].price);
      } else {
         ObjectSetInteger(0, name, OBJPROP_TIME, 0, _tsp_pivots_str[i].time);
         ObjectSetDouble(0, name, OBJPROP_PRICE, 0, _tsp_pivots_str[i].price);
         ObjectSetInteger(0, name, OBJPROP_TIME, 1, _tsp_pivots_str[i+1].time);
         ObjectSetDouble(0, name, OBJPROP_PRICE, 1, _tsp_pivots_str[i+1].price);
      }
      ObjectSetInteger(0, name, OBJPROP_COLOR, m_tsp_cor_pivot);
      ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
      ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, false);
   }
}

void EXECUCAO::tsp_draw_zones(void) {
   if(!m_tsp_draw_zones) return;
   if(_tsp_context.trend_estrutural == 0) return;
   
   double dist = _tsp_context.str_last_high - _tsp_context.str_last_low;
   if(dist <= 0) return;
   
   double fib_sup = 0, fib_inf = 0;
   color cor = clrNONE;
   
   if(_tsp_context.trend_estrutural == 1) {
      fib_sup = _tsp_context.str_last_high - (dist * (m_tsp_fibo_sup / 100.0));
      fib_inf = _tsp_context.str_last_high - (dist * (m_tsp_fibo_inf / 100.0));
      cor = m_tsp_cor_alta;
   } else {
      fib_sup = _tsp_context.str_last_low + (dist * (m_tsp_fibo_sup / 100.0));
      fib_inf = _tsp_context.str_last_low + (dist * (m_tsp_fibo_inf / 100.0));
      cor = m_tsp_cor_baixa;
   }
   
   double tolerance = m_tsp_zona_tol * _Point;
   if(_tsp_context.trend_estrutural == 1) {
       fib_sup += tolerance;
       fib_inf -= tolerance;
   } else {
       fib_sup -= tolerance;
       fib_inf += tolerance;
   }
   
   datetime t1 = _tsp_pivots_str[0].time; 
   datetime t2 = TimeCurrent() + PeriodSeconds(_Period) * 10;
   
   string name = "TSP_ZONE";
   if(ObjectFind(0, name) < 0) {
      ObjectCreate(0, name, OBJ_RECTANGLE, 0, t1, fib_sup, t2, fib_inf);
   } else {
      ObjectSetInteger(0, name, OBJPROP_TIME, 0, t1);
      ObjectSetDouble(0, name, OBJPROP_PRICE, 0, fib_sup);
      ObjectSetInteger(0, name, OBJPROP_TIME, 1, t2);
      ObjectSetDouble(0, name, OBJPROP_PRICE, 1, fib_inf);
   }
   ObjectSetInteger(0, name, OBJPROP_COLOR, cor);
   ObjectSetInteger(0, name, OBJPROP_BACK, true);
   ObjectSetInteger(0, name, OBJPROP_FILL, true);
}

void EXECUCAO::tsp_log_estrutural(void) {
   static datetime last_log = 0;
   if(TimeCurrent() - last_log < 60) return; // Log 1x por minuto
   
   if(!m_tsp_show_score) return;
   
   string t_str = _tsp_context.trend_estrutural == 1 ? "ALTA" : (_tsp_context.trend_estrutural == -1 ? "BAIXA" : "LATERAL");
   int score_c = tsp_calcular_score_compra();
   int score_v = tsp_calcular_score_venda();
   
   string msg = StringFormat("[TSP] Estrutura: %s | Score C: %d | Score V: %d", t_str, score_c, score_v);
   update_painel_descritivo(msg);
   
   last_log = TimeCurrent();
}
"@

$content = $content + $implementations
[IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Fase 5 completed!"
