# Sebenta de ASE — Conceitos e método para construir o código

> Objetivo desta sebenta: não decorares código, mas **saberes construí-lo do
> zero** para qualquer enunciado. Tudo está pensado para a placa
> **ESP32-C6-DevKitC-1** (módulo ESP32-C6-WROOM-1) e o framework **ESP-IDF**.
>
> Antes de mergulhar nas categorias, lê as **duas receitas** abaixo. 90% do
> código do exame sai delas.

---

## As 2 receitas que tens de interiorizar

### Receita A — "Molde de periférico ESP-IDF"

Quase **todos** os periféricos (GPIO, PWM/LEDC, ADC, I2C, SPI) configuram-se com
o mesmo padrão de 3 passos:

1. **Incluir** o header do driver (`#include "driver/xxx.h"`).
2. **Preencher uma struct de configuração** `xxx_config_t cfg = { .campo = valor, … }`
   (designated initializers — escreves só os campos que te interessam).
3. **Aplicar** com `xxx_config(&cfg)` (ou `xxx_new_*(&cfg, &handle)` nas APIs novas)
   e depois **usar** em ciclo (`xxx_set_…`, `xxx_get_…`, `xxx_read_…`).

```c
// esqueleto mental — vale para GPIO, LEDC, ADC, I2C, SPI...
incluir o header
xxx_config_t cfg = {
    .campo1 = …,   // cada campo responde a uma decisão tua
    .campo2 = …,
};
xxx_config(&cfg);          // valida e aplica
// ...usar no while(1)...
```

**Como descobrir os campos?** Não decoras: pensas no que queres e procuras o campo
correspondente na struct (autocompletar do VS Code / API Reference). A pergunta é
sempre a mesma: *"que decisões é que este periférico precisa que eu tome?"* —
e cada decisão é um campo.

### Receita B — "Árvore de decisão de uma função de driver I2C"

Quando te pedem para escrever uma função que fala com um sensor I2C, a única
pergunta é: **o que é que esta operação faz no barramento?**

| O que queres fazer | Chamada a usar |
|---|---|
| **Escrever** um comando/registo (sem ler resposta) | `i2c_master_transmit(h, buf, n, -1)` |
| **Escrever** um comando **e logo a seguir ler** a resposta (1 transação) | `i2c_master_transmit_receive(h, &cmd, 1, dst, m, -1)` |
| **Só ler** (o ponteiro de registo já está posicionado, ou leitura contínua) | `i2c_master_receive(h, dst, m, -1)` |

(`h` = handle do dispositivo; `buf`/`dst` = arrays de `uint8_t`; o `-1` é
*timeout infinito*.) Repara que estas três chamadas mapeiam diretamente as três
situações físicas possíveis: escrevo, escrevo-e-leio, leio. **Não há mais nada.**
Dominar isto resolve TC74, DHT20 e qualquer sensor I2C que te apareça.

---

## 1. Fundamentos de sistemas embebidos e a placa

### Conceitos
- **Sistema embebido**: computador especializado e **dedicado** a uma função, com
  restrições de tempo real / energia / recursos, muitas vezes **sem** SO nem
  interface humana direta. Oposto de um PC (generalista, com SO e I/O interativo).
- **Microcontrolador (MCU)**: num só chip junta CPU + memória (RAM/Flash) +
  periféricos (GPIO, I2C, SPI, ADC, timers…). É o "cérebro" do sistema embebido.
- **ESP32-C6**: MCU RISC-V **single-core** de alto desempenho (HP, até 160 MHz) +
  um núcleo de baixo consumo (LP) separado; Wi-Fi 6, Bluetooth 5, IEEE 802.15.4
  (Zigbee/Thread). ⚠️ É **single-core** para a aplicação — grava bem isto.
- **Kit DevKitC-1**: módulo ESP32-C6-WROOM-1 (8 MB flash), LDO 5V→3V3, ponte
  USB↔UART e USB nativo (Serial/JTAG), botões BOOT/RESET, LED RGB em GPIO8.
  Componentes do kit nas aulas: **TC74** (temperatura, I2C), **DHT20** (temp+
  humidade, I2C), **display TFT 0.96" + leitor SD** (SPI).

### Pinos: o que tens mesmo de saber
- **Multiplexado** = pode ter várias funções (GPIO, I2C, SPI, PWM…) escolhidas por
  software, através do **IO MUX / GPIO matrix**. No C6, **todos os GPIO0–GPIO30
  são multiplexados**.
- **Não multiplexados** = pinos **dedicados**, fora da matriz, com função fixa:
  **CHIP_PU** (enable/reset), **alimentação** (VDDA3P3, VDDPST1/2, VDDA1/2,
  VDD_SPI), **GND**, **cristal** XTAL_P/XTAL_N, **ANT** (antena/RF). → Se te
  pedirem "2 pinos não multiplexados", responde **CHIP_PU** e **GND**.
- **GPIOs com uso reservado (mas ainda multiplexados!):**

| Categoria | Pinos (C6) |
|---|---|
| Strapping (lidos no arranque) | GPIO4, 5, 8, 9, 15 |
| LED RGB da placa | GPIO8 |
| Botão BOOT | GPIO9 |
| USB nativo (D−/D+) | GPIO12 / GPIO13 |
| UART0 (consola) | GPIO16 / GPIO17 |
| Flash SPI | GPIO24–30 (nem saem nos headers) |

- **GPIOs livres e seguros para os teus circuitos:** GPIO0–3, 6, 7, 10, 11, 18–23.

### Erro comum
Confundir *strapping* com *não multiplexado*. GPIO8/GPIO9 **são** multiplexados;
só têm um papel extra no arranque.

---

## 2. Aspetos transversais (representação, bits, sinais, ponteiros)

### 2.1 Representação numérica
- **Sem sinal**, com N bits: gama `0 … 2^N − 1`. (8 bits → 0..255; 16 bits →
  0..65535; 12 bits → 0..4095.)
- **Com sinal** (complemento para 2): gama `−2^(N−1) … 2^(N−1) − 1`. (8 bits →
  −128..127.)
- **Endereçamento** com N bits de endereço → `2^N` posições (16 bits → 64 Ki,
  endereços `0x0000`..`0xFFFF`).
- **Conversões**: hex→dec multiplicando por potências de 16. Ex.: `0x1E =
  1·16 + 14 = 30 = 0b0001_1110`. Treina hex↔bin (cada dígito hex = 4 bits).

### 2.2 Manipulação de bits (a base de qualquer driver)
Tens de saber montar e extrair campos — é o que fazes para ler sensores.

```c
// LER um bit / campo:
bool busy   = (status & 0x80);          // testar o bit 7 (máscara)
uint8_t nib = (data[3] >> 4);           // nibble alto (deslocar p/ a direita)
uint8_t low = (data[3] & 0x0F);         // nibble baixo (mascarar)

// MONTAR um valor a partir de vários bytes (ex.: 20 bits do DHT20):
uint32_t v = ((uint32_t)data[1] << 12)  // byte mais significativo sobe 12 bits
           | ((uint32_t)data[2] << 4)
           | (data[3] >> 4);
```

Regras práticas:
- `&` com uma **máscara** isola bits; `|` **junta**; `<<`/`>>` **alinham**.
- Faz **cast para `uint32_t` antes do shift** se o resultado passa de 8/16 bits
  (senão o deslocamento "cai fora" do `uint8_t`).

### 2.3 Período, frequência, duty-cycle (PWM)
- **Período** `T` = duração de um ciclo (tempo ativo + inativo).
- **Frequência** `f = 1/T`.
- **Duty-cycle** = `t_ativo / T` (×100%).
- Dado um valor de 0..max para controlar brilho: `duty% = valor / max × 100`.
  Ex.: leitura `0x1E`=30, resolução 8 bits (max 255) → 30/255 ≈ **11,76%**.

### 2.4 Ponteiros em C (decisivo para "escrever funções")
- `&x` = **endereço** de `x`. `*p` = **valor** apontado por `p` (desreferência).
- **Quando usas ponteiro?** Sempre que uma função tem de **devolver algo "para
  fora"** (C só devolve um valor pelo `return`). Passas o endereço e a função
  escreve lá dentro: **passagem por referência**.

```c
// em vez de "return", a função escreve no que pTemp aponta:
void ler(uint8_t* pTemp) { *pTemp = 25; }
uint8_t t;
ler(&t);          // passas o ENDEREÇO; t fica 25
```

- **Arrays/buffers**: o nome do array já é um ponteiro para o 1.º elemento.
  `uint8_t buf[7];` e passas `buf` (= `&buf[0]`). `*(buf+2)` é o mesmo que `buf[2]`.
- Padrão que vais ver imenso: `uint8_t* pTemp`, `float* pRH` — saídas por ponteiro.

---

## 3. O molde ESP-IDF na prática (estrutura de um programa)

Um programa ESP-IDF começa em `app_main(void)`. O padrão típico:

```c
void app_main(void)
{
    // 1) configurar periféricos (Receita A), uma vez
    // 2) (opcional) criar tasks FreeRTOS
    // 3) ciclo infinito que faz o trabalho, com vTaskDelay para não saturar a CPU
    while (1) {
        // ler / decidir / atuar
        vTaskDelay(pdMS_TO_TICKS(1000));   // espera 1 s (e cede a CPU)
    }
}
```

Notas que poupam erros:
- `pdMS_TO_TICKS(ms)` converte ms→ticks; usa-o sempre nos delays.
- `ESP_ERROR_CHECK(expr)` aborta com mensagem se a função devolver erro — embrulha
  as chamadas de configuração nisto.
- Comandos do projeto (Lab1): `idf.py set-target esp32c6`, `idf.py build`,
  `idf.py -p <porta> flash monitor`, `idf.py menuconfig`.

---

## 4. GPIO / I/O digital

### 4.1 Saída digital (acender/piscar)
**Pensa:** quero um pino de saída → `gpio_config_t` com `mode = OUTPUT`.

```c
gpio_config_t io = {
    .pin_bit_mask = 1ULL << LED_GPIO,   // QUAIS pinos (bitmask; 1ULL p/ caber)
    .mode         = GPIO_MODE_OUTPUT,   // direção
    .pull_up_en   = GPIO_PULLUP_DISABLE,
    .pull_down_en = GPIO_PULLDOWN_DISABLE,
    .intr_type    = GPIO_INTR_DISABLE,  // saída não gera interrupção
};
gpio_config(&io);
gpio_set_level(LED_GPIO, 1);            // 1 = ligado, 0 = desligado
```

### 4.2 Entrada digital por *polling* (perguntar repetidamente)
**Pensa:** entrada com resistência de *pull-up* interna (botão a GND) → leio o
nível num ciclo.

```c
gpio_config_t io = {
    .pin_bit_mask = 1ULL << BTN_GPIO,
    .mode         = GPIO_MODE_INPUT,
    .pull_up_en   = GPIO_PULLUP_ENABLE,     // sem carregar = 1; carregado = 0
    .pull_down_en = GPIO_PULLDOWN_DISABLE,
    .intr_type    = GPIO_INTR_DISABLE,
};
gpio_config(&io);
while (1) {
    int nivel = gpio_get_level(BTN_GPIO);   // lê o estado
    printf("GPIO %d read %d\n", BTN_GPIO, nivel);
    vTaskDelay(pdMS_TO_TICKS(100));
}
```
*Lógica invertida:* com pull-up, repouso=1 e premido=0. Sabe explicar porquê
(o botão liga o pino a GND quando carregas).

### 4.3 Entrada por **interrupção** + fila (a forma "profissional")
**Porquê não usar polling?** Desperdiça CPU. A interrupção só atua quando o evento
acontece. **Porquê uma fila?** Porque **dentro da ISR não se faz trabalho pesado**
(nem `printf`): a ISR só "atira" um dado para a fila e sai; uma task trata o resto.

```c
static QueueHandle_t fila;

static void IRAM_ATTR isr(void* arg) {       // ISR: curta, em IRAM
    uint32_t gpio = (uint32_t) arg;
    xQueueSendFromISR(fila, &gpio, NULL);    // versão *FromISR (obrigatória na ISR)
}

void app_main(void) {
    gpio_config_t io = {
        .pin_bit_mask = 1ULL << BTN_GPIO,
        .mode         = GPIO_MODE_INPUT,
        .pull_up_en   = GPIO_PULLUP_ENABLE,
        .intr_type    = GPIO_INTR_NEGEDGE,   // interrompe na transição 1→0
    };
    gpio_config(&io);

    fila = xQueueCreate(10, sizeof(uint32_t));
    xTaskCreate(tarefa, "btn", 2048, NULL, 10, NULL);

    gpio_install_isr_service(0);
    gpio_isr_handler_add(BTN_GPIO, isr, (void*) BTN_GPIO);
}

static void tarefa(void* arg) {              // corre FORA da ISR
    uint32_t gpio;
    for (;;)
        if (xQueueReceive(fila, &gpio, portMAX_DELAY))
            printf("Interrupt on GPIO %lu\n", gpio);
}
```
Pontos a saber explicar: `IRAM_ATTR` (ISR na RAM, mais rápida e sempre acessível),
sufixo `FromISR`, `portMAX_DELAY` (a task bloqueia até chegar algo).

---

## 5. PWM com LEDC (controlar brilho/velocidade)

**Pensa em 2 blocos:** um **timer** (define frequência e resolução) e um **canal**
(liga o timer a um GPIO). Depois mexes no *duty*.

```c
// 1) TIMER: que frequência e que resolução de duty?
ledc_timer_config_t timer = {
    .speed_mode      = LEDC_LOW_SPEED_MODE,
    .timer_num       = LEDC_TIMER_0,
    .duty_resolution = LEDC_TIMER_13_BIT,   // duty vai de 0 a 2^13-1 = 8191
    .freq_hz         = 5000,                 // 5 kHz
    .clk_cfg         = LEDC_AUTO_CLK,
};
ledc_timer_config(&timer);

// 2) CANAL: que GPIO, que timer, duty inicial?
ledc_channel_config_t ch = {
    .gpio_num   = LED_GPIO,
    .speed_mode = LEDC_LOW_SPEED_MODE,
    .channel    = LEDC_CHANNEL_0,
    .timer_sel  = LEDC_TIMER_0,
    .duty       = 0,
    .hpoint     = 0,
};
ledc_channel_config(&ch);

// 3) mudar o brilho (sempre os dois: set + update)
ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, duty);
ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
```

**Mapear uma grandeza para duty** (ex.: temperatura → brilho):
```c
uint32_t maxDuty = (1 << res) - 1;                 // valor cheio
uint32_t duty = maxDuty * (valor - vmin) / (vmax - vmin);   // regra de três
```
*Breathing*: varrer o duty de 0→max→0 num ciclo com pequenos `vTaskDelay`.

---

## 6. ADC (ler tensões analógicas)

**Pensa:** modo *one-shot* (leio quando preciso). Configuras a **unidade** e o
**canal** (atenuação define a gama de tensão).

```c
adc_oneshot_unit_handle_t adc;
adc_oneshot_unit_init_cfg_t initCfg = { .unit_id = ADC_UNIT_1 };
adc_oneshot_new_unit(&initCfg, &adc);

adc_oneshot_chan_cfg_t chCfg = {
    .atten    = ADC_ATTEN_DB_12,            // ~0..3,3 V de gama
    .bitwidth = ADC_BITWIDTH_DEFAULT,       // 12 bits → 0..4095
};
adc_oneshot_config_channel(adc, ADC_CHANNEL_2, &chCfg);

int raw;
adc_oneshot_read(adc, ADC_CHANNEL_2, &raw); // <-- saída por ponteiro (&raw)
float v = (raw / 4095.0f) * (1.1f / 0.25f); // aproximação sem calibração
```
**Porque diverge do real?** Sem calibração, o ADC tem offset e não-linearidade;
para precisão usa-se a API `adc_cali_*`. `4095 = 2^12 − 1`.

---

## 7. I2C e escrita de drivers de sensores (o núcleo do exame)

### 7.1 Inicializar o barramento (mestre) e adicionar o sensor
**Pensa em 2 passos:** criar o **barramento** (pinos SDA/SCL) e **adicionar o
dispositivo** (endereço + frequência).

```c
i2c_master_bus_handle_t bus;
i2c_master_bus_config_t busCfg = {
    .i2c_port   = I2C_NUM_0,
    .sda_io_num = GPIO_NUM_6,        // SDA  (no kit das aulas)
    .scl_io_num = GPIO_NUM_7,        // SCL
    .clk_source = I2C_CLK_SRC_DEFAULT,
    .flags.enable_internal_pullup = true,
};
i2c_new_master_bus(&busCfg, &bus);

i2c_master_dev_handle_t sensor;
i2c_device_config_t devCfg = {
    .dev_addr_length = I2C_ADDR_BIT_LEN_7,
    .device_address  = 0x38,         // endereço I2C do sensor (DHT20=0x38)
    .scl_speed_hz    = 100000,       // 100 kHz
};
i2c_master_bus_add_device(bus, &devCfg, &sensor);
```

### 7.2 Como **derivar** uma função a partir do datasheet
Para cada operação, faz 3 perguntas e usa a **Receita B**:
1. Tenho de **enviar** um comando/registo? Quantos bytes?
2. O sensor **responde** com dados? Na mesma transação?
3. Estou só a **continuar a ler** (sem reenviar nada)?

### 7.3 TC74 (temperatura) — exemplos resolvidos
```c
// "acordar": ESCREVER no registo de config o valor 0x00 -> transmit
void tc74_wakeup(i2c_master_dev_handle_t h) {
    uint8_t buf[2] = { TC74_CMD_RWCR, 0x00 };
    ESP_ERROR_CHECK(i2c_master_transmit(h, buf, sizeof(buf), -1));
}

// "está pronto?": ESCREVER o registo a ler + LER 1 byte -> transmit_receive
bool tc74_ready(i2c_master_dev_handle_t h) {
    uint8_t cmd = TC74_CMD_RWCR, cfg;
    ESP_ERROR_CHECK(i2c_master_transmit_receive(h, &cmd, 1, &cfg, 1, -1));
    return (cfg & TC74_READY_MASK);          // testa o bit READY
}

// ler temperatura apontando para o registo RTR -> transmit_receive
void tc74_read_after_cfg(i2c_master_dev_handle_t h, uint8_t* pT) {
    uint8_t cmd = TC74_CMD_RTR;
    ESP_ERROR_CHECK(i2c_master_transmit_receive(h, &cmd, 1, pT, 1, -1));
}

// ler sem reenviar comando (ponteiro já em RTR) -> receive
void tc74_read_after_temp(i2c_master_dev_handle_t h, uint8_t* pT) {
    ESP_ERROR_CHECK(i2c_master_receive(h, pT, 1, -1));
}
```
Repara como **cada função escolheu a chamada pela natureza da operação** — é só
aplicar a tabela da Receita B.

### 7.4 DHT20 (humidade + temperatura) — construir do datasheet
Sequência do datasheet: endereço `0x38`; após ligar esperar >100 ms; (1ª vez)
ler status `0x71` e confirmar `status & 0x18 == 0x18`; **disparar** medição com
`0xAC, 0x33, 0x00`; esperar **~80 ms**; ler **7 bytes** (status + 6 dados + CRC);
bit 7 do status = *busy*. Conversões: `RH% = S_RH/2^20·100`, `T = S_T/2^20·200−50`.

```c
void dht20_trigger(i2c_master_dev_handle_t h) {          // ESCREVER comando
    uint8_t cmd[3] = { 0xAC, 0x33, 0x00 };
    ESP_ERROR_CHECK(i2c_master_transmit(h, cmd, 3, -1));
}

bool dht20_busy(i2c_master_dev_handle_t h) {             // SÓ LER o status
    uint8_t s;
    ESP_ERROR_CHECK(i2c_master_receive(h, &s, 1, -1));
    return (s & 0x80);
}

void dht20_read(i2c_master_dev_handle_t h, float* pRH, float* pT) {
    uint8_t d[7];
    dht20_trigger(h);
    vTaskDelay(pdMS_TO_TICKS(80));                        // espera a medição
    while (dht20_busy(h)) { }                             // confirma fim (bit7=0)
    ESP_ERROR_CHECK(i2c_master_receive(h, d, 7, -1));     // lê os 7 bytes

    // montar os 20 bits de cada grandeza (bit manipulation da secção 2.2)
    uint32_t sRH = ((uint32_t)d[1] << 12) | ((uint32_t)d[2] << 4) | (d[3] >> 4);
    uint32_t sT  = ((uint32_t)(d[3] & 0x0F) << 16) | ((uint32_t)d[4] << 8) | d[5];

    *pRH = (sRH / 1048576.0f) * 100.0f;                  // 2^20 = 1048576
    *pT  = (sT  / 1048576.0f) * 200.0f - 50.0f;
}
```
Se conseguires reconstruir isto só com o datasheet à frente, estás pronto para
**qualquer** sensor I2C.

---

## 8. SPI e cartão SD

### 8.1 SPI vs I2C
| | I2C | SPI |
|---|---|---|
| Fios | 2: SDA, SCL | 4: SCLK, MOSI, MISO, CS |
| Seleção do dispositivo | endereço no barramento | linha **CS** dedicada por periférico |
| Velocidade | menor | maior |
| Bom para | sensores (poucos dados) | cartão SD, display (muitos dados) |

Num esquema: se só vês **SDA/SCL** → I2C; se vês **MOSI/MISO/SCLK/CS** → SPI.

### 8.2 Construir: SD por SPI + ficheiros (logger)
A ideia: configurar o **barramento SPI**, montar o SD com FATFS, e depois é
**I/O de ficheiros normal de C**.

```c
spi_bus_config_t spi = {
    .mosi_io_num = GPIO_NUM_20, .miso_io_num = GPIO_NUM_19,
    .sclk_io_num = GPIO_NUM_18, .quadwp_io_num = -1, .quadhd_io_num = -1,
};
spi_bus_initialize(SPI2_HOST, &spi, SDSPI_DEFAULT_DMA);
// ...montar o cartão com esp_vfs_fat_sdspi_mount(...) -> aparece em "/sdcard"

FILE* f = fopen("/sdcard/log.txt", "a");        // abrir para acrescentar
fprintf(f, "%lu,%d,%.2f,%.2f\n", millis, n, temp, hum);  // escrever CSV
fclose(f);                                       // FECHAR (senão perdes dados)
```
Para **ler** linha a linha: `fgets(linha, sizeof(linha), f)` num ciclo até `NULL`.
No exame, a parte que importa é o raciocínio (montar → `fopen`/`fprintf`/`fgets`/
`fclose`), não decorar os argumentos do *mount*.

---

## 9. FreeRTOS (multitarefa)

### 9.1 Tasks
Uma task é uma função `void f(void* params)` com um `while(1)`. **Não a chamas
diretamente** — crias com `xTaskCreate`, e o escalonador alterna entre elas.

```c
void Task1(void* p) { while (1) { /*...*/ vTaskDelay(pdMS_TO_TICKS(1000)); } }

void app_main(void) {
    xTaskCreate(Task1, "t1", 2048, NULL, 2, NULL);
    //          função  nome  stack  arg  prio  &handle
}
```
**Erro clássico de "análise de código":** chamar `Task1(); Task2();` dentro de
`app_main`. Como `Task1` tem `while(1)` e nunca retorna, `Task2` nunca arranca. A
correção é criá-las com `xTaskCreate`.

### 9.2 Estados e `vTaskDelay`
Durante `vTaskDelay`, a task passa a **Blocked** e **liberta a CPU** para outras.
É por isso que duas tasks com delays parecem correr "ao mesmo tempo" num só núcleo.
⚠️ No **C6 (single-core)**, `xTaskCreatePinnedToCore` **não traz vantagem** sobre
`xTaskCreate` — só existe o core 0.

### 9.3 Comunicação/sincronização
- **Notificações**: `xTaskNotifyGive(h)` acorda a task que está em
  `ulTaskNotifyTake(pdTRUE, portMAX_DELAY)`. Não precisas de `vTaskDelay` no
  recetor — ele **bloqueia** até ser notificado (tempo máximo: indefinido com
  `portMAX_DELAY`). Mais leve que semáforos para "avisar".
- **Semáforo/mutex**: garante **exclusão mútua** ao aceder a um recurso partilhado
  (barramento, ficheiro, variável). `xSemaphoreTake` antes, `xSemaphoreGive`
  depois. Evita corromper dados / misturar saídas.
- **Fila** (`xQueueSend`/`xQueueReceive`): passar dados entre tasks (ou da ISR
  para uma task, com `xQueueSendFromISR`) sem acesso concorrente direto.

---

## 10. MQTT (conectividade IoT)

### Conceitos
- Modelo **publisher/subscriber** com um **broker** central. Quem publica num
  **tópico** (ex.: `casa/sala/temperatura`) não conhece quem subscreve —
  **desacoplamento**.
- **QoS**: 0 "at most once" (rápido, pode perder), 1 "at least once" (garante, pode
  duplicar), 2 "exactly once" (garante e único, mais pesado).
- **Transporte**: `mqtt://` (TCP, porta 1883, sem cifra) vs `mqtts://` (TLS, porta
  8883, com certificado CA). Em produção usa-se TLS.

### Construir: cliente esp-mqtt (padrão config + event handler)
```c
esp_mqtt_client_config_t cfg = { .broker.address.uri = "mqtt://test.mosquitto.org:1883" };
esp_mqtt_client_handle_t cli = esp_mqtt_client_init(&cfg);
esp_mqtt_client_register_event(cli, ESP_EVENT_ANY_ID, mqtt_handler, NULL);
esp_mqtt_client_start(cli);
// no handler tratas MQTT_EVENT_CONNECTED/_DATA/_DISCONNECTED;
// publicas com esp_mqtt_client_publish(cli, "topico", "msg", 0, /*qos*/1, 0);
```
A lógica é **dirigida por eventos**: ligas-te, e reages no *handler* (ligou,
chegou mensagem, caiu a ligação → reconecta). Precisa de Wi-Fi ligado primeiro.

---

## 11. TFT / HMI (display por SPI)

- Display Adafruit 0.96" com controlador **ST7735**, ligado por **SPI**; sinais
  típicos: SCLK, MOSI, **CS** (TFTCS), **DC** (data/command), **RST**, **LIT**
  (backlight por PWM). O **CS do leitor SD** liga-se a 3V3 para o desativar e usar
  o SPI só para o TFT (e vice-versa).
- Uma **biblioteca gráfica** (driver ST7735) dá-te: inicializar o ecrã, pintar
  cores, desenhar formas/linhas, escrever texto. Constróis **HMIs** (ecrã de
  estado, gráficos em tempo real, troca de ecrãs com botão) por cima disso.
- Para o exame, sabe: é SPI; precisa de DC e RST além dos sinais SPI; e o conceito
  de desativar periféricos não usados pondo o respetivo CS a nível inativo.

---

## 12. Esquema elétrico — como desenhar (sem decorar)

### Regras de ouro
1. **GND comum** a tudo (sensor, atuador, MCU). Sem massa comum, nada funciona.
2. **Alimentação** correta: a maioria dos módulos a **3V3**; o pino **5V** só se o
   componente o exigir.
3. **I2C**: 2 fios (SDA, SCL) + **resistências de pull-up** (~4k7) para 3V3 (no
   DHT20 já há internas; nos esquemas das aulas aparecem na mesma).
4. **LED**: **resistência em série** (~180 Ω) entre o GPIO e o ânodo; cátodo a GND.
5. **SPI**: SCLK/MOSI/MISO partilhados, **um CS por periférico**; desativa os não
   usados pondo o CS a 3V3.
6. Usa **GPIOs livres** (secção 1) — evita strapping/USB/LED.

### Ligações reais do kit (referência)
- **DHT20 (I2C):** SDA→GPIO6, SCL→GPIO7, VDD→3V3, GND→GND, pull-ups 4k7.
- **Leitor SD (SPI):** SCK→GPIO18, MISO→GPIO19, MOSI→GPIO20, SDCS→GPIO21
  (+ pull-ups 10k), TFTCS→3V3 (TFT desligado).
- **TFT (SPI):** SCK→GPIO21, MOSI→GPIO19, TFTCS→GPIO22, DC→GPIO2, RST→GPIO3,
  LIT→GPIO15 (valores do Lab10; o importante é a topologia, não os números exatos).

### Como abordar "desenha o esquema de X"
1. Lista os blocos (MCU + cada sensor/atuador).
2. Para cada um, escolhe o **barramento/pino** (sensor→I2C; SD/TFT→SPI; LED/
   ventoinha→GPIO/PWM).
3. Liga **alimentação e GND** a todos.
4. Acrescenta os **componentes passivos** (pull-ups I2C, resistência do LED).
5. Desenha as linhas e **rotula** cada sinal (SDA, SCL, MOSI, CS, GPIOx).

---

## 13. Pergunta de arquitetura — método para responder

Dado um enunciado ("medir humidade, ligar ventoinha acima de um limiar, gravar no
SD e enviar por MQTT"), segue esta receita:

1. **Blocos funcionais**: o que mede? o que atua? o que guarda? o que comunica?
2. **Periféricos e barramentos** por bloco:
   - sensor → **I2C** (DHT20/TC74);
   - cartão SD → **SPI**; display → **SPI**;
   - ventoinha/LED → **GPIO/PWM** (ventoinha real → **transístor/MOSFET**, não
     diretamente do GPIO);
   - envio remoto → **Wi-Fi + MQTT**.
3. **Tasks FreeRTOS** (uma responsabilidade cada): `sensorTask` (lê periodicamente),
   `controlTask` (compara com limiar e atua), `loggerTask` (escreve no SD),
   `commsTask` (publica por MQTT).
4. **Sincronização**: **filas** para passar leituras entre tasks; **mutex** para
   proteger recursos partilhados (barramento SPI, ficheiro, variável de estado).
5. **Alimentação/massa**: 3V3 e GND comuns; pull-ups no I2C.

Se responderes sempre por esta ordem — blocos → barramentos → tasks →
sincronização → alimentação — cobres tudo o que o professor procura.

---

## Checklist final (véspera do exame)
- [ ] Sei distinguir multiplexado / strapping / dedicado e dar 2 pinos não-mux.
- [ ] Gamas: `0..2^N−1` e complemento p/ 2; hex↔bin↔dec; duty-cycle.
- [ ] Sei a **Receita A** (config-struct → config → usar) de cor.
- [ ] Sei a **Receita B** (transmit / transmit_receive / receive) de cor.
- [ ] Reconstruo as funções do TC74 e do DHT20 só com o datasheet.
- [ ] Configuro GPIO (in/out/interrupção), LEDC e ADC sem cábula.
- [ ] Explico tasks, `vTaskDelay`/estados, notificações, mutex, filas, ISR+fila.
- [ ] Desenho um esquema I2C+SPI+LED com pull-ups, série e GND/3V3 comuns.
- [ ] Decomponho um problema em blocos → barramentos → tasks → sincronização.
