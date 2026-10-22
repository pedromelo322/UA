# Design Methodology of Automotive Time-Sensitive Network System Based on OMNeT++ Simulation System

## Problema

As redes Ethernet automóveis precisam de garantias de tempo real: baixa latência, jitter reduzido e fiabilidade. O TSN (Time-Sensitive Networking) oferece essas garantias. No entanto, a maioria dos estudos sobre TSN automóvel analisa um único mecanismo isolado, como TAS, CBS ou CQF, ou compara apenas dois. Faltam uma metodologia de projeto global e uma ferramenta de simulação que cubra todos os mecanismos relevantes em conjunto.

## Contribuições

1. Mapeamento entre tipos de tráfego e cenários automóveis. Os autores propõem 8 classes de tráfego (TC1 a TC8), associadas aos 8 níveis de prioridade PCP do IEEE 802.1:

- TC8 (máxima): sinais de controlo críticos para a segurança, como travões, motor e controlo ADAS.
- TC7: sinais de média críticos para a segurança, como lidar, radar e câmaras ADAS.
- TC5: gestão de rede, por exemplo PTP e diagnóstico.
- TC4: V2X.
- TC3: controlo não crítico, como luzes, climatização e janelas.
- TC2: infotainment.
- TC1 (mínima): OTA e logging.

A ideia central é definir as restrições temporais por classe de tráfego e não por fluxo individual. Essas restrições passam a ser o objetivo principal do projeto da rede.

2. Metodologia de projeto em V. O processo segue estas fases:

   - análise de requisitos;
   - arquitetura E/E (rede, software e redundância);
   - projeto detalhado (escalonabilidade, algoritmo de escalonamento, segurança e redundância);
   - verificação em plataforma de simulação ou física;
   - testes funcionais, de integração e de aceitação.

3. Plataforma de simulação. A plataforma assenta em OMNeT++, INET e CoRE4INET. Os autores comparam primeiro as ferramentas existentes (NeSTiNg, CoRE4INET, TSimNet e frameworks em OPNET) e concluem que nenhuma cobre todos os mecanismos. Acrescentam então ao CoRE4INET os seguintes:

   - frame preemption (802.1Qbu);
   - IPV e token bucket MEF 10.3 no PSFP (802.1Qci);
   - CQF (802.1Qch);
   - ATS (802.1Qcr);
   - FRER (802.1CB).

## Resultados principais

Sem escalonamento: o lidar atinge uma latência máxima de 61,49 µs em 3 saltos, o que não cumpre o requisito do fabricante (≤100 µs para 5 saltos). Os travões apresentam jitter até 12,3 µs, causado por interferência do tráfego de vídeo.
Com TAS: o tráfego de alta prioridade (classes 6 e 7) fica com jitter praticamente nulo, e o lidar desce para 59,95 µs, cumprindo o requisito. Em contrapartida, o tráfego de baixa prioridade (áudio, vídeo e janelas) vê a latência máxima e o jitter aumentarem cerca de 70 µs. Ainda assim, fica muito abaixo dos seus limites, que são da ordem dos milissegundos.
Com FRER: o impacto na latência é mínimo, porque é aceite a cópia que chega primeiro. No caso do Brake_Act3, isso significa usar o caminho mais curto, com 3 saltos em vez de 4, o que reduz a sua latência de cerca de 14 para 10,6 µs.