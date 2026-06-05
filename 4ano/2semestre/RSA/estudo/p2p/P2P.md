# P2P Networks

Explora a conectividade de varios peers, cada peer contribui para a network, os peers podem se conectar diretamente uns aos outros, sem a necessidade de um servidor centralizado. Isso permite uma distribuicao eficiente de dados e recursos.

## Vantagens

- Clientes fornecem recursos, como largura de banda, armazenamento e poder de processamento, para a rede.
- Escalabilidade: a medida que mais peers se juntam a rede, a capacidade de processamento e armazenamento aumenta, tornando a rede mais robusta.
- Resiliencia: se um peer falhar ou sair da rede, os outros peers ainda podem se comunicar e compartilhar recursos, tornando a rede mais resistente a falhas.
- Custo reduzido: nao ha necessidade de um servidor centralizado.

## Desvantagens

- Seguranca: a falta de um servidor centralizado pode tornar a rede mais vulneravel a ataques.
- Latencia: a comunicacao direta entre peers pode resultar em maior latencia, especialmente se os peers estiverem geograficamente distantes.

## Pure P2P

Todos os peers sao iguais e se comunicam diretamente entre si, cada peer e um cliente e um servidor ao mesmo tempo.
Nao ha um servidor centralizado, que controle, coordene ou facilite a comunicacao entre os peers.

## Hibrido P2P

Combina elementos de redes P2P e cliente-servidor. Em um modelo hibrido, pode haver servidores que facilitam a comunicacao entre os peers, mas os peers ainda se comunicam diretamente entre si para compartilhar recursos e dados (simple nodes, router, rendezvous).

- **Simple nodes**: sao os peers comuns que se conectam a rede e compartilham recursos.
- **Router**: atua como um intermediario para facilitar a comunicacao entre os peers, especialmente quando eles estao atras de firewalls ou NATs, está no fluxo de dados.
- **Rendezvous**: um ponto de encontro onde os peers podem se registrar e descobrir outros peers na rede, facilitando a conexao entre eles, está no caminho de descoberta, pode ou não estar no fluxo de dados.

## Unstructured P2P

Em uma rede P2P nao estruturada, os peers se conectam de forma aleatoria e nao ha uma organizacao especifica para a distribuicao de dados ou recursos. Os peers podem se conectar a outros peers de maneira arbitraria, e a localizacao dos dados ou recursos pode ser dificil de determinar.

Se um peer deseja encontrar um recurso especifico, a query e propagada para outros peers na rede, e cada peer verifica se possui o recurso solicitado.

Problemas:

- A query pode nao ser resolvida, se o recurso for raro.
- Propagacao causa trafego excessivo na rede.
- Exemplo: Gnutella, Kazaa, BitTorrent.

## Structured P2P

Existe um protocolo especifico para organizar a rede e distribuir os dados de maneira eficiente. Os peers sao organizados em uma estrutura hierarquica ou em um sistema de hash distribuido (DHT), onde cada peer e responsavel por um conjunto especifico de dados ou recursos.

Exemplos: BitTorrent (trackeless), IPFS.

## Fully Decentralized Information Systems

Sao sistemas de informacao totalmente descentralizados, onde nao ha um ponto central de controle ou autoridade. Esses sistemas sao projetados para operar de forma autonoma, sem a necessidade de um servidor centralizado ou intermediario.

Exemplos: Gnutella, BitTorrent (trackeless), IPFS.

### Vantagens

- Bom tempo de resposta
- Sem administracao centralizada
- Sem ponto unico de falha
