# 🛡️ TheWise Structural Premises V1

![TSP Hero](hero.png)

**TheWise Structural Premises (TSP)** é um robô de negociação avançado para MetaTrader 5, focado em leitura de estrutura de mercado, confluências multi-timeframe e execução probabilística.

## 🚀 Diferenciais do Projeto
- **Leitura Estrutural de Mercado**: Identificação automática de pivôs, topos e fundos em múltiplos tempos gráficos.
- **Engine de Score Contextual**: Só executa ordens quando o cenário (W1, D1, H2, M10) atinge uma nota mínima de confiança.
- **Gatilho Sniper**: Entradas de precisão baseadas em falhas de pivô dentro de zonas de retração de Fibonacci.
- **Interface Premium**: Dashboard moderno e intuitivo integrado ao gráfico do MT5.
- **Proteção Integrada**: Sistema de licenciamento por conta e data de expiração.

## 📊 Estratégias (Dashboard)
O robô exibe dinamicamente o modo operacional ativo:
- `TREND`: Operações a favor da tendência estrutural.
- `SNIPER`: Operações de retração com gatilho de falha.
- `SUPREME`: O nível máximo de confluência (Nota + Retração + Falha).
- `SC+ADX`: Contexto estrutural validado pela força do ADX.

## 📂 Estrutura do Repositório
- `/index.html`: Landing Page profissional do projeto.
- `/manual_operacional_tsp.html`: Manual técnico completo para usuários.
- `/TheWise Structural Premises V1.mq5`: Código fonte da engine estrutural.
- `/*.set`: Arquivos de configuração otimizados para diversos ativos (WIN, WDO, PETR4, VALE3).

---
## 🛠️ Instalação e Uso
1. Copie o arquivo `.mq5` para a pasta `MQL5/Experts` do seu MetaTrader 5.
2. Copie os arquivos `.set` para `MQL5/Presets`.
3. Compile o código e arraste para o gráfico.
4. Certifique-se de que o **AlgoTrading** está habilitado.

## 📞 Contato e Suporte
Para licenciamento ou suporte técnico, entre em contato via:
- **GitHub**: [rogerinhoramos](https://github.com/rogerinhoramos)
- **Website**: [Acesse a Landing Page](index.html)

---
*Aviso Legal: Negociar no mercado financeiro envolve riscos. O uso deste robô não garante lucros e deve ser utilizado com cautela e gerenciamento de risco profissional.*
