# CONTEXTO — THEWISE STRUCTURAL PREMISES
Versão: 2.0
Projeto: TheWise Structural Premises
Origem: Evolução do TheWise HiLo V4
Base operacional: Engine padrão base original
Autor: Rogerinho Ramos

---

# 1. VISÃO GERAL DO PROJETO

O projeto TheWise Structural Premises nasce como evolução do robô TheWise HiLo V4.

O objetivo NÃO é criar apenas mais um robô baseado em indicadores.

A proposta é construir:

- uma engine estrutural;
- uma plataforma de pesquisa operacional;
- um framework modular para leitura contextual;
- uma arquitetura preparada para:
  - backtest;
  - robustez;
  - WFA;
  - IA futura;
  - multiativos;
  - análise probabilística.

---

# 2. FILOSOFIA CENTRAL

A estratégia NÃO opera:

- cruzamento simples;
- indicador isolado;
- candle aleatório.

Ela opera:

- estrutura;
- contexto;
- gatilho;
- falha;
- continuidade;
- probabilidade;
- confluência multi-timeframe.

Princípio central:

"Contexto maior manda.
O menor apenas autoriza."

---

# 3. ORIGEM DO PROJETO

O projeto nasce da evolução do:

- TheWise HiLo V4;
- Engine padrão base original;
- lógica operacional baseada em:
  - HiLo;
  - filtros;
  - contexto;
  - ADX;
  - janelas;
  - gerenciamento operacional.

A nova proposta é:

ANTES:
HiLo → decisão final.

AGORA:
Estrutura → contexto.
Falha → gatilho.
HiLo → confirmação opcional.

---

# 4. OBJETIVOS PRINCIPAIS

## Objetivos operacionais

- reduzir entradas ruins em lateralização;
- preservar entradas em tendência;
- operar continuidade estrutural;
- validar contexto antes da entrada;
- operar apenas cenários probabilísticos.

---

## Objetivos técnicos

- criar arquitetura modular;
- permitir otimização;
- permitir robustez;
- permitir WFA;
- permitir expansão futura;
- permitir IA estrutural;
- permitir dashboards analíticos.

---

# 5. HIERARQUIA CONTEXTUAL DOS TEMPOS GRÁFICOS

A metodologia original utiliza múltiplos timeframes de forma hierárquica.

Cada timeframe possui uma função específica dentro da leitura operacional.

A estratégia NÃO utiliza múltiplos tempos gráficos repetindo a mesma lógica.

Cada camada possui um propósito contextual.

---

## Hierarquia oficial da metodologia

A metodologia original utiliza leitura hierárquica multi-timeframe.

O projeto NÃO utilizará timeframes apenas como filtros repetidos.

Cada timeframe possui:

- função específica;
- peso contextual;
- responsabilidade estrutural;
- papel operacional.

A lógica central da metodologia é:

```text
Semanal → viés macro
Diário → estrutura dominante
H2 → tendência operacional
M10 → setup
M1/M3 → execução
```

Essa hierarquia será parte central da arquitetura do projeto.

| Função | Timeframe |
|---|---|
| Contexto Macro | Semanal |
| Estrutura Dominante | Diário |
| Estrutura Operacional | H2 / 120min |
| Setup Operacional | M10 |
| Confirmação | M5 / M3 |
| Entrada Fina | M1 |

---

## Função de cada timeframe

### Semanal

Responsável por:

- direção macro;
- viés principal;
- alvo amplo;
- contexto institucional;
- cenário dominante.

O semanal funciona como:

# Macro Bias

---

### Diário

Responsável por:

- estrutura dominante;
- continuidade principal;
- regiões relevantes;
- alinhamento estrutural.

O diário funciona como:

# Dominant Structure

---

### H2 / 120min

Responsável por:

- estrutura operacional;
- rompimentos;
- impulsões;
- tendência operacional.

O H2 funciona como:

# Operational Structure

---

### M10

Responsável por:

- setup;
- gatilho;
- pullback;
- região operacional.

O M10 funciona como:

# Setup Trigger

---

### M5 / M3

Responsável por:

- confirmação;
- refinamento;
- leitura microestrutural.

---

### M1

Responsável por:

- timing;
- falha;
- execução fina.

O M1 funciona como:

# Execution Timing

---

## Timeframes configuráveis

A arquitetura do TheWise Structural Premises será totalmente configurável.

O operador poderá:

- alterar timeframes;
- adaptar ativos;
- adaptar perfil operacional;
- adaptar modo scalper;
- adaptar swing intraday;
- adaptar criptomoedas;
- adaptar commodities;
- adaptar índices.

Exemplos possíveis:

---

## Modo Swing Intraday

```cpp
TF_Macro      = PERIOD_W1;
TF_Dominante  = PERIOD_D1;
TF_Estrutural = PERIOD_H2;
TF_Setup      = PERIOD_M10;
TF_Confirm    = PERIOD_M3;
TF_Entrada    = PERIOD_M1;
```

---

## Modo Scalper

```cpp
TF_Macro      = PERIOD_D1;
TF_Dominante  = PERIOD_H4;
TF_Estrutural = PERIOD_H1;
TF_Setup      = PERIOD_M5;
TF_Confirm    = PERIOD_M1;
TF_Entrada    = PERIOD_M1;
```

---

## Modo Crypto

```cpp
TF_Macro      = PERIOD_D1;
TF_Dominante  = PERIOD_H4;
TF_Estrutural = PERIOD_H1;
TF_Setup      = PERIOD_M15;
TF_Confirm    = PERIOD_M5;
TF_Entrada    = PERIOD_M1;
```

---

## Conceito importante

A estratégia NÃO depende obrigatoriamente de:

- W1;
- D1;
- H2;
- M10.

Esses timeframes representam:

- funções operacionais;
- níveis hierárquicos;
- camadas contextuais.

A engine deverá permitir:

- adaptação;
- pesquisa;
- robustez;
- comparação estatística;
- múltiplos cenários operacionais.

---

A engine deverá permitir configuração completa dos timeframes.

Exemplo:

```cpp
input ENUM_TIMEFRAMES TF_Macro      = PERIOD_W1;
input ENUM_TIMEFRAMES TF_Dominante  = PERIOD_D1;
input ENUM_TIMEFRAMES TF_Estrutural = PERIOD_H2;
input ENUM_TIMEFRAMES TF_Setup      = PERIOD_M10;
input ENUM_TIMEFRAMES TF_Confirm    = PERIOD_M3;
input ENUM_TIMEFRAMES TF_Entrada    = PERIOD_M1;
```

---

## Importância da hierarquia

A estratégia NÃO busca operar:

- sinais isolados;
- entradas aleatórias;
- cruzamentos simples.

A lógica correta é:

- semanal define viés;
- diário define estrutura dominante;
- H2 define contexto operacional;
- M10 monta o setup;
- M1/M3 autorizam entrada.

---

## Objetivo da hierarquia contextual

Evitar:

- operar contra contexto maior;
- operar pullbacks ruins;
- operar reversões fracas;
- operar movimentos sem continuidade.

A hierarquia contextual é um dos pilares principais da metodologia.

---|---|
| Contexto Macro | Semanal |
| Direção Estrutural | Diário |
| Estrutura Principal | H2 |
| Setup Operacional | M10 |
| Confirmação | M5/M3 |
| Entrada Fina | M1 |

---

# 6. CONCEITOS CENTRAIS

## 6.1 Estrutura

Mercado trabalha em:

- HH (Higher High)
- HL (Higher Low)
- LH (Lower High)
- LL (Lower Low)

A estratégia busca identificar:

- tendência;
- rompimento;
- continuidade;
- falha estrutural.

---

## 6.2 Gatilho

Gatilho = movimento que rompe uma estrutura anterior.

Esse movimento passa a representar:

- origem da impulsão;
- referência operacional;
- região de teste;
- região probabilística.

---

## 6.3 Pullback

Após rompimento:

O preço tende a retornar.

Regiões principais:

- 50%
- 61.8%
- 100%

Essas regiões serão chamadas de:

- zonas operacionais.

---

## 6.4 Falha

A falha é um dos pilares centrais.

Exemplo:

- mercado tenta inverter;
- NÃO consegue;
- tendência original continua.

Isso representa:

- rejeição;
- absorção;
- continuidade estrutural.

---

## 6.5 Confluência

A estratégia exige:

- alinhamento estrutural;
- contexto favorável;
- falha confirmada;
- espaço para alvo;
- score mínimo.

---

# 6.6 Score Hierárquico

A engine trabalhará com score contextual baseado em múltiplos timeframes.

Exemplo:

| Contexto | Peso |
|---|---|
| Semanal alinhado | +3 |
| Diário alinhado | +3 |
| H2 alinhado | +2 |
| M10 alinhado | +2 |
| M1 confirmou | +1 |
| Contra estrutura dominante | -3 |

Objetivo:

- validar contexto;
- evitar entradas contra tendência dominante;
- priorizar continuidade estrutural;
- melhorar qualidade estatística.

---

# 7. ESTRUTURA DA ENGINE

A nova arquitetura será modular.

---

# 7.0 MacroEngine

Arquivo:

MacroEngine.mqh

Responsável por:

- leitura do semanal;
- direção macro;
- viés dominante;
- contexto amplo.

Funções previstas:

```cpp
bool MacroAlta();
bool MacroBaixa();
bool MacroLateral();
```

---

# 7.0.1 DominantEngine

Arquivo:

DominantEngine.mqh

Responsável por:

- leitura do diário;
- estrutura dominante;
- continuidade principal;
- regiões estruturais.

Funções previstas:

```cpp
bool DominanteAlta();
bool DominanteBaixa();
```

---

# 7.1 StructureEngine

Arquivo:

StructureEngine.mqh

Responsável por:

- detectar HH;
- detectar HL;
- detectar LH;
- detectar LL;
- detectar tendência;
- detectar rompimentos;
- detectar continuidade.

Funções previstas:

```cpp
bool DetectarTendenciaAlta();
bool DetectarTendenciaBaixa();

double UltimoTopo();
double UltimoFundo();

bool RompeuTopo();
bool RompeuFundo();
```

---

# 7.2 TriggerEngine

Arquivo:

TriggerEngine.mqh

Responsável por:

- detectar gatilho;
- detectar impulsão;
- detectar candle estrutural;
- identificar origem do movimento.

Funções previstas:

```cpp
bool DetectarGatilhoCompra();
bool DetectarGatilhoVenda();

double GatilhoHigh();
double GatilhoLow();
```

---

# 7.3 PullbackEngine

Arquivo:

PullbackEngine.mqh

Responsável por:

- calcular retrações;
- identificar zonas operacionais;
- validar teste estrutural.

Funções previstas:

```cpp
double Zona50();
double Zona618();
double Zona100();

bool EmZonaCompra();
bool EmZonaVenda();
```

---

# 7.4 FailureEngine

Arquivo:

FailureEngine.mqh

Responsável por:

- detectar falha;
- detectar microestrutura;
- detectar rejeição;
- detectar continuidade.

Funções previstas:

```cpp
bool FalhaCompra();
bool FalhaVenda();
```

---

# 7.5 ScoreEngine

Arquivo:

ScoreEngine.mqh

Responsável por:

- calcular score operacional;
- validar confluência;
- bloquear entradas ruins.

Funções previstas:

```cpp
int CalcularScoreCompra();
int CalcularScoreVenda();
```

---

# 8. SCORE OPERACIONAL

Exemplo inicial:

| Critério | Pontos |
|---|---|
| H2 alinhado | +2 |
| M10 alinhado | +2 |
| Falha confirmada | +3 |
| ADX favorável | +1 |
| HiLo alinhado | +1 |
| Espaço para alvo | +1 |
| Contra estrutura | -3 |

Entrada permitida:

```text
Score >= 7
```

---

# 9. HILO COMO FILTRO

O HiLo NÃO será removido.

Ele passará a ser:

- filtro opcional;
- confirmação secundária;
- apoio contextual.

Exemplo:

```cpp
input bool UsarHiLoConfirmacao = false;
```

---

# 10. ESTRUTURA DA ENTRADA

## COMPRA

Condições:

- H2 em alta;
- M10 em alta;
- rompimento estrutural;
- pullback até zona operacional;
- falha de venda no M1/M3;
- score mínimo atingido.

---

## VENDA

Condições:

- H2 em baixa;
- M10 em baixa;
- rompimento estrutural;
- pullback até zona operacional;
- falha de compra no M1/M3;
- score mínimo atingido.

---

# 11. PRIMEIRA VERSÃO (V1)

A V1 NÃO executará ordens.

Objetivo:

- validar leitura estrutural;
- validar lógica;
- validar score;
- validar falha;
- validar contexto.

A V1 será:

# Estrutural Visual.

---

# 12. O QUE A V1 FARÁ

## Detectar:

- tendência;
- gatilho;
- pullback;
- falha;
- score;
- contexto.

---

## Mostrar:

- linhas;
- regiões;
- informações no painel;
- logs estruturais.

---

## NÃO fará:

- entrada automática;
- execução operacional.

---

# 13. PAINEL OPERACIONAL

O painel atual do TheWise HiLo será reaproveitado.

Manter:

- visual profissional;
- botões;
- gestão;
- logs;
- posição;
- lucro;
- histórico;
- controles.

---

## Novas informações

Adicionar:

```text
ESTRUTURA H2
ESTRUTURA M10
GATILHO
PULLBACK
FALHA
SCORE
```

---

# 14. ARQUITETURA BASE

A base operacional continuará usando:

- Engine padrão base original;
- modularização atual;
- framework operacional atual.

Estrutura já existente:

- GLOBAL
- GRAFICO
- CONTROLE
- HORARIO
- EXECUCAO
- PROCESSAR

Essas estruturas serão preservadas.

---

# 15. O QUE SERÁ PRESERVADO

## NÃO alterar:

- painel;
- execução;
- trailing;
- parcial;
- gradiente;
- gerenciamento;
- metas;
- logs;
- horários;
- framework padrão base original.

---

# 16. O QUE SERÁ ALTERADO

Principalmente:

```cpp
check_entrada_compra()
check_entrada_venda()
```

Substituindo:

- entradas HiLo puras;
- sinais simplistas;
- dependência exclusiva de buffers.

---

# 17. SISTEMA DE SINAIS

A engine atual já possui:

```cpp
check_sinal()
```

Esse sistema será reaproveitado.

Ele já:

- lê buffers;
- lê indicadores;
- compara valores;
- trabalha com candles;
- abstrai sinais.

Isso permitirá:

- evolução rápida;
- modularidade;
- expansão futura.

---

# 18. ENUMS FUTUROS

Exemplo:

```cpp
enum e_buys_in
{
   es_buy_in_1,
   es_buy_in_2,
   es_buy_in_3,
   es_buy_in_4,
   es_buy_in_5,
   es_buy_in_6, // Structural Premises
   es_buy_in_7, // Structural + HiLo
   es_buy_in_8  // Structural + Score
};
```

---

# 19. BACKTEST E PESQUISA

O projeto será preparado para:

- backtest MT5;
- otimização genética;
- robustez;
- Monte Carlo;
- Walk Forward Analysis;
- análise multiativo;
- análise por horário;
- análise por volatilidade.

---

# 20. TESTES DE ROBUSTEZ

Futuramente:

- spread variável;
- slippage;
- atraso;
- Monte Carlo;
- troca de parâmetros;
- teste fora da amostra;
- teste multi contratos.

---

# 21. WALK FORWARD ANALYSIS

Estrutura futura:

```text
Treina 3 meses
Testa 1 mês
```

Objetivo:

- validar estabilidade;
- evitar overfitting;
- validar edge real.

---

# 22. ROADMAP

## V1
Estrutural Visual.

---

## V2
Alertas estruturais.

---

## V3
Semi automático.

---

## V4
Automático.

---

## V5
Research Engine completo.

---

# 23. FUTURO DO PROJETO

O projeto será preparado para:

- IA estrutural;
- machine learning;
- fluxo;
- tape reading;
- scanners;
- dashboards;
- múltiplos ativos;
- commodities;
- índices;
- criptomoedas.

---

# 24. IDENTIDADE DO PROJETO

Nome oficial:

# TheWise Structural Premises

Sigla:

# TSP

Conceito:

"Structural context.
Operational premises.
Probabilistic execution."

---

# 25. FILOSOFIA FINAL

O projeto NÃO busca prever mercado.

Busca:

- interpretar estrutura;
- validar contexto;
- detectar falha;
- operar probabilidade;
- buscar continuidade estrutural.

A essência do projeto é:

# Estrutura + Contexto + Falha + Continuidade

---

# 26. OBSERVAÇÃO IMPORTANTE

A estratégia original possui:

- subjetividade;
- leitura visual;
- interpretação contextual.

Portanto:

A missão da engine NÃO é transformar o método em:

- cruzamento simples;
- robô genérico;
- EA simplista.

A missão é:

- objetivar a leitura;
- preservar contexto;
- preservar hierarquia;
- preservar lógica operacional.

---

# 27. STATUS ATUAL

✔️ Base operacional validada
✔️ Engine padrão base original analisada
✔️ Painel validado
✔️ Estrutura modular confirmada
✔️ Estratégia conceitual definida
✔️ Roadmap definido
✔️ Nome oficial definido
🔄 Próxima etapa: implementação da StructureEngine


---

# 14. STATUS DA IMPLEMENTAÇÃO (V1)
*Atualizado automaticamente.*

A arquitetura descrita foi implementada com sucesso no código fonte via MQL5.
Principais integrações realizadas:
- **Motor Multi-Timeframe Simutâneo:** A cada tick o robô calcula dinamicamente a tendência (HH/HL/LH/LL) dos 5 timeframes (W1, D1, H2, M10, M3) de forma otimizada.
- **Engine de Gatilhos e Zonas:** A perna de impulsão estrutural do H2 é projetada via Fibonacci com níveis (50% e 100%) e tolerância em pontos.
- **Sistema de Score:** Implementado integralmente. As entradas dos modos mais robustos agora checam a pontuação baseada no alinhamento de macro, dominante, estrutural, setup, falha micro e conversores externos (ADX e HiLo opcionais).
- **Substituição Completa:** A estrutura legada HiLo-only do padrão base original foi trocada para a arquitetura TSP.



## Atualização de Interface Premium (16/05/2026)
- Implementado sistema de "Guardião do Design" para evitar deleção de objetos pelo loop do MT5.
- Padronização de cores de status (Verde para habilitado, Vermelho para erro).
- Inclusão de moldura 3D na boleta e linha divisória institucional.

---

# 14. ATUALIZAÇÕES RECENTES (MAIO/2026)

## 14.1 Nova Interface "Clean & Pro"
- **Design Institucional**: Implementação de fundo sólido (Navy Deep) para maior clareza visual.
- **Nomenclatura Inteligente**: Substituição de números por siglas intuitivas no dashboard:
  - **TREND**: Tendência Pura (Modo 0)
  - **PULLBACK**: Retração de Fibo (Modo 1)
  - **SNIPER**: Retração + Falha Micro (Modo 2)
  - **SCORE**: Apenas Nota de Contexto (Modo 3)
  - **SC+PB**: Nota + Retração (Modo 4)
  - **SUPREME**: Nota + Retração + Falha (Modo 5)
  - **SC+ADX**: Nota + Força ADX (Modo 6)

## 14.2 Sistema de Licenciamento
- **Trava por Conta**: Implementação de array de contas autorizadas (_contas) com suporte inicial para 10 IDs.
- **Whitelist**: Uso da variável _permitidas para alternar entre modo aberto (0) e modo travado.
- **Validade Temporal**: Sincronização rigorosa com a data de expiração no dashboard.

## 14.3 Melhorias de UX (Experiência do Usuário)
- **Auto-Documentação**: Inclusão de comentários descritivos em todos os parâmetros input. Agora, o usuário vê a explicação do parâmetro diretamente na janela de configurações do MetaTrader 5.
- **Throttling de Frequência**: Ajuste da trava de barras (_max_buy_in) para 1, permitindo agilidade sem comprometer a segurança de ordens duplicadas no mesmo candle.

