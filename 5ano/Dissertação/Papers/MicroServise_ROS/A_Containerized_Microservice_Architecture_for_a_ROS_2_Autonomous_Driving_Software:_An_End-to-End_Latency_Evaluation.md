# A Containerided Microservice Architecture for a ROS 2 Autonomous Driving Software: An End-to-End Latency Evaluation

## Contexto e objetivo

A indústria automóvel está a passar de ECUs dedicadas para veículos definidos por software (SDV), em que um computador central consolida muitas funções. Os contentores são uma peça central dessa transição, mas o seu impacto em métricas de tempo real (latência ponta-a-ponta, jitter, uso de CPU e memória) quase não tinha sido estudado. O artigo propõe uma arquitetura de microsserviços para o Autoware (software de condução autónoma open-source sobre ROS 2) e mede esse impacto.

## Arquitetura proposta

- O Autoware é dividido em 8 contentores por módulo funcional: sensing, perception, localization, map, planning, control, vehicle e system. No total são cerca de 190 nós ROS 2.
- Uma imagem base comum (Ubuntu 22.04, ROS 2, CUDA/TensorRT, dependências) serve de ponto de partida para todos os contentores e também para desenvolvimento.
- O lançamento centralizado do Autoware foi separado em pacotes de lançamento por módulo. Os parâmetros ficam fora dos contentores e são montados no arranque.
- Um pipeline de CI compila imagens para x86 e aarch64, corre testes unitários e modulares e publica tudo num registo de contentores. A orquestração usa k3s + Docker.

## Metodologia

Compararam três modos de implementação: bare-metal, contentor único e multi-contentor. Os testes correram em duas plataformas: AMD EPYC (x86) e Ampere Altra (aarch64). Foi usado o escalonador padrão do Linux (CFS), sem configuração de tempo real estrito. Os testes têm complexidade crescente:

1. DDS puro (ddsperf, CycloneDDS): latência de ida e volta com mensagens de 1 kB a 8 MB.
2. ROS 2 simples (ros2_benchmark, deteção AprilTag): taxas de 10, 30 e 60 fps e débito máximo.
3. Autoware completo em simulação de ciclo fechado (AWSIM, rota em Nishi-Shinjuku, Tóquio), com 100 corridas. Mediram uma cadeia crítica de 17 callbacks, do sensor LiDAR ao comando do veículo.

## Principais resultados

- **DDS**: os contentores tiveram menor latência em quase todos os casos. Em aarch64 a melhoria foi de cerca de 15% a 1 kB e 18% a 64 kB, contra 8–10% em x86. A vantagem é maior na gama de 1–128 kB, que é a usada pelo Autoware.
- **ROS 2 simples**: as diferenças de latência foram mínimas (0,4–4,6%). O jitter, porém, desceu na maioria dos casos, chegando a cerca de 30% a 10 fps em aarch64.
- **Autoware**:
  - A latência média ponta-a-ponta desceu com o multi-contentor. Em x86 passou de 194,7 ms para 178,7 ms (−8,1%) e em aarch64 de 258,7 ms para 244,1 ms (−5,6%).
  - Os extremos foram muito reduzidos. Com contentor único em x86, o máximo caiu de 1438 ms para 554 ms e o P99 de 516 ms para 301 ms (−41,7%).
  - O bare-metal mostrou uma distribuição bimodal com cauda longa, enquanto os contentores ficaram mais compactos.
  - A latência de comunicação DDS caiu 61% em x86.
  - O uso de CPU e memória foi menor nos contentores. A memória ficou quase reduzida a metade em x86.
  - O arranque do multi-contentor foi muito mais rápido: 3,8 s contra 13,6 s em x86.
- **Compromisso**: o multi-contentor dá a melhor média, mas tem máximos piores do que o contentor único.