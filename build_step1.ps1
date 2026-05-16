$file = "d:\Projetos 2026 Antigravity\Robo TheWise Structural Premises\TheWise Structural Premises V1.mq5"
$lines = Get-Content $file -Encoding UTF8
$out = @()

for($i=0; $i -lt $lines.Count; $i++) {
    $ln = $i + 1  # 1-indexed

    # === HEADER (lines 1-9) ===
    if($ln -eq 5) {
        $out += '#property copyright   "TheWise Structural Premises"'
        continue
    }
    if($ln -eq 6) {
        $out += '#property link        "https://github.com/rogerinhoramos"'
        continue
    }
    if($ln -eq 7) {
        $out += '#property version     "1.00"'
        continue
    }
    if($ln -eq 8) {
        $out += '#property description "TheWise Structural Premises V1"'
        continue
    }
    if($ln -eq 9) {
        $out += '#property description "Structural context. Operational premises. Probabilistic execution."'
        continue
    }

    # === ENUMS e_buys_in (lines 248-255) ===
    if($ln -eq 248) {
        $out += 'enum e_buys_in'
        $out += '  {'
        $out += '   es_buy_in_1 = 0, // [TSP] Tendencia Estrutural'
        $out += '   es_buy_in_2 = 1, // [TSP] Tendencia + Pullback'
        $out += '   es_buy_in_3 = 2, // [TSP] Tendencia + Pullback + Falha'
        $out += '   es_buy_in_4 = 3, // [TSP] Score Contextual'
        $out += '   es_buy_in_5 = 4, // [TSP] Score + Pullback'
        $out += '   es_buy_in_6 = 5, // [TSP] Score + Pullback + Falha'
        $out += '   es_buy_in_7 = 6, // [TSP] Score + ADX'
        $out += '   es_buy_in_8 = 7  // Sem Sinal /Boleta-Manual'
        $out += '  };'
        # Skip original lines 248-255
        $i = 254  # will be incremented to 255 (line 256)
        continue
    }

    # === ENUMS e_sells_in (lines 257-264) ===
    if($ln -eq 257) {
        $out += 'enum e_sells_in'
        $out += '  {'
        $out += '   es_sell_in_1 = 0, // [TSP] Tendencia Estrutural'
        $out += '   es_sell_in_2 = 1, // [TSP] Tendencia + Pullback'
        $out += '   es_sell_in_3 = 2, // [TSP] Tendencia + Pullback + Falha'
        $out += '   es_sell_in_4 = 3, // [TSP] Score Contextual'
        $out += '   es_sell_in_5 = 4, // [TSP] Score + Pullback'
        $out += '   es_sell_in_6 = 5, // [TSP] Score + Pullback + Falha'
        $out += '   es_sell_in_7 = 6, // [TSP] Score + ADX'
        $out += '   es_sell_in_8 = 7  // Sem Sinal /Boleta-Manual'
        $out += '  };'
        $i = 263
        continue
    }

    # === ENUMS e_buys_out (lines 266-271) ===
    if($ln -eq 266) {
        $out += 'enum e_buys_out'
        $out += '  {'
        $out += '   es_buy_out_1 = 0, // Inversao Tendencia Estrutural'
        $out += '   es_buy_out_2 = 1, // Sem sinal de saida'
        $out += '   es_buy_out_3 = 2  // Desativado'
        $out += '  };'
        $i = 270
        continue
    }

    # === ENUMS e_sells_out (lines 273-278) ===
    if($ln -eq 273) {
        $out += 'enum e_sells_out'
        $out += '  {'
        $out += '   es_sell_out_1 = 0, // Inversao Tendencia Estrutural'
        $out += '   es_sell_out_2 = 1, // Sem sinal de saida'
        $out += '   es_sell_out_3 = 2  // Desativado'
        $out += '  };'
        $i = 277
        continue
    }

    # === Identity (lines 472-475) ===
    if($ln -eq 472) {
        $out += '#define Robot "TSP_V1"'
        continue
    }
    if($ln -eq 473) {
        $out += '#define Expert "TheWise-TSP-V1"'
        continue
    }
    if($ln -eq 474) {
        $out += '#property description "Expert Advisor TheWise Structural Premises V1"'
        continue
    }
    if($ln -eq 475) {
        $out += '#property description "Autor: Rogerinho Ramos - Structural context, Operational premises"'
        continue
    }

    # Default: keep original line
    $out += $lines[$i]
}

$out | Set-Content $file -Encoding UTF8
Write-Host "Step 1 OK - $($out.Count) lines written"
