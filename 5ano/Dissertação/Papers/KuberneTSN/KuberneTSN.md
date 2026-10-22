# KuberneTSN

## Problema

Em ambientes de edge/cloud continuum, os componentes críticos correm cada vez mais em contentores orquestrados por Kubernetes. Grande parte do trabalho existente foca-se na orquestração e no escalonamento de CPU, mas a camada de rede fica por resolver.
As redes overlay dos contentores acrescentam overhead (dupla travessia da pilha de rede do kernel, switch virtual) e não suportam TSN (Time-Sensitive Networking).
Duas razões: algumas imagens de SO não suportam SO_TXTIME, e o tempo de transmissão nunca sai do namespace de rede do contentor.

## Solução

O KuberneTSN é uma overlay determinística e acelerada, implementada como o plugin CNI tsn-cni, que se pode usar em conjunto com outros plugins (via Multus). Por exemplo, Flannel ou Calico para tráfego best-effort e tsn-cni para tráfego sensível ao tempo. Combina 3 técnicas:

- **Overlay networks** integradas no Kubernetes.
- **Kernel-bypassing** com DPDK, que evita a pilha de rede do kernel e as mudanças de contexto.
- **Escalonador de pacotes** em userspace compatível com TSN (Time-Aware Shaper, IEEE 802.1Qbv).

## Arquitetura

### LibKTSN

Biblioteca partilhada injetada com LD_PRELOAD, que interceta apenas os envios em sockets de datagramas com SO_TXTIME (tráfego TSN) e os passa por memória partilhada. Não requer alterações ao código da aplicação. O restante tráfego segue o caminho normal.

### KTSNd

Daemon num contentor separado, que escalona a transmissão segundo o tempo pedido pela aplicação e envia o pacote em nome dela, preservando MACs, IPs e portas UDP. Implementa a sua própria pilha UDP/IP com DPDK e entrega os pacotes a um Open vSwitch em userspace (OVS-DPDK).

### Avaliação

Testbed real com duas workstations, ligadas por um switch TSN, sincronizadas por PTP. Uma aplicação talker/listener envia UDP com ciclo de 1 ms. Compara-se bare-metal, tsn-cni e Flannel:

- **Latência**: tsn-cni tem medianas de ~21,5 µs (64 B) a 41,7 µs (1024 B), quase idênticas ao bare-metal. O Flannel tem cerca de 12 % mais latência em média.
- **Jitter**: mediana nula e variabilidade desprezável no tsn-cni e no bare-metal.
- **Determinismo** (CDF, 256 B): no tsn-cni, 90 % e 99 % dos pacotes chegam em 26,4 µs e 28,1 µs. No Flannel, em 29,6 µs e 30,7 µs, ou seja, chegadas menos precisas. O Flannel tem de usar um ciclo "enviar e dormir", porque não permite definir o tempo de transmissão.

## Resumo

Plugin CNI para Kubernetes que permite enviar tráfego TSN com baixa latência e jitter.
As aplicações não são alteradas.
Faz kernell-bypassing ou seja o tráfego vai diretamente para a Nic, sem passar pelo kernel do Linux, para combater o problema do tráfego passar pela pilha de rede do kernel 2x. (não passar pelo kernel pode não ser bom).
Tem um core sempre a 100% para garantir que o escalonamento de pacotes é feito a tempo e horas.