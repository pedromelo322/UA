# Evaluating real-time and Time-Sensitive Networking performance of containerized applications in Linux systems

## Problema

O artigo avalia até que ponto um servidor Linux genérico, com software de prateleira, consegue suportar aplicações industriais determinísticas em contentores, como os PLCs virtuais (vPLCs). Os autores medem, com grande granularidade, o impacto dos mecanismos nativos de tempo real e de TSN (Time-Sensitive Networking) na latência e no jitter. Segundo eles, falta na literatura uma avaliação conjunta de todos estes mecanismos, e é essa lacuna que o trabalho pretende preencher.

## Principais resultados

### Caminho de receção (sensor → vPLC)

Em **repouso**: a latência é baixa (cerca de 5 µs até ao kernel), mas o stack do kernel gera picos de até ~100 µs. O tamanho da trama tem efeito linear, de cerca de 1 µs por cada 100 bytes.
Com **stress-ng**: os piores casos na leitura em userspace chegam a ~4 ms.
**Escalonamento de tempo real** (SCHED_FIFO) e **CPU isolada**:

- Reduzem bastante as médias.
- Com **stress-ng**, continuam a aparecer picos de centenas de µs.
- Com carga **iperf3**, protegem bem: o pior caso fica abaixo de 150 µs.

**Prioridade**: não houve diferença entre FIFO 40 e 80, nem entre nice 0 e −20.
**Origem dos picos**: vinham sobretudo dos stressors fork e schedmix, pouco representativos de um edge cloud real. Sem eles, o pior caso fica abaixo de 200 µs.
**Mecanismos sem benefício relevante**: afinidade das IRQs da NIC, ksoftirqd em tempo real, netdev_budget_usecs e GRO.

### Caminho de transmissão (vPLC → atuador)

Em **repouso**: há jitter significativo, sobretudo na latência de wake-up.
**Efeito de cada mecanismo**:

- O tempo real reduz os piores casos de wake-up de ~100 para ~20 µs.
- O isolamento de CPU melhora sobretudo a latência no stack de rede.

Com **stress-ng**: a combinação de tempo real e CPU isolada é muito robusta. O caminho completo nunca passa de 100 µs, mais de uma ordem de grandeza melhor do que sem proteção.
Com **iperf3**: mesmo 1% de ocupação da largura de banda afeta o tráfego de controlo, e o TCP é pior do que o UDP. Tempo real e CPU isolada não chegam para proteger contra este tráfego.
**TAPRIO** (802.1Qbv em software):

- Por si só acrescenta pouco atraso, com piores casos de ~30 µs. O número de entradas da GCL (5 ou 25) não tem impacto.
- Com uma GCL ativa, os resultados melhoram drasticamente face à carga iperf3.
- O tráfego best-effort precisa de pelo menos ~300 µs por ciclo. Com menos, os testes TCP falham e a interface chega a ir abaixo.

**Efeito de guard band**: um stream de tempo real precedido por outro de tempo real (stream #2, pior caso < 50 µs) comporta-se muito melhor do que um precedido por tráfego best-effort (stream #1, até ~200 µs). A explicação é que os pacotes best-effort continuam a atravessar o kernel depois de a gate do TAPRIO fechar.

### Caminho de receção

Em repouso:

- Da NIC ao kernel (rx_sw − rx_hw): cerca de 5 µs em média, com picos até ~30 µs.
- Do kernel ao userspace (rx_read − rx_sw): cerca de 9 µs em média, com picos até ~100 µs.
- Tamanho da trama: aumenta a latência de forma linear, cerca de 1 µs por cada 100 bytes no kernel, em userspace o efeito é menor mas também linear.

Sob carga, sem proteção:

- Com stress-ng: kernel quase não muda, em userspace os piores casos chegam a ~4 ms.
- Com iperf3: a degrdação cresce com a largura de banda ocupada, com piores casos acima de 1ms.

Prioridades e partilha de CPU:

- SCHED_OTHER com nice 0 e -20: sem diferença relevante.
- SCHED_FIFO com prioridade 40 e 80: sem diferença relevante.
- Pôr os 5 receptores na mesma CPU isolada também não prejudicou nada, porque os streams não se sobrepõem no tempo.

Tempo Real e CPU isolada:

Compararam 4 configurações: BE, RT, CPU(isolada) e RT+CPU(iso)

RT mostrou ser sufeciente em repouso, com isolação do CPU acresentado uma ligeira melhoria, ou nenhuma.
Com stress-ng, nenhuma solução é sufeciente mas RT foi a melhor.
Com iperf3, só foi testado o RT+CPU(iso), em que obteve os mesmos resultados independente da largura de banda ocupada (10% ou 100%).

### Afinidade das IRQs da NIC

Fizeramm 3 testes em que fixaram as interrupções da NIC numa CPU isolada, na mesma CPU com a aplicação, ou não fixaram. Não houve diferença relevante.

### Diagnóstico da carga stress-ng

Testes feitos a cada stressor individualmente, os picos vem do fork e do schedmix.

## Caminho de transmissão

### Base em repouso

- Há jitter significativo, mesmo sem carga. O pior caso de wake-up é de ~100 µs.

### Com carga, sem proteção

- stress-ng: o pior caso de wake-up chega a ~2ms e o tx_sw quase a 1ms.
- iperf3: mesmo 1% de ocupação de larguta de banda afeta o tx_sw e tx_hw.

### Tempo real e CPU isolada

- Em repouso: O RT resolve o wake-up, o isolamento resolve o tx_sw.
- Com stress-ng: a combinação RT+CPU(iso) é muito robusta.
- Com iperf3: mesmo RT+CPU(iso) não é suficiente para proteger o tráfego de controlo.

### TAPRIO

O TAPRIO abre e fecha gates por classe de tráfego segundo uma tabela temporal (GCL), para reservar janelas exclusivas a cada stream.

- Custo do TAPRIO sozinho: quase nada, à picos mas limitados a ~30 µs.
- Com GCL ativa: melhora drasticamente os resultados com iperf3.
- Observação: Não se deve pôr o stream mais crítico logo a seguir à janela best-effort.

## Resumo

O paper faz um benchmark do desempenho de aplicações determinísticas em contentores Linux(genérico).
Foram feitos teste com stress-ng (simular sobrecarga do CPU) e iperf3 (simular tráfego de rede).
O caminho de receção (sensor → vPLC) é mais crítico que o de transmissão (vPLC → atuador).
Os autores consideram RT+CPU(iso) suficiente para proteger o caminho de receção, mas não o de transmissão. CPU(iso) não é bem realista porque isolar uma CPU para cada aplicação não é escalável.
Taprio é suficiente para proteger o caminho de transmissão, mas requer conhecimento da largura de banda ocupada pelo tráfego BE.
