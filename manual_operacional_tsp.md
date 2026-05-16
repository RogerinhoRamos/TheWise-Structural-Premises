# 🎯 AS 8 ESTRATÉGIAS DE ENTRADA (O Cérebro)

O robô TheWise Structural Premises funciona como um piloto automático altamente customizável. Você escolhe o quão "exigente" ele deve ser antes de dar o tiro.

Você pode escolher um destes modos na tela de configurações (`Sinal entrada compra / venda`):

### 🟢 Nível Básico (Foco na Estrutura Principal - H2)
Nesses modos, o robô não olha o macro nem os filtros, apenas segue a direção matemática do Time Frame Estrutural (H2).

| Modo | Como funciona a mente do Robô | Exigência |
| :--- | :--- | :---: |
| **0. Tendência Estrutural** | 📈 O H2 fez topos e fundos maiores? Ele entra rasgando a mercado. Não espera nada. | ⭐ |
| **1. Tendência + Pullback** | 📈 A tendência é de alta, mas ele **não entra no topo**. Ele espera pacientemente o preço cair e pisar na "Zona de Desconto" (50% a 100% de Fibonacci). | ⭐⭐ |
| **2. Tend. + Pullback + Falha** | 📈 Caiu até a Zona de Fibo? Legal. Mas ele ainda não entra. Ele dá zoom no gráfico de 3 Minutos (M3) e só entra quando a quedinha do pullback **falha e o M3 volta a subir**. (Sniper!) | ⭐⭐⭐ |

### 🌟 Nível Avançado (Foco no Score Hierárquico)
Nesses modos, o robô ativa o cálculo de pontos. Ele lê o Semanal, Diário, H2 e M10. Para entrar, a pontuação tem que bater a sua nota mínima (ex: 7 pontos).

| Modo | Como funciona a mente do Robô | Exigência |
| :--- | :--- | :---: |
| **3. Score Contextual** | 🧮 O robô soma os pontos dos Time Frames. Deu nota 7 ou mais? Ele dispara a ordem na hora, onde o preço estiver. | ⭐⭐⭐ |
| **4. Score + Pullback** | 🧮 Bateu nota 7 e o preço recuou até a Zona de Fibo (pullback). Compra no desconto com contexto forte. | ⭐⭐⭐⭐ |
| **5. Score + Pullback + Falha** | 🧮 **A entrada suprema:** Nota 7 alcançada + Preço caiu na Zona + Gráfico menor de 3 Minutos tentou cair mais e falhou. | ⭐⭐⭐⭐⭐ |
| **6. Score + ADX** | 🧮 Contexto nota 7, mas ele só deixa a entrada passar se o ADX confirmar que há força e volume no movimento. | ⭐⭐⭐⭐ |

### 🕹️ Nível Manual
| Modo | Como funciona a mente do Robô | Exigência |
| :--- | :--- | :---: |
| **7. Sem Sinal / Manual** | 🛑 O robô vira apenas um assistente de gestão. Ele não toma decisão nenhuma sozinho. Fica esperando você clicar no botão do painel. | — |

---

# 🚪 AS SAÍDAS E PROTEÇÕES (Os Alvos e Escudos)

Uma vez que o robô entrou na operação, como ele sai? O **padrão base original** cuidará da retaguarda com um arsenal pesado.

### 1. Saídas Estruturais (Leitura de Contexto)
Essas saídas não dependem do preço bater num limite fixo. Elas reagem à geometria do mercado:
* 📉 **Opção "Inversão de Tendência"**: Se você comprou, e do nada o gráfico H2 vira pra baixa (fazendo topos e fundos descendentes), o robô encerra o trade ali mesmo e assume a perda ou o lucro parcial, porque o contexto mudou.

### 2. Alvos Fixos (A Trincheira)
Você define linhas de limite nas configurações:
* 🎯 **Take Profit (TP)**: Seu alvo final em pontos. Bateu, lucro no bolso.
* 🛑 **Stop Loss (SL)**: O cinto de segurança. Limite máximo de perda em pontos.

### 3. Gerenciamento Dinâmico (As Armas Avançadas)
O robô possui robôs menores dentro dele que vigiam o seu dinheiro enquanto o alvo final (TP) não chega:
* 🛡️ **Breakeven**: "Proteção no zero a zero". O mercado andou X pontos a seu favor? O robô puxa o seu Stop Loss para o ponto de entrada. Se o mercado voltar tudo na sua cara, você sai ileso.
* 🏄 **Trailing Stop**: "Surfando a onda". Conforme o mercado vai subindo, o robô vai puxando seu Stop Loss para cima, degrau por degrau. Se o mercado reverter de vez, você é "stoppado no gain".
* 🍰 **Saídas Parciais**: O robô fraciona sua mão. (Ex: Entrou com 5 contratos. Ao andar 300 pontos ele vende 2 contratos para garantir um trocado, e deixa os outros 3 buscarem o alvo longo).

---
*Este documento é parte integrante da documentação TheWise Structural Premises V1.*

---

# 🧠 A LÓGICA DO PREMISSAS NA PRÁTICA (O "Olho da Mosca")

Muitos traders ao iniciar o uso do **TheWise Structural Premises** se perguntam: *"Em qual tempo gráfico devo colocar o robô? Por que ele comprou no topo em vez do fundo?"*. 

Abaixo detalhamos como alinhar a visão discricionária de um trader profissional (o conceito de *Premissas* real) com os parâmetros do robô:

### 1. O Timeframe do Gráfico vs O Cérebro do Robô
Você pode abrir e deixar o robô rodando no gráfico de **M1** ou **M3**. 
* **Isso interfere na leitura da tendência?** Não! Nossa arquitetura é blindada. Mesmo que o gráfico visual esteja no M3, o "cérebro" do robô consulta independentemente o Semanal, Diário, H2 e M10 no background.
* **Por que rodar no M1 ou M3 é melhor?** Porque o robô processa a inteligência a cada formação de *candle*. Num tempo menor, ele lê os *ticks* mais rápido e reage aos gatilhos instantaneamente, caçando a entrada perfeita (o "olho da mosca").

### 2. Evitando Entradas no Topo (Modos de Operação)
Se você percebeu que o robô realizou uma compra exatamente na crista do pivô (rompimento), é porque o seu **Sinal de Entrada** estava configurado no **Modo 0: Tendência Estrutural**.
* **Como o Modo 0 pensa:** *"O H2 fez topos e fundos ascendentes? É tendência! Compro a mercado agora mesmo!"*. Ele **não** espera o recuo.
* **O Ajuste (Operando Pullback):** Para que o robô aguarde o preço cair até o "desconto" (sua Zona Verde de Fibonacci), você deve configurar o sinal para o **Modo 1 (Tendência + Pullback)** ou **Modo 2 (Tendência + Pullback + Falha)**. Assim, ele vai ignorar o topo e só atirará quando o preço pisar dentro da caixa de retração.

### 3. Simulando a "Visão do Especialista" (Setup Sniper)
Se você gosta de operar os gatilhos curtos (ex: a retração do 10 minutos com gatilho no 1 minuto) para pegar o verdadeiro "olho da mosca", veja como configurar o robô para refletir essa leitura:
1. Vá nas configurações (Inputs) do robô e mude o **Timeframe Estrutural** de H2 para **M10**.
2. Mantenha (ou mude) o **Timeframe de Confirmação** no **M1** (ou M3).
3. Use o **Modo 2 (Tend. + Pullback + Falha)** como o seu Sinal entrada compra/venda.

**O que vai acontecer na tela?** 
A linha amarela de pivôs e a caixa verde de Fibonacci vão encolher e se adaptar à estrutura micro do 10 minutos. O robô vai aguardar o candle do 10 minutos retrair até a metade do movimento (Zona Verde), e quando o gráfico de 1 minuto tentar cair, perder a força e reverter para alta (a famosa *falha micro* ou *teste no olho da mosca*), o robô senta o dedo na operação exatamente no melhor ponto possível da retração!
