# OpenNAP / Napster

Napster e um servico de compartilhamento de arquivos peer-to-peer (P2P) que foi lancado em 1999. Ele permitia que os usuarios compartilhassem arquivos de musica digital, com outros usuarios da rede.

## Como funciona

1. Um utilizador envia os seus arquivos de musica para o servidor do Napster, que indexa os arquivos e os torna disponiveis para outros usuarios.
2. Outro dispositivo pode pesquisar por um arquivo especifico usando o nome do artista, titulo da musica ou album. O servidor do Napster retorna uma lista de resultados que correspondem a pesquisa com informacoes (nome do arquivo, tamanho, nome do usuario que o compartilha e endereco IP).
3. O usuario pode entao escolher um arquivo da lista de resultados e iniciar o download diretamente do computador do usuario que esta compartilhando o arquivo.
4. Um utilizador pode remover um arquivo do seu compartilhamento a qualquer momento, o que o torna indisponivel para outros novos utilizadores que tentarem baixa-lo, mas os usuarios que ja iniciaram o download do arquivo ainda poderao conclui-lo.

Se o servidor do Napster ficar offline, os usuarios ainda poderao compartilhar arquivos diretamente entre si, mas nao poderao pesquisar por novos arquivos ou acessar a lista de usuarios (ponto unico de falha).

## OpenNAP (multiple servers interligados)

OpenNAP e uma implementacao de codigo aberto do protocolo Napster, que permite a criacao de multiplos servidores Napster independentes. Isso significa que, em vez de depender de um unico servidor centralizado, os usuarios podem se conectar a diferentes servidores OpenNAP para compartilhar arquivos. Se um servidor nao souber de um arquivo especifico, ele pode encaminhar a solicitacao para outros servidores OpenNAP, aumentando a disponibilidade dos arquivos e reduzindo a dependencia de um unico ponto de falha.

Napster e OpenNAP sao hibridos e unstructured porque a pesquisa e feita atraves de um servidor centralizado (ou multiplos servidores no caso do OpenNAP), mas o download dos arquivos e feito diretamente entre os usuarios, sem passar por um servidor centralizado.

## Napster

### Vantagens

- Pesquisa O(1) - rapida, exata, sem flooding
- Indice atualizado em tempo real
- Servidor nao e bottleneck nos dados (transferencia direta)

### Desvantagens

- Ponto unico de falha - servidor cai, rede para completamente
- Vulneravel legalmente - um processo encerrou tudo
- Free-riding e download de fonte unica

## OpenNAP

### Vantagens

- Mais resiliente que Napster - varios servidores federados
- Pesquisa rapida herdada do Napster

### Desvantagens

- Cada servidor ainda e ponto de falha parcial
- Ainda vulneravel legalmente - servidores identificaveis