# Gnutella

E um protocolo de compartilhamento de arquivos ponto a ponto (P2P) que permite aos usuarios compartilhar e acessar arquivos em uma rede descentralizada.

Quando um dispositivo se conecta a rede Gnutella, para se anunciar, ele envia uma mensagem de "ping" para os vizinhos que ele conhece, esses vizinhos, por sua vez, encaminham a mensagem para seus proprios vizinhos, e respondem com uma mensagem de "pong" que contem informacoes como IP, porta, numero de arquivos compartilhados e largura de banda disponivel. Os pongs sao encaminhados de volta para o dispositivo original pelo mesmo caminho que a mensagem de ping.

Quando um dispositivo deseja encontrar um arquivo especifico, ele envia uma mensagem de "query" para seus vizinhos com as informacoes minimo de largura de banda do responding servent e search criteria. Os vizinhos encaminham a mensagem de query para seus proprios vizinhos, e assim por diante, ate que o arquivo seja encontrado ou o TTL (Time To Live) da mensagem expire. Se um dispositivo encontrar o arquivo solicitado, ele responde com uma mensagem de "query hit" que contem informacoes como IP, porta, largura de banda, numero de resultados que tem e uma lista com o index, nome e tamanho dos arquivos encontrados.

O dispositivo que fez a consulta pode entao escolher um dos resultados e iniciar uma transferencia direta de arquivo com o dispositivo que possui o arquivo, usando o protocolo HTTP ou outro protocolo de transferencia de arquivos.
Se receber mais que um query hit, o dispositivo pode escolher o melhor resultado com base em criterios como largura de banda disponivel, numero de arquivos compartilhados ou proximidade na rede.

Caso o no que responde com o Query hit esteja atras de um firewall ou NAT, ele pode usar uma tecnica chamada "push" para enviar o arquivo para o dispositivo que fez a consulta. Nesse caso, o dispositivo que fez a consulta envia uma mensagem de "push request" para o no que possui o arquivo, solicitando que ele envie o arquivo diretamente para ele. O no que possui o arquivo entao inicia uma conexao direta com o dispositivo que fez a consulta e transfere o arquivo usando o protocolo HTTP ou outro protocolo de transferencia de arquivos.

## Melhorias no flooding das mensagens

- **Expanding Ring**: comeca com um TTL baixo e aumenta gradualmente, permitindo que as mensagens sejam propagadas de forma mais eficiente e reduzindo o trafego desnecessario na rede.
- **k-Random Walkers**: em vez de enviar mensagens para todos os vizinhos, o dispositivo seleciona aleatoriamente k vizinhos para encaminhar a mensagem, reduzindo o trafego na rede e aumentando a eficiencia da busca. Cada vizinho que recebe um walker reencaminha-o para 1 vizinho aleatorio, e assim por diante, ate que o arquivo seja encontrado ou o TTL expire.

## Hybrid Gnutella

E uma network de 2 camadas (ultra-peers e leaf nodes) onde os leaf nodes se conectam apenas a ultra-peers, e os ultra-peers se conectam entre si. Os leaf nodes enviam suas consultas para os ultra-peers, que as encaminham para outros ultra-peers, reduzindo o trafego na rede e melhorando a eficiencia da busca.

Gnutella e descentralizado e unstructured porque todos os peers sao iguais e nao ha um esquema de organizacao ou hierarquia na rede.

Gnutella é pure P2P e unstructured, Hybrid Gnutella é hibrido e unstructured.

## Vantagens

- Totalmente descentralizado - sem ponto unico de falha
- Impossivel de encerrar legalmente
- Auto-organizante - novos peers entram sem configuracao
- Suporta pesquisa por palavras parciais (wildcard)

## Desvantagens

- Flooding gera trafego enorme - escala muito mal
- TTL limita alcance - ficheiros raros podem nao ser encontrados
- Free-riding sem qualquer punicao
- Download de fonte unica - lento para ficheiros grandes