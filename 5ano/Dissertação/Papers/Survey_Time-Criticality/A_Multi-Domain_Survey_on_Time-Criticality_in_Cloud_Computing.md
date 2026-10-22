# A Multi-Domain Survey on Time-Criticality in Cloud Computing

## Problema e objetivo

A cloud convencional foi pensada para maximizar a utilização de recursos e o throughput, oferecendo QoS "best-effort". Muitos casos de uso emergentes são time-critical: neles, um resultado entregue fora do prazo (deadline) é um resultado errado. Os exemplos incluem o controlo industrial, a condução autónoma, o controlo remoto e os media em tempo real (XR, cloud gaming). As exigências vão de dezenas de milissegundos até 1 ms de latência, com fiabilidade entre 99% e 99,9999%. Por exemplo, o controlo de movimento industrial exige menos de 2 ms e mais de 99,999% de fiabilidade.

O survey responde a duas perguntas:

Quais são os desafios de usar a cloud para aplicações time-critical?
Que soluções existem para obter fiabilidade e previsibilidade temporal?

## Compute (Virtualização)

- O essencial é o **isolamento temporal**: o cumprimento de prazos de uma aplicação não deve depender das outras que partilham o hardware. O isolamento espacial (memória, ficheiros) não chega.
- **VMs**: o KVM e o Xen já suportam escalonamento em tempo real no código principal. O Xen tem o RTDS, baseado em EDF. No KVM, o algoritmo CBS está disponível no Linux como SCHED_DEADLINE. O KVM consegue latências próximas de um RTOS em bare metal. Os hipervisores de partição (Jailhouse, Bao, seL4) dedicam núcleos inteiros, mas são pouco adequados à cloud genérica.
- **Containers**: têm melhor desempenho mas isolamento mais fraco. O escalonamento hierárquico em tempo real (HCBS) e as abordagens de co-kernel (RTAI, Xenomai) existem, mas só como patches fora do kernel principal.
- **Unikernels**: prometem o desempenho dos containers com a segurança das VMs. Ainda estão imaturos e quase não foram avaliados para tempo real.
- **Lacuna**: não existe um mecanismo para dimensionar os parâmetros de escalonamento a partir dos requisitos da aplicação. O CPU também não está integrado com a rede nem com o armazenamento.

## Orquestração

- **Escalonamento e admissão**: a elasticidade clássica é reativa e não garante isolamento temporal. Há várias propostas que integram escalonadores de tempo real com controlo de admissão: IRMOS, RT-OpenStack, Nova modificado, RT-Kube, RT-Kubernetes e REACT.
- **Tolerância a falhas**: a replicação é preferida ao checkpointing, que implica segundos de paragem. Destacam-se três trabalhos:
  - HovercRaft recupera em cerca de 10 ms.
  - Nezha usa relógios sincronizados.
  - Mu usa RDMA e deteta falhas em cerca de 600 µs, recuperando em menos de 1 ms.
- **Serverless**: os arranques a frio e as cadeias de funções geram latência e jitter. Existem extensões como o OpenFaaS com SLO e o RT-FaaS com EDF por função.
- **Stream processing**: Naiad, EdgeWise, Amnis e Storm-RTS procuram previsibilidade, sobretudo no edge.
- **Lacuna**: o foco continua a ser serviço satisfatório "para a maioria", não garantias por pedido. Faltam tolerância a falhas com garantias de latência no pior caso e integração com o isolamento ao nível do hipervisor.

## Armazenamento

- **Otimizações locais**:
  - escalonador de disco BFQ;
  - SSDs open-channel e ZNS, com o RAIL a reduzir 7× a latência de cauda nas leituras;
  - polling híbrido;
  - stacks de I/O e sistemas de ficheiros adaptados a containers (Baoverlay, Gear).
- **Bases de dados em tempo real**: as clássicas (Chronos, QeDB) usam controlo por feedback. As NoSQL para cloud e edge procuram reduzir a latência: AQUAS, DAL, RT-MongoDB, Anna, DynamoDB, Citrusleaf, FogStore e Portkey.
- **Lacuna**: é o domínio mais negligenciado. Quase nada usa métodos formais de tempo real. O DynamoDB é apontado como o único serviço com garantias de desempenho razoavelmente previsíveis.

## Redes

- **Redes determinísticas**: o TSN (IEEE 802.1) deverá substituir os fieldbuses proprietários. O 802.1AS sincroniza relógios com precisão de µs e o 802.1Qbv define janelas temporais de transmissão. A integração 5G–TSN (3GPP, Release 16/17) modela o 5G como uma "bridge TSN virtual". Há também o KuberneTSN, que integra TSN no Kubernetes.
- **Stack de comunicação**: o PREEMPT-RT é necessário mas não suficiente. Também são precisos isolamento de CPU, afinidade de IRQs e Qdisc baseada em tempo (TBS). Outros contributos: priorização de tráfego no Xen (VATC), DPDK/UDPDK para RTT cerca de 10× menor, e NFV-RT com garantias soft, em que cerca de 94% dos pacotes cumprem o prazo.
- **Switching virtual**: um switch virtual compatível com TSN continua em aberto. Há comparações entre OVS, VPP, VALE e SR-IOV, além do ESwitch, de datapaths com eBPF/AF_XDP e de balanceamento ao nível do pacote (VMS).
- **Lacuna**: falta harmonizar o escalonamento de tráfego entre host, hipervisor e container. Também falta coordená-lo com o escalonamento de CPU, para que a aplicação gere cada pacote a tempo da sua janela.