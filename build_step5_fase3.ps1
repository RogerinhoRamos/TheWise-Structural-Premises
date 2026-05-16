$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$content = Get-Content $file -Encoding UTF8 -Raw

$old_compra = "bool EXECUCAO::tsp_em_zona_compra(void) { return false; }"
$old_venda = "bool EXECUCAO::tsp_em_zona_venda(void) { return false; }"

$new_compra = @"
bool EXECUCAO::tsp_em_zona_compra(void) {
   if(_tsp_context.trend_estrutural != 1) return false;
   
   double dist = _tsp_context.str_last_high - _tsp_context.str_last_low;
   if(dist <= 0) return false;
   
   double fib_sup = _tsp_context.str_last_high - (dist * (m_tsp_fibo_sup / 100.0));
   double fib_inf = _tsp_context.str_last_high - (dist * (m_tsp_fibo_inf / 100.0));
   
   double tolerance = m_tsp_zona_tol * _Point;
   fib_sup += tolerance;
   fib_inf -= tolerance;
   
   double price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   
   return (price <= fib_sup && price >= fib_inf);
}
"@

$new_venda = @"
bool EXECUCAO::tsp_em_zona_venda(void) {
   if(_tsp_context.trend_estrutural != -1) return false;
   
   double dist = _tsp_context.str_last_high - _tsp_context.str_last_low;
   if(dist <= 0) return false;
   
   double fib_sup = _tsp_context.str_last_low + (dist * (m_tsp_fibo_sup / 100.0));
   double fib_inf = _tsp_context.str_last_low + (dist * (m_tsp_fibo_inf / 100.0));
   
   double tolerance = m_tsp_zona_tol * _Point;
   fib_sup -= tolerance; // Ask grows down in price chart logic? No, ask is price. Tolerance expands the zone.
   fib_inf += tolerance;
   
   double price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   
   return (price >= fib_sup && price <= fib_inf);
}
"@

$content = $content.Replace($old_compra, $new_compra)
$content = $content.Replace($old_venda, $new_venda)

[IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Fase 3 Zonas completed!"
