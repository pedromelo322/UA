# KaZaA

E uma extensao de Gnutella que adiciona super-nos para aumentar escalabilidade.
Um no com bons recursos (largura de banda, CPU, etc) pode se tornar um super-no, que indexa os arquivos compartilhados por seus clientes e responde a consultas em seu nome.

## Como funciona

1. Um cliente KaZaA se conecta a um super-no.
2. O super-no indexa os arquivos compartilhados pelo cliente.
3. Quando um cliente faz uma consulta, o super-no responde com os resultados indexados e se nao encontrar o arquivo, encaminha a consulta para outros super-nos, aumentando a probabilidade de encontrar o arquivo desejado.
4. O cliente baixa o arquivo diretamente do cliente que o possui, sem passar pelo super-no, o que melhora a eficiencia da transferencia.

E Hybrid Unstructured, pois a pesquisa e structurada atraves dos super-nos, mas o downloading e unstructured, pois os arquivos sao baixados diretamente dos clientes, sem passar por um servidor centralizado.

## Vantagens

- Super-nos eleitos dinamicamente - sem administracao central
- Flooding so entre SNs - muito menos trafego que Gnutella
- SN cai, peers reconectam automaticamente a outro SN

## Desvantagens

- Super-nos sobrecarregados - maquinas potentes penalizadas
- Free-riding sem punicao
- Pesquisa nao garantida - TTL pode nao alcancar o ficheiro