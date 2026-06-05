# BitTorrent

BitTorrent e um protocolo de compartilhamento de arquivos ponto a ponto (P2P) que permite a distribuicao eficiente de grandes quantidades de dados pela internet.

## Como funciona

1. O usuario cria um arquivo torrent, que contem informacoes sobre os arquivos a serem compartilhados, como nome, tamanho total, tamanho de cada pedaco, um hash para cada pedaco e URL do tracker. O arquivo torrent e entao compartilhado com outros usuarios, geralmente atraves de sites de torrent ou por meio de compartilhamento direto.
2. O usuario que deseja baixar os arquivos do torrent abre o arquivo torrent em um cliente BitTorrent, que se conecta ao tracker para obter uma lista de outros usuarios (peers) que estao compartilhando os arquivos.
3. O tracker responde com uma lista de peers, que inclui informacoes como o endereco IP, porta e o numero de pedacos que cada peer possui.
4. O cliente BitTorrent trocam handshakes com os peers onde trocam informacoes como info_hash e peer_id para confirmar que estao no mesmo swarm (grupo de usuarios compartilhando o mesmo torrent).
5. Cada peer envia um BitField, um mapa de bits que indica quais pedacos do arquivo o peer possui. O cliente BitTorrent usa essas informacoes para determinar quais pedacos solicitar de cada peer. Usa a estrategia de "rarest first" para solicitar os pedacos mais raros primeiro, garantindo que os arquivos sejam distribuidos de forma eficiente e evitando que alguns pedacos se tornem escassos. Depois de obter o pedaco valida o pedaco com a hash e se corresponder partilha com outros peers que precisem (tit-for-tat).
6. Quando um dispositivo termina o Download completo, manda para o tracker um ANNOUNCE completed, e o tracker atualiza o seu estado para seeder.

Caso um peer esteja so a receber e nao esta a enviar nada, recebe um CHOKE, que bloqueia temporariamente o envio de pacotes para o mesmo.
A cada 30 segundos acontece o Optimist UNCHOKE em que um no desbloqueia aleatoriamente um peer que estava CHOCKed.

Caso nao haja tracker, usa-se BitTorrent (Trackless) com uso de DHT:
DHT referencia que nos pertencem a um swarm especifico (tem aquele torrent).

BitTorrent e Hybrid unstructured, porque existe um servidor que facilita a comunicacao entre nodes.
BitTorrent (Trackless) e pure p2p e structured, porque nao existe servidor e a organizacao e feita de maneira estruturada pela DHT.

## Vantagens

- Download multi-source paralelo - muito mais rapido
- Tit-for-tat penaliza free-riders eficazmente
- DHT trackerless - funciona sem tracker central
- Rarest-first garante boa distribuicao dos pieces

## Desvantagens

- Precisa de .torrent ou magnet link - descoberta externa
- Conteudo desaparece se todos os seeders sairem
- Sem deduplicacao - mesmo bloco em torrents diferentes
- Sem versionamento nativo - atualizacao = novo torrent

