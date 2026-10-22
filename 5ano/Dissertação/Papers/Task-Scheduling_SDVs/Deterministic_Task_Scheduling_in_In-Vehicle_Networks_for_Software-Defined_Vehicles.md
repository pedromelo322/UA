# Deterministic Task Scheduling in In-Vehicle Networks for Software-Defined Vehicles

## Contexto e problema

A indústria automóvel está a migrar para veículos definidos por software (SDVs) e para arquiteturas E/E zonais com computação centralizada. Nestas arquiteturas, sensores e atuadores ligam-se a controladores zonais (ECUs) e a uma unidade central de alto desempenho (HPCU). Para tirar partido delas, é preciso distribuir bem a carga computacional, garantindo que as funções críticas cumprem prazos rígidos. O escalonamento estático tradicional, em que cada tarefa tem uma unidade fixa, não se adapta bem a este ambiente dinâmico.

## Proposta

Os autores propõem um escalonador determinístico. Em vez de minimizar a latência, procura maximizar o número de tarefas concluídas dentro do prazo. A função objetivo usa uma penalização com duas regras:

- se a tarefa excede o prazo, a penalização é 1;
- se cumpre o prazo, a penalização depende da fiabilidade do caminho usado (1 − produto das fiabilidades das ligações).

Assim, entre os caminhos que cumprem o prazo, o escalonador favorece os mais fiáveis. As restrições impõem quatro condições:

- cada tarefa vai para uma única unidade;
- os recursos OFDMA sem fios não são partilhados;
- a capacidade das ligações é respeitada;
- a capacidade de processamento das unidades é respeitada.

O problema é NP-difícil e é resolvido com um algoritmo genético.

## Cenário de avaliação

Quatro topologias: árvore, malha básica, malha cross-zone (inspirada no veículo Orion da NASA) e malha centralizada. Todas têm 4 zonas, 36 sensores/atuadores, ECUs de 1 GHz e HPCU de 4 GHz.
Tarefas de 5–15 Mciclos e 0,5–1,5 Mbits, com prazos entre 40 e 100 ms.
Implementações totalmente cablada (Ethernet a 1 Gbps) e híbrida com ligações sem fios OFDMA (100 MHz, SINR médio de 30 dB, fiabilidade entre 0,90 e 1).
Comparação com três alternativas: Baseline (alocação estática), Shortest (caminho mais curto) e Minimum (minimização do tempo de execução).

## Principais resultados

**Taxa de satisfação**: o esquema determinístico mantém mais de 95% das tarefas dentro do prazo com até 45 tarefas (50 na malha centralizada). As alternativas degradam-se a partir de cerca de 25–35 tarefas. Com carga elevada, os ganhos são de cerca de 27–31% face ao Baseline e ao Shortest, e de 6–9% face ao Minimum.
**Robustez ao sem fios**: ao introduzir ligações sem fios, a perda de desempenho do esquema determinístico fica abaixo de 1,5%, contra até 8,6% nos outros esquemas, porque tem em conta a fiabilidade das ligações. Na malha centralizada híbrida chega a superar a versão cross-zone cablada.
**Equilíbrio de carga**: o Baseline e o Shortest saturam as ECUs a partir de 40 tarefas, enquanto a HPCU fica abaixo de 25% de utilização. O esquema determinístico recorre mais à HPCU quando a carga sobe, o que evita estrangulamentos.
**Latência**: com carga baixa ou média, a latência é superior à do Minimum, porque o objetivo é cumprir prazos e não minimizar tempo. Com carga alta, a latência passa a ser menor. Na topologia centralizada híbrida reduz a latência até 16,3%, contra 8,3% no Minimum.

## Resumo

Foi proposto um algoritmo de escalonamento determinístico para SDVs, que maximiza o número de tarefas concluídas dentro do prazo e favorece caminhos mais fiáveis.
O objetivo não é a menor latencia mas sim a maior taxa de satisfação, o que é mais importante para aplicações críticas.
O problema é que é um algoritmo que assume o conhecimento prévio das tarefas, a pesar de dizer que é dinamico não dizem como.
