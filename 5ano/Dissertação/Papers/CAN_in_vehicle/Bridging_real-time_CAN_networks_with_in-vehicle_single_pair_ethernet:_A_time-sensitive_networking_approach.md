# Bridging real-time CAN networks with in-vehicle single-pair Ethernet: A time-sensitive networking approach

Não li, mas pareceu-me um bom paper. Não achei que fosse relevante visto que se foca no dados dos dispositivos até à ECU.
O que não é propriamente o meu scope eu acho.
Mas paper interessante.

## Resultados

| Cenário | Média (µs) | Máx. (µs) |
|---|---:|---:|
| Só CAN (referência) | 459 | 640 |
| CAN + Ethernet, sem TSN | 988 | 1817 |
| + MQPRIO | 792 | 1002 |
| + MQPRIO + CBS (2 Mbps reservados) | 497 | 723 |
| Só TAPRIO (janela de 200 µs em 1 ms) | 1053 | 1624 |