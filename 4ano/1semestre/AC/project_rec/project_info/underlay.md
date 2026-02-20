# Configuração da Underlay

Comecei por configurar nos routers os IPs para as interfaces para a conectividade Lisbon, Porto, Core1, Core2 e ativei o OSPF e as interfaces loopback.

Depois fiz o mesmo para os spines e para os leafs.

## Conectividade OSPF

```bash

Nas interfaces dos routers:
ip ospf 1 area 0

Nas configurações gerais:
router ospf 1
network 10.0.0.0 0.0.255.255 area 0

(Para os spines/leafs foi com router-id)

```