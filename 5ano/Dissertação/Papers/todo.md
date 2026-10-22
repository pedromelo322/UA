# Papers para a dissertação: TSN + Orquestração em SDV

Legenda: ⭐ = prioritário (top 10) · (a confirmar) = só vi a citação, confirmar venue/ano/abstract antes de citar

## 1. TSN + Kubernetes / contentores

- [x] ⭐ [Bridging Time-Sensitive Networking and Containerization: Challenges and Strategies](https://dl.ifip.org/db/conf/cnsm/cnsm2025/1571197638.pdf) — CNSM 2025 (grupo NAP)
- [x] ⭐ [KuberneTSN: a Deterministic Overlay Network for Time-Sensitive Containerized Environments](https://arxiv.org/abs/2302.08398) — arXiv 2023
- [x] ⭐ [Enable Time-Sensitive Applications in Kubernetes with CNI Plugin Agnostic Metadata Proxy](https://arxiv.org/abs/2503.12878) — arXiv 2025
- [x] [FabOS: Hooking up Container Platforms with Time-Sensitive Networking](https://dl.acm.org/doi/pdf/10.1145/3609389.3610568) — ACM 2023
- [x] [Supporting vPLC Networking over TSN with Kubernetes in Industry 4.0](https://dl.acm.org/doi/abs/10.1145/3609389.3610566) — ACM 2023
- [x] [Evaluating real-time and TSN performance of containerized applications in Linux systems](https://www.sciencedirect.com/science/article/pii/S1383762126002729) — ScienceDirect, ago. 2026
- [x] [Preliminary approaches towards the integration of TSN into NFV (CUC e config por stream)](https://arxiv.org/abs/2407.15442) — JITEL 2023 (Não percebi)

## 2. Orquestração time-aware / mixed-criticality

- [x] ⭐ [Edge-Cloud Continuum Orchestration of Critical Services: A Smart-City Approach](https://arxiv.org/abs/2407.17314) — Rosmaninho, Raposo, Rito, Sargento, IEEE TSC 2025 (Não percebi)
- [x] ⭐ [k4.0s: Mixed-Criticality Container Orchestration in Industry 4.0](https://arxiv.org/abs/2205.14188)
- [x] ⭐ [RT-Kube: Enabling Kubernetes Orchestration of Mixed-Criticality Software for AMRs](https://dl.acm.org/doi/abs/10.1109/TRO.2023.3334642) — Lumpp et al., IEEE T-RO 2024, vol. 40
- [x] [Orchestrating Mixed-Criticality Cloud Workloads (scheduling por nível de assurance)](https://arxiv.org/abs/2403.19042) — 2024
- [x] A Multi-Domain Survey on Time-Criticality in Cloud Computing — Andreoli, Cucinotta et al., IEEE TSC 2025, DOI 10.1109/TSC.2025.3539197 (a confirmar)
- [x] Real-time containers: A survey — Struhár et al., Fog-IoT 2020 (a confirmar)
- [x] REACT: Enabling real-time container orchestration — Papadopoulos et al. (a confirmar)
- [x] [CODECO: case study de orquestração edge para AMRs](https://arxiv.org/abs/2511.08354) — 2025 (secundário)

## 3. SDV, arquiteturas zonais e redes in-vehicle

- [x] ⭐ [Deterministic Task Scheduling in In-Vehicle Networks for SDVs](https://arxiv.org/abs/2604.16143) — 2026
- [x] ⭐ [Deterministic and Reliable Software-Defined Vehicles: key building blocks, challenges, and vision](https://arxiv.org/abs/2407.17287) — Teixeira, Raposo, Lopes, Sargento
- [ ] ⭐ [IEEE 802.1DG-2025: TSN Profile for Automotive In-Vehicle Ethernet](https://standards.ieee.org/beyond-standards/time-sensitive-networking-for-automotive-in-vehicle-communications/) — standard
- [x] [Dynamic Onboard Service Orchestration for SDVs](https://arxiv.org/abs/2410.11847) — 2024 (User Experience para serviços BE)
- [x] [Configuring ADAS Platforms for Automotive Applications Using Metaheuristics](https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2021.762227/full) — Frontiers 2021 (mapeamento de tarefas + scheduling TSN) (muito grande e pareceu-me ser a parte do ISAC. NÃO LI)
- [x] [Secure Time-Sensitive Software-Defined Networking in Vehicles](https://arxiv.org/abs/2201.00589) — Schmidt et al. (nem sequer li tem SDNs)
- [x] [Strategies for Integrating Control Flows in Software-Defined In-Vehicle Networks](https://arxiv.org/abs/2010.03839) — CAN sobre Ethernet/TSN (Monetorização de mensagens CAN, out of scope)
- [ ] [Bridging real-time CAN networks with SPE and TSN](https://acta.imeko.org/index.php/acta-imeko/article/view/2073/3131) — Acta IMEKO (gateway CAN-TSN)
- [ ] [Design Methodology of Automotive TSN System Based on OMNeT++](https://www.mdpi.com/1424-8220/22/12/4580) — Sensors 2022

## 4. Autoware / ROS 2 em contentores

- [ ] ⭐ [A Containerized Microservice Architecture for a ROS 2 Autonomous Driving Software: An End-to-End Latency Evaluation](https://arxiv.org/abs/2404.12683) — 2024 (Autoware + k3s)
- [ ] End-to-End Latency Optimization for Containerized ROS 2 Autonomous Driving Software — IEEE Access 13, 2025, pp. 112654–112672
- [ ] [Autoware_Perf: tracing and performance analysis framework for ROS 2](https://www.sciencedirect.com/science/article/abs/pii/S1383762121002344) — J. Systems Architecture 2021
- [ ] [Message Flow Analysis with Complex Causal Links for Distributed ROS 2 Systems](https://arxiv.org/abs/2204.10208)

## 5. Configuração TSN (CNC/CUC, GCL, scheduling)

- [ ] ⭐ [A Survey of Scheduling Algorithms for the Time-Aware Shaper in TSN](https://arxiv.org/abs/2211.10954) — Stüber et al., IEEE Access
- [ ] [TSN for Industrial Automation: Current Advances and Future Directions](https://dl.acm.org/doi/10.1145/3695248) — ACM Computing Surveys (modelos 802.1Qcc)
- [ ] [IEEE 802.1Qbv GCL Synthesis using Array Theory Encoding](https://ieeexplore.ieee.org/document/8430062/) — Serna Oliver et al., RTAS 2018
- [ ] [Formal Scheduling Constraints for Time-Sensitive Networks](https://arxiv.org/abs/1712.02246)
- [ ] Combined task- and network-level scheduling for distributed time-triggered systems — Real-Time Systems 52, 2016, pp. 161–200 (a confirmar; sugerido como 11.º)
- [ ] Latency-Aware Function Placement, Routing, Scheduling in TSN-based Industrial Networks — Bhattacharjee et al. (a confirmar)
- [ ] [Making Time-Sensitive Networking Deployable: A Comprehensive Lifecycle Architecture](https://arxiv.org/abs/2608.20500) — 2026 (só vi o título)
- [ ] [Towards Time Sensitive Networking on Smart Cities: Techniques, Challenges, and Solutions](https://arxiv.org/abs/2312.03635) — grupo NAP
- [ ] Time-Sensitive Smart Cities: Addressing Smart City Challenges With TSN — Lopes, Raposo, Martins, Sargento, IEEE Access 13, 2025, pp. 10459–10480

## 6. Testbed e trabalho prévio do grupo

- [ ] Aveiro Tech City Living Lab: A Communication, Sensing, and Computing Platform for City Environments — Rito et al., IEEE IoT Journal 10(15), 2023, pp. 13489–13510
- [ ] Vanetza-NAP: Vehicular Communications and Services in MicroServices Architectures — Raposo, Sargento, IEEE VNC 2024
- [ ] Time Synchronization in V2X Communications — Raposo, Sargento, IEEE VNC 2024
- [ ] The Path Towards a Criticality-Sensitive Smart City — CNSM 2025

## Não-papers úteis

- [ ] [PICCOLO (LG)](https://github.com/LGE-OSS/PICCOLO) — orquestrador para SDV, descontinuado por limitações estruturais do Kubernetes (bom argumento de motivação)

## Próximos passos

- [ ] Ler em detalhe os 5 primeiros da secção 1 e 2 (Bridging TSN, KuberneTSN, metadata proxy, Edge-Cloud Continuum, task scheduling in-vehicle)
- [ ] Confirmar as entradas marcadas "(a confirmar)"
- [ ] Gerar ficheiro `.bib`
