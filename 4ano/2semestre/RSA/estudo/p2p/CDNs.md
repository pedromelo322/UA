# CDNs

O crescimento explosivo das web-based applications criou serios problemas de performance nos servidores centrais, que nao estavam preparados para lidar com milhoes de pedidos simultaneos, degradando a experiencia do utilizador. Para resolver isto, criaram-se as CDNs.

Uma CDN consiste numa infraestrutura de varios **surrogate servers** distribuidos geograficamente, que guardam replicas do conteudo do servidor original. O objetivo e melhorar a performance e a availability do conteudo, evitando tanto a sobrecarga do servidor original como o congestionamento no caminho de rede ate ele.

## Componentes principais

Uma CDN tem 4 componentes principais:

1. **Distribution Infrastructure** - quando o servidor original tem conteudo novo, esta infraestrutura e responsavel por replicar esse conteudo pelos surrogate servers.
2. **Request Routing Infrastructure** - quando um cliente faz um pedido, esta infraestrutura redireciona-o para o surrogate server que oferece melhor performance, tipicamente o **mais proximo** do cliente.
3. **Content Delivery Infrastructure** - e o que entrega efetivamente o conteudo ao cliente a partir do surrogate server selecionado.
4. **Accounting Infrastructure** - agrega logs de toda a rede (acessos, bytes transferidos, conteudo entregue, etc.) para efeitos de faturacao aos clientes da CDN e para otimizacao da propria rede.

