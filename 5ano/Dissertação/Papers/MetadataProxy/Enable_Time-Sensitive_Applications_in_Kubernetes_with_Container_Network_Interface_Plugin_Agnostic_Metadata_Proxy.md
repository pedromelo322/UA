# Enable Time-Sensitive Applications in Kubernetes with Container Network Interface Plugin Agnostic Metadata Proxy

## Problema

As aplicações sensíveis ao tempo (TSAs), precisam de comunicação determinística: baixa latência, pouco jitter e nenhuma perda por congestionamento. As redes TSN (Time-Sensitive Networking) resolvem isto do lado da rede. No entanto, para agendar os pacotes corretamente, a NIC e as Qdiscs do Linux (como taprio, etf e mqprio) precisam de metadados de cada pacote, sobretudo a prioridade (skb->priority) e o timestamp (skb->tstamp).

Em Kubernetes, cada pod corre num network namespace isolado. Quando o pacote sai do namespace do pod, o kernel apaga esses metadados através de skb_scrub_packet e dev_forward_skb. Resultado: o tráfego TSN chega à NIC sem prioridade e é tratado como best-effort.

## Limitações das soluções anteriores

Os trabalhos relacionados (FabOS, Rosa et al., Balla et al., entre outros) têm três tipos de problemas:

- Recorrem a **interfaces secundárias** via Multus, que o Kubernetes não suporta oficialmente.
- Usam **kernel bypass** (DPDK, XDP, memória partilhada), o que ignora políticas de rede e NAT e, muitas vezes, impede o uso das capacidades TSN da NIC.
- Exigem **modificar a aplicação** ou intercetar a API de sockets.

## Proposta: TSN Metadata Proxy

É um pequeno plugin CNI "companheiro", baseado em eBPF, que corre depois do plugin CNI principal (Flannel, Calico, Kindnet…) sem o modificar. Instala-se com um simples kubectl apply, sob a forma de DaemonSet. Funciona assim:

1. Guardar: um programa eBPF tc egress na interface veth do pod copia a prioridade e o timestamp de cada pacote para um hashmap eBPF partilhado ao nível do nó, usando o endereço do skb como chave. São apenas 12 bytes por pacote, e o payload nunca é copiado nem alterado.
2. Seguir o pacote: se o skb for copiado ou realocado durante o encaminhamento (por túneis, NAT, etc.), uma sonda eBPF fexit em skb_clone atualiza a chave no mapa. Esta técnica vem da ferramenta pwru. Como alternativa mais simples, pode usar-se skb->data como chave.
3. Restaurar: um programa tc egress na NIC TSN repõe os metadados imediatamente antes de o pacote entrar na Qdisc.
4. Limpar: um garbage collector periódico remove as entradas de pacotes que nunca chegaram à NIC, por exemplo porque foram descartados por uma firewall.

## Vantagens

Os autores testaram apenas integração e funcionalidade, sem medir desempenho. Usaram um único nó com Minikube e KIND, em Ubuntu e Debian com kernels 6.8 a 6.12, e com Flannel, Kindnet e Calico.

O cenário tinha dois emissores (prioridades 1 e 2) e uma taprio com ciclo de 40 µs dividido em três janelas: 0–10 µs para a prioridade 1, 10–20 µs para a prioridade 2 e 20–40 µs para best-effort. Sem o proxy, todos os pacotes caíram na janela best-effort. Com o proxy, cada fluxo foi transmitido na sua janela correta.

## Resumo

Oferece um plugin CNI baseado em eBPF que preserva os metadados de prioridade e timestamp dos pacotes TSN, e depois de passarem pelo kernel (que remove essses metadados), volta a adicioná-los antes de chegarem à NIC (egress).
Foco em criar um pluggin que não faça kernel bypass.
