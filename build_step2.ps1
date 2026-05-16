$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$lines = Get-Content $file -Encoding UTF8
$out = @()

for($i=0; $i -lt $lines.Count; $i++) {
    $ln = $i + 1

    # === Replace RSI/HiLo/ADX inputs (lines 688-704) with TSP inputs ===
    if($ln -eq 688) {
        $out += 'sinput group "--- [TSP] TIMEFRAMES HIERARQUICOS ---"'
        $out += 'input ENUM_TIMEFRAMES m_tf_macro      = PERIOD_W1;   // TF Macro (Vies)'
        $out += 'input ENUM_TIMEFRAMES m_tf_dominante  = PERIOD_D1;   // TF Dominante'
        $out += 'input ENUM_TIMEFRAMES m_tf_estrutural = PERIOD_H2;   // TF Estrutural'
        $out += 'input ENUM_TIMEFRAMES m_tf_setup      = PERIOD_M10;  // TF Setup'
        $out += 'input ENUM_TIMEFRAMES m_tf_confirm    = PERIOD_M3;   // TF Confirmacao'
        $out += ''
        $out += 'sinput group "--- [TSP] DETECCAO ESTRUTURAL ---"'
        $out += 'input int    m_tsp_fractal_bars   = 3;     // Barras p/ pivo (esq/dir)'
        $out += 'input int    m_tsp_pivot_lookback = 100;   // Barras historico p/ pivos'
        $out += 'input int    m_tsp_pivot_count    = 10;    // Qtd pivos armazenados'
        $out += ''
        $out += 'sinput group "--- [TSP] PULLBACK / ZONAS ---"'
        $out += 'input double m_tsp_fibo_sup       = 50.0;  // Zona superior (%)'
        $out += 'input double m_tsp_fibo_inf       = 100.0; // Zona inferior (%)'
        $out += 'input double m_tsp_zona_tol       = 20;    // Tolerancia zona (pts)'
        $out += ''
        $out += 'sinput group "--- [TSP] SCORE ---"'
        $out += 'input int    m_tsp_score_min      = 7;     // Score minimo para entrada'
        $out += 'input int    m_tsp_w_macro        = 3;     // Peso: Macro alinhado'
        $out += 'input int    m_tsp_w_dominante    = 3;     // Peso: Dominante alinhado'
        $out += 'input int    m_tsp_w_estrut       = 2;     // Peso: Estrutural alinhado'
        $out += 'input int    m_tsp_w_setup        = 2;     // Peso: Setup alinhado'
        $out += 'input int    m_tsp_w_falha        = 3;     // Peso: Falha confirmada'
        $out += 'input int    m_tsp_w_adx          = 1;     // Peso: ADX favoravel'
        $out += 'input int    m_tsp_w_hilo         = 1;     // Peso: HiLo (se ativado)'
        $out += 'input int    m_tsp_penalidade     = -3;    // Penalidade contra dominante'
        $out += ''
        $out += 'sinput group "--- [TSP] FILTROS OPCIONAIS ---"'
        $out += 'input e_sn   m_tsp_usar_adx       = true;  // Usar ADX como filtro'
        $out += 'input int    m_tsp_adx_period     = 14;    // Periodo ADX'
        $out += 'input double m_tsp_adx_min        = 18.0;  // ADX minimo'
        $out += 'input e_sn   m_tsp_usar_hilo      = false; // Usar HiLo confirmacao'
        $out += 'input double m_tsp_hilo_period    = 8;     // Periodo HiLo (se ativado)'
        $out += ''
        $out += 'sinput group "--- [TSP] VISUAL ---"'
        $out += 'input e_sn   m_tsp_draw_pivots    = true;  // Desenhar pivos'
        $out += 'input e_sn   m_tsp_draw_zones     = true;  // Desenhar zonas retracao'
        $out += 'input e_sn   m_tsp_draw_trend     = true;  // Desenhar linhas tendencia'
        $out += 'input e_sn   m_tsp_show_score     = true;  // Mostrar score no painel'
        $out += 'input color  m_tsp_cor_alta       = clrLimeGreen;  // Cor alta'
        $out += 'input color  m_tsp_cor_baixa      = clrTomato;     // Cor baixa'
        $out += 'input color  m_tsp_cor_zona       = clrDodgerBlue; // Cor zonas'
        $out += 'input color  m_tsp_cor_pivot      = clrGold;       // Cor pivos'
        # Skip original lines 688-704
        $i = 703
        continue
    }

    # === Replace check_indicadores (lines 705-720) ===
    if($ln -eq 705) {
        $out += 'bool CONTROLE::check_indicadores(void) { '
        $out += 'iniciar_handles();'
        $out += 'ENUM_TIMEFRAMES tf = (MQLInfoInteger(MQL_TESTER)) ? m_timeframe : _Period;'
        $out += ''
        $out += '// ADX (opcional)'
        $out += 'if(m_tsp_usar_adx) {'
        $out += '   _handle_5=iADX(_Symbol,tf,m_tsp_adx_period);'
        $out += '   if(_handle_5 == INVALID_HANDLE) return false;'
        $out += '}'
        $out += ''
        $out += '// HiLo (opcional)'  
        $out += 'if(m_tsp_usar_hilo) {'
        $out += '   _handle_4=iCustom(_Symbol,tf,"HiLo V1.ex5",m_tsp_hilo_period);'
        $out += '   if(_handle_4 == INVALID_HANDLE) return false;'
        $out += '}'
        $out += ''
        $out += '// TSP: Inicializar arrays de pivos'
        $out += 'ArrayResize(_tsp_pivots_str, m_tsp_pivot_count);'
        $out += 'ArrayResize(_tsp_pivots_cfm, m_tsp_pivot_count);'
        $out += '_tsp_pivot_str_count = 0;'
        $out += '_tsp_pivot_cfm_count = 0;'
        $out += '_tsp_trigger.active = false;'
        $out += ''
        $out += 'int window[8] = {-1,-1,-1,-1,-1,-1,-1,-1};'
        $out += 'check_windows(window);'
        $out += 'return true;}'
        # Skip original lines 705-720
        $i = 719
        continue
    }

    # === Replace HiLo janela + adx + entrada/saida (lines 732-895) ===
    if($ln -eq 732) {
        # Skip old HiLo janela compra (732-775)
        $i = 774; continue
    }
    if($ln -eq 776) {
        # Skip old HiLo janela venda (776-819)
        $i = 818; continue
    }
    if($ln -eq 820) {
        # Skip old check_adx_minimo (820-826)
        $i = 825; continue
    }

    # === Replace check_entrada_compra (line 827) ===
    if($ln -eq 827) {
        $out += 'bool EXECUCAO::check_entrada_compra(void) { int sinal = 0; '
        $out += 'tsp_update();'
        $out += 'switch(m_compra_in) {'
        $out += '   case 0: // Tendencia Estrutural'
        $out += '      if(_tsp_structural.trend == 1) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 1: // Tendencia + Pullback'
        $out += '      if(_tsp_structural.trend == 1 && tsp_em_zona_compra()) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 2: // Tendencia + Pullback + Falha'
        $out += '      if(_tsp_structural.trend == 1 && tsp_em_zona_compra() && tsp_falha_compra()) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 3: // Score Contextual'
        $out += '      if(tsp_calcular_score_compra() >= m_tsp_score_min) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 4: // Score + Pullback'
        $out += '      if(tsp_calcular_score_compra() >= m_tsp_score_min && tsp_em_zona_compra()) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 5: // Score + Pullback + Falha'
        $out += '      if(tsp_calcular_score_compra() >= m_tsp_score_min && tsp_em_zona_compra() && tsp_falha_compra()) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 6: // Score + ADX'
        $out += '      if(tsp_calcular_score_compra() >= m_tsp_score_min && tsp_adx_favoravel()) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 7: // Manual'
        $out += '      break;'
        $out += '}'
        $out += ' return false;} '
        # Skip original lines 827-845
        $i = 844; continue
    }

    # === Replace check_saida_compra (line 846) ===
    if($ln -eq 846) {
        $out += 'bool EXECUCAO::check_saida_compra(void) { int sinal = 0; '
        $out += 'switch(m_compra_out) {'
        $out += '   case 0: // Inversao tendencia'
        $out += '      tsp_update();'
        $out += '      if(_tsp_structural.trend == -1) { sinal = 1; return true; }'
        $out += '      break;'
        $out += '   case 1: break; // Sem sinal saida'
        $out += '   case 2: break; // Desativado'
        $out += '}'
        $out += ' return false;} '
        # Skip original lines 846-857
        $i = 856; continue
    }

    # === Replace check_entrada_venda (line 858) ===
    if($ln -eq 858) {
        $out += 'bool EXECUCAO::check_entrada_venda(void) { int sinal = 0; '
        $out += 'tsp_update();'
        $out += 'switch(m_venda_in) {'
        $out += '   case 0: if(_tsp_structural.trend == -1) { sinal = 1; return true; } break;'
        $out += '   case 1: if(_tsp_structural.trend == -1 && tsp_em_zona_venda()) { sinal = 1; return true; } break;'
        $out += '   case 2: if(_tsp_structural.trend == -1 && tsp_em_zona_venda() && tsp_falha_venda()) { sinal = 1; return true; } break;'
        $out += '   case 3: if(tsp_calcular_score_venda() >= m_tsp_score_min) { sinal = 1; return true; } break;'
        $out += '   case 4: if(tsp_calcular_score_venda() >= m_tsp_score_min && tsp_em_zona_venda()) { sinal = 1; return true; } break;'
        $out += '   case 5: if(tsp_calcular_score_venda() >= m_tsp_score_min && tsp_em_zona_venda() && tsp_falha_venda()) { sinal = 1; return true; } break;'
        $out += '   case 6: if(tsp_calcular_score_venda() >= m_tsp_score_min && tsp_adx_favoravel()) { sinal = 1; return true; } break;'
        $out += '   case 7: break;'
        $out += '}'
        $out += ' return false;} '
        $i = 875; continue
    }

    # === Replace check_saida_venda (line 877) ===
    if($ln -eq 877) {
        $out += 'bool EXECUCAO::check_saida_venda(void) { int sinal = 0; '
        $out += 'switch(m_venda_out) {'
        $out += '   case 0: tsp_update(); if(_tsp_structural.trend == 1) { sinal = 1; return true; } break;'
        $out += '   case 1: break;'
        $out += '   case 2: break;'
        $out += '}'
        $out += ' return false;} '
        $i = 887; continue
    }

    $out += $lines[$i]
}

$out | Set-Content $file -Encoding UTF8
Write-Host "Step 2 OK - $($out.Count) lines"
