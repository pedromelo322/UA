---
title: "Arquitetura de Sistemas Embebidos (ASE) — Preparação para o Exame"
subtitle: "Banco de perguntas por secção (com resoluções)"
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

<!--ANS-->
**Resposta:** Um sistema embebido é um sistema computacional especializado,
dedicado a uma função específica, frequentemente com restrições de tempo real,
energia e recursos. Difere de um computador de uso geral porque: (1) é dedicado
e não generalista; (2) opera tipicamente sem interface humana direta, enquanto um
computador comum exige sistema operativo e I/O interativos; (3) tem recursos
limitados (memória, CPU, energia) otimizados para a tarefa.
<!--/ANS-->

**P1.2.** Indica três características típicas de um sistema embebido.

<!--ANS-->
**Resposta:** Restrições de tempo real (deadlines), baixo consumo de energia,
recursos limitados de memória/processamento, dedicação a uma função específica,
fiabilidade elevada e funcionamento contínuo, muitas vezes sem SO ou com um RTOS.
<!--/ANS-->

**P1.3.** O que são pinos multiplexados? Dá exemplo de dois pinos do ESP32-C6 que
*não* o são e explica porquê.

<!--ANS-->
**Resposta:** Pinos multiplexados são pinos que podem desempenhar múltiplas
funções (GPIO, I2C, SPI, PWM, etc.), selecionadas por software através do IO MUX /
GPIO matrix. No ESP32-C6 **todos os GPIO0–GPIO30 são multiplexados** (30 GPIOs no
encapsulamento QFN40). Os pinos que **não** são multiplexados são os pinos
dedicados do chip (fora da matriz de GPIO, com uma única função fixa):
**CHIP_PU** (enable/reset); os pinos de **alimentação** VDDA3P3, VDDPST1, VDDPST2,
VDDA1, VDDA2 (e VDD_SPI) e **GND**; os pinos do **cristal** XTAL_P/XTAL_N; e
**ANT** (RF/antena). Dois exemplos: **CHIP_PU** e **GND**.

> Atenção: GPIO8 e GPIO9 (a resposta do exame de 2024, que usava um ESP32-C3)
> **são** multiplexados — apenas servem *também* de *strapping pins* (amostrados
> no arranque). Não confundir "uso reservado/strapping" com "não multiplexado".
> No ESP32-C6, GPIOs com uso reservado mas ainda multiplexados: strapping
> GPIO4/5/8/9/15; flash SPI GPIO24–30; USB-Serial/JTAG GPIO12/13; UART0
> GPIO16/17.
>
> Na placa **ESP32-C6-DevKitC-1** (módulo ESP32-C6-WROOM-1): GPIO8 controla o
> LED RGB e GPIO9 é o botão BOOT — é por isso que o exemplo de 2024 os referia,
> mas continuam multiplexados. O botão RESET atua no pino dedicado **CHIP_PU**.
> Para projetos, GPIOs livres e seguros: GPIO0–3, 6, 7, 10, 11, 18–23.
<!--/ANS-->

**P1.4.** Distingue requisitos de tempo real *hard* (estrito) de *soft* (flexível).

<!--ANS-->
**Resposta:** Num requisito *hard*, falhar um deadline causa falha total do
sistema (ex.: airbag que responde tarde ao sensor de colisão). Num requisito
*soft*, falhar um deadline degrada a qualidade mas não inutiliza o sistema (ex.:
resposta lenta a teclas, que apenas torna o sistema "lento"). [Lab2, §2.1]
<!--/ANS-->

**P1.5.** Quais as vantagens de usar um RTOS (ex.: FreeRTOS) em vez de uma
abordagem *bare-metal*?

<!--ANS-->
**Resposta:** Abstração do tempo (API temporal), maior modularidade e
manutenibilidade, facilidade de teste de tarefas isoladas, reutilização de
código, eficiência por desenho orientado a eventos (sem polling desnecessário),
melhor gestão de energia (modos de baixo consumo no idle/no-tick) e tratamento de
interrupções curtas diferindo trabalho para tasks. [Lab2, §2.2]
<!--/ANS-->

**P1.6.** No ESP-IDF, qual é a principal diferença do FreeRTOS portado face ao
FreeRTOS "básico"?

<!--ANS-->
**Resposta:** O FreeRTOS do ESP-IDF acrescenta suporte a **SMP/multinúcleo**: em
chips com dois núcleos, a aplicação pode fixar uma task a um núcleo
(`xTaskCreatePinnedToCore`) ou deixar o FreeRTOS decidir.

> **Atenção (ESP32-C6):** o C6 é **single-core** para a aplicação — tem **1**
> núcleo RISC-V de alto desempenho (HP, até 160 MHz) mais um núcleo de baixo
> consumo (LP) separado, que não é um segundo núcleo SMP. Logo, no C6,
> `xTaskCreatePinnedToCore` **não traz vantagem** sobre `xTaskCreate` (só existe o
> core 0). O dual-core SMP aplica-se a chips como o ESP32 (Xtensa) ou o ESP32-S3.
> [Lab2, §2 e Q5]
<!--/ANS-->

\newpage

# Secção 2 — Aspetos transversais: representação, gamas e ponteiros

**P2.1.** Qual a gama de valores representáveis com 16 bits sem sinal? E com 16
bits de endereçamento, qual o intervalo de endereços?

<!--ANS-->
**Resposta:** Sem sinal, $0$ a $2^{16}-1 = 65535$. Com 16 bits de endereço, há
$2^{16}=65536$ posições endereçáveis, ou seja, endereços de `0x0000` a `0xFFFF`
($0$ a $65535$).
<!--/ANS-->

**P2.2.** Com $N$ bits, qual a gama em representação sem sinal e em complemento
para dois (com sinal)?

<!--ANS-->
**Resposta:** Sem sinal: $0$ a $2^{N}-1$. Com sinal (complemento para 2):
$-2^{N-1}$ a $2^{N-1}-1$. Ex.: 8 bits → sem sinal 0..255; com sinal −128..127.
<!--/ANS-->

**P2.3.** Converte `0x1E` para decimal e para binário.

<!--ANS-->
**Resposta:** `0x1E` = $1\times16 + 14 = 30$ em decimal = `0001 1110` em binário.
<!--/ANS-->

**P2.4.** Define período, frequência e duty-cycle de um sinal periódico e as suas
relações.

<!--ANS-->
**Resposta:** O **período** $T$ é a soma da duração de um ciclo completo (tempo
ativo + tempo inativo). A **frequência** $f = 1/T$ (Hz). O **duty-cycle** =
$t_{ativo}/T$ (fração, ou ×100%). Ex.: se ON = 2 ms e OFF = 8 ms, $T=10$ ms,
$f=100$ Hz, duty-cycle $=2/10=20\%$.
<!--/ANS-->

**P2.5.** Um PWM de 8 bits controla o brilho de um LED. Se a temperatura lida for
`0x1E`, qual o duty-cycle (em %) usando a regra "valor / valor_máximo"?

<!--ANS-->
**Resposta:** `0x1E` = 30. Com resolução de 8 bits o máximo é 255, logo
$30/255 \times 100\% \approx 11{,}76\%$.
<!--/ANS-->

**P2.6.** Explica, em C, a diferença entre `*` e `&` e o que significa o parâmetro
`uint8_t* pTemp`.

<!--ANS-->
**Resposta:** `&x` obtém o **endereço** da variável `x`; `*p` faz a
**desreferência** (acede ao valor apontado por `p`). `uint8_t* pTemp` é um
ponteiro para um inteiro de 8 bits sem sinal — usado para **passagem por
referência**, permitindo a função escrever o resultado em `*pTemp` (ex.:
`tc74_read_temp_after_temp(handle, &temp)` devolve a leitura via ponteiro).
<!--/ANS-->

**P2.7.** Considera `uint8_t buf[4]; uint8_t *p = buf;`. O que representam
`p+2` e `*(p+2)`?

<!--ANS-->
**Resposta:** `p+2` é o **endereço** do terceiro elemento (`&buf[2]`) — aritmética
de ponteiros escala pelo tamanho do tipo (1 byte para `uint8_t`). `*(p+2)` é o
**valor** desse elemento, equivalente a `buf[2]`.
<!--/ANS-->

**P2.8.** No FreeRTOS, para que servem os tipos `TickType_t` e `BaseType_t`?

<!--ANS-->
**Resposta:** `TickType_t` armazena a contagem de *ticks* (medida de tempo); pode
ser de 16, 32 ou 64 bits conforme `configTICK_TYPE_WIDTH_IN_BITS`. `BaseType_t` é
o tipo mais eficiente da arquitetura (8/16/32/64 bits), usado em retornos com
gama limitada e booleanos `pdTRUE`/`pdFALSE`. [Lab2, §3.1]
<!--/ANS-->

\newpage

# Secção 3 — Esquema elétrico (I2C vs SPI)

> Nota: no exame estes esquemas são **desenhados à mão**. Aqui são descritos por
> lista de ligações (pino-a-pino). Pratica a desenhá-los.

**P3.1.** Quais os sinais de um barramento I2C e de um barramento SPI? Como os
distingues num esquema?

<!--ANS-->
**Resposta:** **I2C**: 2 fios — **SDA** (dados) e **SCL** (relógio), partilhados
por vários dispositivos endereçados (resistências de pull-up na linha). **SPI**:
4 sinais — **SCLK** (relógio), **MOSI** (master→slave), **MISO** (slave→master) e
**CS/SS** (seleção de chip, um por periférico). No esquema: se vês apenas
SDA/SCL é I2C; se vês MOSI/MISO/SCLK/CS é SPI.
<!--/ANS-->

**P3.2.** Desenha (descreve) o esquema do sistema com **DHT20 + ESP32-C6 +
ventoinha**: o ESP lê a humidade por I2C e controla a ventoinha por PWM.

<!--ANS-->
**Resposta (lista de ligações):** (qualquer GPIO livre serve via GPIO matrix; aqui
usam-se GPIO2/3 para I2C e GPIO0 para PWM como exemplo)

- DHT20.SDA ↔ ESP32-C6.GPIO2 (I2C SDA)
- DHT20.SCL ↔ ESP32-C6.GPIO3 (I2C SCL)
- DHT20.VDD → +3V3 ; DHT20.GND → GND
- ESP32-C6.GPIO0 → entrada de controlo da ventoinha (sinal PWM)
- Ventoinha.VDD → +3V3 (ou alimentação dedicada) ; Ventoinha.GND → GND
- GND comum entre ESP, DHT20 e ventoinha; alimentação por USB no ESP.

```
   DHT20            ESP32-C6            VENTOINHA
  SDA --------I2C---- GPIO2
  SCL --------------- GPIO3
                      GPIO0 ---PWM----- IN
  VDD-+3V3            GND  3V3          VDD-+3V3
  GND                  |    |           GND
                      USB
```
(Notar resistências de pull-up em SDA/SCL — internas no DHT20.)
<!--/ANS-->

**P3.3.** Variante com **LED** em vez de ventoinha (como no exame 2024): que
componente adicionas em série com o LED e a que pino?

<!--ANS-->
**Resposta:** Uma **resistência de limitação de corrente** (~180 Ω) em série
entre o GPIO de PWM (ex.: GPIO0) e o ânodo do LED; o cátodo a GND. O brilho é
controlado pelo duty-cycle do PWM (LEDC). Ligações I2C do DHT20/TC74 mantêm-se
(SDA→GPIO2, SCL→GPIO3).
<!--/ANS-->

**P3.4.** Um display TFT liga-se tipicamente por SPI. Que sinais esperarias ver e
em que difere isso de ligar o DHT20?

<!--ANS-->
**Resposta:** TFT por SPI usa SCLK, MOSI (e por vezes MISO), CS, mais sinais
auxiliares como DC (data/command) e RST. Difere do DHT20 (I2C, só SDA/SCL com
endereço) por ser mais rápido, dedicar uma linha de seleção (CS) por periférico e
não usar endereçamento no barramento. [Lab6 SPI, Lab10 TFT]
<!--/ANS-->

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

<!--ANS-->
**Resposta:** Porque `Task1()` e `Task2()` são chamadas como **funções normais**,
não como tasks do FreeRTOS. `Task1()` entra no seu `while(true)` e nunca retorna,
pelo que `Task2()` nunca chega a ser chamada. É preciso criá-las com
`xTaskCreate`, deixando o escalonador alterná-las nos `vTaskDelay`.
<!--/ANS-->

**P4.2.** Corrige o código anterior para que ambas as leituras corram, usando
`xTaskCreate`.

<!--ANS-->
**Resposta:**

```c
void Task1(void* params) { while (true) {
    printf("reading temperature\n");
    vTaskDelay(1000 / portTICK_PERIOD_MS); } }

void Task2(void* params) { while (true) {
    printf("reading humidity\n");
    vTaskDelay(2000 / portTICK_PERIOD_MS); } }

void app_main(void) {
    xTaskCreate(Task1, "temp", 2048, NULL, 2, NULL);
    xTaskCreate(Task2, "humi", 2048, NULL, 2, NULL);
}
```
Durante o `vTaskDelay`, o escalonador coloca a task em *Blocked* e corre a outra.
<!--/ANS-->

**P4.3.** No padrão de notificações (Lab2), porque é que a task recetora *não*
precisa de `vTaskDelay`? E qual o tempo máximo que pode ficar bloqueada à espera?

```c
void Receiver(void* params) { while (true) {
    ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
    printf("received notification\n"); } }
```

<!--ANS-->
**Resposta:** `ulTaskNotifyTake` **bloqueia** a task até chegar uma notificação,
libertando o CPU sem fazer polling — logo não é preciso `vTaskDelay`. Com
`portMAX_DELAY` (e `INCLUDE_vTaskSuspend = 1`), o tempo máximo de bloqueio é
**indefinido** (espera para sempre até ser notificada). `pdTRUE` faz a contagem de
notificação ser zerada após a leitura.
<!--/ANS-->

**P4.4.** Para que serve um semáforo usado como *mutex* no acesso a um recurso
partilhado (ex.: `WriteToDevice`)?

<!--ANS-->
**Resposta:** Garante **exclusão mútua**: só uma task de cada vez acede ao recurso
(barramento, ficheiro, estrutura), evitando condições de corrida e mensagens
entrelaçadas. A task faz `xSemaphoreTake` antes de escrever e `xSemaphoreGive`
depois. [Lab2, §4.2.2]
<!--/ANS-->

**P4.5.** Na leitura de um botão por interrupção (Lab3), porque se usa uma *fila*
(`xQueueSendFromISR` / `xQueueReceive`) em vez de imprimir dentro da ISR?

<!--ANS-->
**Resposta:** Porque dentro de uma ISR não se deve fazer trabalho demorado nem
bloqueante (ex.: `printf`), sob pena de atrasar outras interrupções. A ISR apenas
coloca rapidamente um dado pequeno na fila (`xQueueSendFromISR`) e retorna; uma
task (`xQueueReceive` com `portMAX_DELAY`) processa-o fora do contexto de
interrupção. Mantém a ISR curta e a transferência segura.
<!--/ANS-->

**P4.6.** No exemplo de ADC one-shot (Lab3), a conversão é
`voltage = (adcRawVal / 4095.0f) * (1.1f/0.25f);`. Explica `4095` e o fator
`1.1/0.25`, e porque o valor pode divergir do real.

<!--ANS-->
**Resposta:** `4095 = 2^{12}-1` é o valor máximo de uma conversão de **12 bits**
(resolução por omissão). O fator `1.1/0.25` aproxima a tensão de plena escala com
atenuação de 12 dB (~3.3 V). Diverge do real porque é uma conversão **sem
calibração** — o ADC do ESP32 tem não-linearidades e offset; usa-se a API de
calibração (`adc_cali_*`) para corrigir. [Lab3, §3.5]
<!--/ANS-->

\newpage

# Secção 5 — Escrita de funções em C (TC74 e DHT20)

## 5.1 TC74 (modelo do exame de 2024)

**P5.1.** Escreve `tc74_wakeup`, que tira o sensor de standby escrevendo `0x00` no
registo de configuração.

<!--ANS-->
**Resposta:**
```c
void tc74_wakeup(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[2] = {TC74_COMMAND_RWCR, 0x00};
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer,
                                        sizeof(buffer), -1));
}
```
<!--/ANS-->

**P5.2.** Escreve `tc74_is_temperature_ready`, que devolve `true` se o bit READY
do registo de configuração estiver ativo.

<!--ANS-->
**Resposta:**
```c
bool tc74_is_temperature_ready(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t command = TC74_COMMAND_RWCR;
    uint8_t cnfgReg;
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle,
                    &command, sizeof(command),
                    &cnfgReg, sizeof(cnfgReg), -1));
    return (cnfgReg & TC74_READY_MASK);
}
```
<!--/ANS-->

**P5.3.** Escreve `tc74_read_temp_after_cfg`, que envia o comando RTR e lê a
temperatura logo a seguir.

<!--ANS-->
**Resposta:**
```c
void tc74_read_temp_after_cfg(i2c_master_dev_handle_t sensorHandle,
                              uint8_t* pTemp)
{
    uint8_t command = TC74_COMMAND_RTR;
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle,
                    &command, sizeof(command),
                    pTemp, sizeof(*pTemp), -1));
}
```
<!--/ANS-->

**P5.4.** Escreve `tc74_read_temp_after_temp`, que lê a temperatura sem reenviar o
comando (o ponteiro de registo já aponta para RTR).

<!--ANS-->
**Resposta:**
```c
void tc74_read_temp_after_temp(i2c_master_dev_handle_t sensorHandle,
                               uint8_t* pTemp)
{
    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, pTemp,
                                       sizeof(*pTemp), -1));
}
```
<!--/ANS-->

**P5.5.** Escreve `tc74_standby`, que coloca o sensor em standby (escreve a máscara
de standby no registo de configuração).

<!--ANS-->
**Resposta:**
```c
void tc74_standby(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[2] = {TC74_COMMAND_RWCR, TC74_STANDBY_MASK};
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer,
                                        sizeof(buffer), -1));
}
```
<!--/ANS-->

**P5.6.** Escreve `tc74_wakeup_and_read_temp`, que acorda o sensor, espera que a
leitura esteja pronta e lê a temperatura.

<!--ANS-->
**Resposta:**
```c
void tc74_wakeup_and_read_temp(i2c_master_dev_handle_t sensorHandle,
                               uint8_t* pTemp)
{
    tc74_wakeup(sensorHandle);
    while (!tc74_is_temperature_ready(sensorHandle));
    tc74_read_temp_after_cfg(sensorHandle, pTemp);
}
```
<!--/ANS-->

## 5.2 DHT20 (sensor de humidade/temperatura deste ano)

> Dados do datasheet: endereço I2C `0x38`; após power-on esperar >100 ms; ler
> status (`0x71`) e verificar `status & 0x18 == 0x18` (calibrado); disparar
> medição com `0xAC, 0x33, 0x00`; esperar ~80 ms; ler 7 bytes (status + 6 dados +
> CRC); bit[7] do status = busy. Conversões: $RH\% = \frac{S_{RH}}{2^{20}}\times100$,
> $T = \frac{S_T}{2^{20}}\times200 - 50$.

**P5.7.** Escreve `dht20_trigger_measurement`, que dispara uma medição enviando
`0xAC 0x33 0x00`.

<!--ANS-->
**Resposta:**
```c
void dht20_trigger_measurement(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t cmd[3] = {0xAC, 0x33, 0x00};
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, cmd,
                                        sizeof(cmd), -1));
}
```
<!--/ANS-->

**P5.8.** Escreve `dht20_is_busy`, que lê o byte de status e devolve `true` se o
bit de "busy" (bit 7) estiver a 1.

<!--ANS-->
**Resposta:**
```c
bool dht20_is_busy(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t status;
    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, &status,
                                       sizeof(status), -1));
    return (status & 0x80);   // bit[7] = 1 -> ocupado a medir
}
```
<!--/ANS-->

**P5.9.** Escreve `dht20_read`, que dispara a medição, espera ~80 ms, lê 7 bytes e
devolve humidade relativa e temperatura (floats) por ponteiro.

<!--ANS-->
**Resposta:**
```c
void dht20_read(i2c_master_dev_handle_t sensorHandle,
                float* pRH, float* pTemp)
{
    uint8_t data[7];

    dht20_trigger_measurement(sensorHandle);
    vTaskDelay(pdMS_TO_TICKS(80));            // espera a medição
    while (dht20_is_busy(sensorHandle));      // confirma fim (bit7=0)

    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, data,
                                       sizeof(data), -1));

    // S_RH: 20 bits = data[1] | data[2] | nibble alto de data[3]
    uint32_t sRH = ((uint32_t)data[1] << 12) |
                   ((uint32_t)data[2] << 4)  |
                   (data[3] >> 4);
    // S_T: 20 bits = nibble baixo de data[3] | data[4] | data[5]
    uint32_t sT  = ((uint32_t)(data[3] & 0x0F) << 16) |
                   ((uint32_t)data[4] << 8) |
                   data[5];

    *pRH   = (sRH / 1048576.0f) * 100.0f;        // 2^20 = 1048576
    *pTemp = (sT  / 1048576.0f) * 200.0f - 50.0f;
}
```
<!--/ANS-->

**P5.10.** Escreve `set_led_duty_cycle`, que mapeia uma temperatura no intervalo
[tempMin, tempMax] para o duty-cycle do LED (PWM via LEDC).

<!--ANS-->
**Resposta:**
```c
void set_led_duty_cycle(uint8_t tempMin, uint8_t tempMax,
                        uint8_t currentTemp, uint16_t dutyCycleRes)
{
    uint16_t dutyCycle = (((1 << dutyCycleRes) - 1) *
                          (currentTemp - tempMin)) /
                         (tempMax - tempMin);
    ESP_ERROR_CHECK(ledc_set_duty(LEDC_MODE, LEDC_CHANNEL, dutyCycle));
    ESP_ERROR_CHECK(ledc_update_duty(LEDC_MODE, LEDC_CHANNEL));
}
```
<!--/ANS-->

**P5.11.** Descreve, por palavras, o que faz uma `app_main` típica que lê o sensor
e ajusta o atuador (LED/ventoinha) em função da leitura.

<!--ANS-->
**Resposta:** Cria os *handles* do barramento I2C (busHandle) e do sensor
(sensorHandle); inicializa o PWM (`led_init`); configura a comunicação com o
sensor (endereço, pinos SDA/SCL, frequência I2C); ativa o sensor e faz a primeira
leitura. Em ciclo, enquanto a temperatura/humidade estiver dentro dos limites
(`TEMP_MIN`..`TEMP_MAX`), imprime o valor e define o duty-cycle do atuador com
`set_led_duty_cycle`; espera (`vTaskDelay(100 ms)`) e volta a ler. Se sair dos
limites, imprime erro e liberta o barramento I2C (`..._free`).
<!--/ANS-->

\newpage

# Secção 6 — Arquitetura de um sistema (problema aberto)

**P6.1.** Pretende-se um sistema que **mede a humidade** do ar; se ultrapassar um
limiar, **liga uma ventoinha**; regista as leituras num **cartão SD** e publica-as
por **MQTT**. Propõe a arquitetura: blocos, periféricos, barramentos e tasks.

<!--ANS-->
**Resposta (proposta):**

- **Sensor DHT20** ligado por **I2C** (SDA/SCL) ao ESP32.
- **Ventoinha** acionada por GPIO/PWM (LEDC) — opcionalmente via transístor/MOSFET
  se a corrente exceder a do GPIO.
- **Cartão SD** por **SPI** (MOSI/MISO/SCLK/CS) — barramento distinto do I2C.
- **Wi-Fi + cliente MQTT** para publicar leituras num *broker* (tópico, ex.,
  `casa/humidade`). [Lab9 MQTT]
- **Tasks FreeRTOS**:
  - `sensorTask`: lê o DHT20 a cada N s e coloca o valor numa fila/variável
    protegida por mutex.
  - `controlTask`: compara com o limiar e atua a ventoinha (PWM).
  - `loggerTask`: escreve no SD (acesso ao SPI protegido por mutex).
  - `mqttTask`: publica as leituras no broker.
- GND e alimentação (3V3) comuns; pull-ups no I2C.
<!--/ANS-->

**P6.2.** Nesse sistema, justifica a escolha de barramentos: porquê I2C para o
sensor e SPI para o cartão SD?

<!--ANS-->
**Resposta:** I2C basta para o sensor: poucos dados, baixa taxa, só 2 fios e
endereçamento (vários sensores no mesmo barramento). O cartão SD precisa de
**throughput** elevado (blocos de dados), pelo que SPI — mais rápido e com linha
dedicada CS — é mais adequado. Separar barramentos evita contenção e simplifica o
*timing*.
<!--/ANS-->

**P6.3.** Como garantirias que a leitura do sensor e a escrita no SD não se
interferem quando partilham dados?

<!--ANS-->
**Resposta:** Usando **mutex/semáforos** para proteger os recursos partilhados (a
estrutura de dados das leituras e cada barramento), e/ou **filas** para passar as
leituras da `sensorTask` para a `loggerTask`/`mqttTask` sem acesso concorrente
direto. Assim garante-se exclusão mútua e evita-se corrupção de dados. [Lab2]
<!--/ANS-->

\newpage

# Secção 7 — Conhecimento geral / escolha múltipla

> No exame, assinala apenas **uma** opção. (Solução a **negrito**.)

**P7.1.** Quantos valores distintos representa um registo de 16 bits sem sinal?

a) 16  b) 256  c) 32768  d) 65536

<!--ANS-->
**Resposta: d)** $2^{16}=65536$ (de 0 a 65535).
<!--/ANS-->

**P7.2.** Qual destes barramentos usa as linhas SDA e SCL?

a) SPI  b) I2C  c) UART  d) CAN

<!--ANS-->
**Resposta: b)** I2C.
<!--/ANS-->

**P7.3.** No FreeRTOS, `vTaskDelay` coloca a task em que estado?

a) Running  b) Ready  c) Blocked  d) Suspended

<!--ANS-->
**Resposta: c)** Blocked (durante o atraso, libertando o CPU).
<!--/ANS-->

**P7.4.** Um PWM com período 10 ms e tempo ativo 2,5 ms tem que duty-cycle e
frequência?

a) 25% e 100 Hz  b) 75% e 100 Hz  c) 25% e 10 Hz  d) 40% e 100 Hz

<!--ANS-->
**Resposta: a)** duty = 2,5/10 = 25%; $f = 1/10\text{ms} = 100$ Hz.
<!--/ANS-->

**P7.5.** Um ADC de 12 bits produz no máximo que valor?

a) 1023  b) 2047  c) 4095  d) 65535

<!--ANS-->
**Resposta: c)** $2^{12}-1 = 4095$.
<!--/ANS-->

**P7.6.** Qual o endereço I2C do DHT20?

a) 0x38  b) 0x48  c) 0x68  d) 0x76

<!--ANS-->
**Resposta: a)** 0x38.
<!--/ANS-->

**P7.7.** No DHT20, que comando dispara uma medição?

a) 0x71  b) 0xAC 0x33 0x00  c) 0xE1  d) 0xBA

<!--ANS-->
**Resposta: b)** `0xAC` seguido dos parâmetros `0x33` e `0x00`.
<!--/ANS-->

**P7.8.** Para que uma função em C devolva um valor "para fora" através de um
parâmetro, esse parâmetro deve ser:

a) passado por valor  b) um `int` normal  c) um ponteiro  d) `const`

<!--ANS-->
**Resposta: c)** um ponteiro (passagem por referência), ex.: `uint8_t* pTemp`.
<!--/ANS-->
