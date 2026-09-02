---
title: "Arquitetura de Sistemas Embebidos (ASE) — Preparação para o Exame"
subtitle: "Banco de perguntas por secção (simulação de exame)"
lang: pt-PT
---

# Como usar este documento

Documento de estudo organizado por secções, no formato esperado do exame de ASE
(ver `prof.md` e o exame de 2024 em `Conteudo.pdf`). Cada secção tem várias
perguntas. As resoluções estão imediatamente a seguir a cada enunciado.

Tópicos cobertos (segundo o professor): fundamentos de sistemas embebidos e
microcontroladores; proposta de arquitetura para um problema; análise de código;
escrita de funções em C; esquema elétrico; aspetos transversais (gamas de
representação, ponteiros, frequência/período/duty-cycle); conhecimento geral.

Sensores em foco: **DHT20** (humidade/temperatura por I2C — datasheet deste ano)
e **TC74** (temperatura por I2C — usado no exame de 2024).

\newpage

# Secção 1 — Fundamentos de sistemas embebidos e microcontroladores

**P1.1.** O que é um sistema embebido e em que difere de um sistema computacional
de uso geral?

**P1.2.** Indica três características típicas de um sistema embebido.

**P1.3.** O que são pinos multiplexados? Dá exemplo de dois pinos do ESP32-C6 que
*não* o são e explica porquê.

**P1.4.** Distingue requisitos de tempo real *hard* (estrito) de *soft* (flexível).

**P1.5.** Quais as vantagens de usar um RTOS (ex.: FreeRTOS) em vez de uma
abordagem *bare-metal*?

**P1.6.** No ESP-IDF, qual é a principal diferença do FreeRTOS portado face ao
FreeRTOS "básico"?

\newpage

# Secção 2 — Aspetos transversais: representação, gamas e ponteiros

**P2.1.** Qual a gama de valores representáveis com 16 bits sem sinal? E com 16
bits de endereçamento, qual o intervalo de endereços?

**P2.2.** Com $N$ bits, qual a gama em representação sem sinal e em complemento
para dois (com sinal)?

**P2.3.** Converte `0x1E` para decimal e para binário.

**P2.4.** Define período, frequência e duty-cycle de um sinal periódico e as suas
relações.

**P2.5.** Um PWM de 8 bits controla o brilho de um LED. Se a temperatura lida for
`0x1E`, qual o duty-cycle (em %) usando a regra "valor / valor_máximo"?

**P2.6.** Explica, em C, a diferença entre `*` e `&` e o que significa o parâmetro
`uint8_t* pTemp`.

**P2.7.** Considera `uint8_t buf[4]; uint8_t *p = buf;`. O que representam
`p+2` e `*(p+2)`?

**P2.8.** No FreeRTOS, para que servem os tipos `TickType_t` e `BaseType_t`?

\newpage

# Secção 3 — Esquema elétrico (I2C vs SPI)

> Nota: no exame estes esquemas são **desenhados à mão**. Aqui são descritos por
> lista de ligações (pino-a-pino). Pratica a desenhá-los.

**P3.1.** Quais os sinais de um barramento I2C e de um barramento SPI? Como os
distingues num esquema?

**P3.2.** Desenha (descreve) o esquema do sistema com **DHT20 + ESP32-C6 +
ventoinha**: o ESP lê a humidade por I2C e controla a ventoinha por PWM.

**P3.3.** Variante com **LED** em vez de ventoinha (como no exame 2024): que
componente adicionas em série com o LED e a que pino?

**P3.4.** Um display TFT liga-se tipicamente por SPI. Que sinais esperarias ver e
em que difere isso de ligar o DHT20?

\newpage

# Secção 4 — Análise de código (FreeRTOS + Basic I/O)

**P4.1.** No código seguinte (Lab2), porque é que a leitura de humidade nunca é
executada?

```c
void Task1() { while (true) { printf("reading temperature \n");
               vTaskDelay(1000 / portTICK_PERIOD_MS); } }
void Task2() { while (true) { printf("reading humidity \n");
               vTaskDelay(2000 / portTICK_PERIOD_MS); } }
void app_main(void) { Task1(); Task2(); }
```

**P4.2.** Corrige o código anterior para que ambas as leituras corram, usando
`xTaskCreate`.

**P4.3.** No padrão de notificações (Lab2), porque é que a task recetora *não*
precisa de `vTaskDelay`? E qual o tempo máximo que pode ficar bloqueada à espera?

```c
void Receiver(void* params) { while (true) {
    ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
    printf("received notification\n"); } }
```

**P4.4.** Para que serve um semáforo usado como *mutex* no acesso a um recurso
partilhado (ex.: `WriteToDevice`)?

**P4.5.** Na leitura de um botão por interrupção (Lab3), porque se usa uma *fila*
(`xQueueSendFromISR` / `xQueueReceive`) em vez de imprimir dentro da ISR?

**P4.6.** No exemplo de ADC one-shot (Lab3), a conversão é
`voltage = (adcRawVal / 4095.0f) * (1.1f/0.25f);`. Explica `4095` e o fator
`1.1/0.25`, e porque o valor pode divergir do real.

\newpage

# Secção 5 — Escrita de funções em C (TC74 e DHT20)

## 5.1 TC74 (modelo do exame de 2024)

**P5.1.** Escreve `tc74_wakeup`, que tira o sensor de standby escrevendo `0x00` no
registo de configuração.

**P5.2.** Escreve `tc74_is_temperature_ready`, que devolve `true` se o bit READY
do registo de configuração estiver ativo.

**P5.3.** Escreve `tc74_read_temp_after_cfg`, que envia o comando RTR e lê a
temperatura logo a seguir.

**P5.4.** Escreve `tc74_read_temp_after_temp`, que lê a temperatura sem reenviar o
comando (o ponteiro de registo já aponta para RTR).

**P5.5.** Escreve `tc74_standby`, que coloca o sensor em standby (escreve a máscara
de standby no registo de configuração).

**P5.6.** Escreve `tc74_wakeup_and_read_temp`, que acorda o sensor, espera que a
leitura esteja pronta e lê a temperatura.

## 5.2 DHT20 (sensor de humidade/temperatura deste ano)

> Dados do datasheet: endereço I2C `0x38`; após power-on esperar >100 ms; ler
> status (`0x71`) e verificar `status & 0x18 == 0x18` (calibrado); disparar
> medição com `0xAC, 0x33, 0x00`; esperar ~80 ms; ler 7 bytes (status + 6 dados +
> CRC); bit[7] do status = busy. Conversões: $RH\% = \frac{S_{RH}}{2^{20}}\times100$,
> $T = \frac{S_T}{2^{20}}\times200 - 50$.

**P5.7.** Escreve `dht20_trigger_measurement`, que dispara uma medição enviando
`0xAC 0x33 0x00`.

**P5.8.** Escreve `dht20_is_busy`, que lê o byte de status e devolve `true` se o
bit de "busy" (bit 7) estiver a 1.

**P5.9.** Escreve `dht20_read`, que dispara a medição, espera ~80 ms, lê 7 bytes e
devolve humidade relativa e temperatura (floats) por ponteiro.

**P5.10.** Escreve `set_led_duty_cycle`, que mapeia uma temperatura no intervalo
[tempMin, tempMax] para o duty-cycle do LED (PWM via LEDC).

**P5.11.** Descreve, por palavras, o que faz uma `app_main` típica que lê o sensor
e ajusta o atuador (LED/ventoinha) em função da leitura.

\newpage

# Secção 6 — Arquitetura de um sistema (problema aberto)

**P6.1.** Pretende-se um sistema que **mede a humidade** do ar; se ultrapassar um
limiar, **liga uma ventoinha**; regista as leituras num **cartão SD** e publica-as
por **MQTT**. Propõe a arquitetura: blocos, periféricos, barramentos e tasks.

**P6.2.** Nesse sistema, justifica a escolha de barramentos: porquê I2C para o
sensor e SPI para o cartão SD?

**P6.3.** Como garantirias que a leitura do sensor e a escrita no SD não se
interferem quando partilham dados?

\newpage

# Secção 7 — Conhecimento geral / escolha múltipla

> No exame, assinala apenas **uma** opção. (Solução a **negrito**.)

**P7.1.** Quantos valores distintos representa um registo de 16 bits sem sinal?

a) 16  b) 256  c) 32768  d) 65536

**P7.2.** Qual destes barramentos usa as linhas SDA e SCL?

a) SPI  b) I2C  c) UART  d) CAN

**P7.3.** No FreeRTOS, `vTaskDelay` coloca a task em que estado?

a) Running  b) Ready  c) Blocked  d) Suspended

**P7.4.** Um PWM com período 10 ms e tempo ativo 2,5 ms tem que duty-cycle e
frequência?

a) 25% e 100 Hz  b) 75% e 100 Hz  c) 25% e 10 Hz  d) 40% e 100 Hz

**P7.5.** Um ADC de 12 bits produz no máximo que valor?

a) 1023  b) 2047  c) 4095  d) 65535

**P7.6.** Qual o endereço I2C do DHT20?

a) 0x38  b) 0x48  c) 0x68  d) 0x76

**P7.7.** No DHT20, que comando dispara uma medição?

a) 0x71  b) 0xAC 0x33 0x00  c) 0xE1  d) 0xBA

**P7.8.** Para que uma função em C devolva um valor "para fora" através de um
parâmetro, esse parâmetro deve ser:

a) passado por valor  b) um `int` normal  c) um ponteiro  d) `const`

