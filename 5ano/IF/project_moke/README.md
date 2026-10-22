# Chat multi-utilizador (Python, só stdlib)

Cada pasta é uma milestone independente que evolui a anterior. Correr sempre
**dentro** da pasta da milestone (os módulos importam `protocol.py` local).
Requer Python ≥ 3.10; os testes precisam de `pytest`.

| Pasta | Milestone | O que acrescenta |
|---|---|---|
| `m0_echo/` | M0 | Servidor/cliente TCP de eco |
| `m1_framing/` | M1 | JSON por linha, buffer de receção (`LineReader`), `NICK` e `MSG` |
| `m2_multi/` | M2 | Uma thread por cliente, lista partilhada com lock, broadcast, `EVENT` joined/left |
| `m3_commands/` | M3 | `/list`, `/msg`, `/quit`, nicks únicos, `ERROR` com códigos, `PROTOCOL.md` |
| `m4_robust/` | M4 | Classe `ChatServer`, idle timeout (408), linha máx. 64 KiB (413), fila de envio por cliente, Ctrl+C limpo, `logging`, testes pytest |
| `m5_discovery/` | M5 | Descoberta UDP (`DISCOVER` → `SERVER`): o cliente encontra o servidor sem `--host` |
| `m6_files/` | M6 (A) | Transferência de ficheiros com frames binários length-prefixed, `/send`, verificação SHA-256 |

A especificação completa (versão final) está em [`m6_files/PROTOCOL.md`](m6_files/PROTOCOL.md).

## Como correr (versão final)
```sh
cd m6_files
python3 server.py                     # TCP 5000 + UDP 5001; --help para opções
python3 client.py --nick ana          # noutro terminal/máquina: descobre o servidor na LAN
python3 client.py --nick rui --host 192.168.1.50   # ou indicar o IP diretamente
python3 client.py --discover          # só listar servidores
```
No cliente: `/list`, `/msg rui olá`, `/send rui ~/foto.png`, `/quit`.
Os ficheiros recebidos ficam em `./downloads/` (mudar com `--download-dir`).

Opções úteis do servidor: `--idle-timeout 300`, `--max-file <bytes>`,
`--no-discovery`, `--name <nome anunciado>`, `--log-level DEBUG`.

Testar à mão sem o cliente: `nc 127.0.0.1 5000` e escrever JSON, ex.:
`{"type":"NICK","nick":"ana"}`.

## Testes
```sh
cd m6_files && python3 -m pytest -q     # 51 testes (m4: 26, m5: 31)
```
Cobrem o framing (mensagens partidas/juntas, UTF-8 cortado, frames binários),
todos os pedidos e códigos de erro, desconexões abruptas (RST), idle timeout,
cliente lento, shutdown, descoberta UDP e transferências (incluindo cancelamentos
e um teste ponta-a-ponta com a classe `ChatClient`).

## Rede
- **Firewall**: o servidor precisa de TCP 5000 e UDP 5001 abertos
  (Linux/ufw: `sudo ufw allow 5000/tcp && sudo ufw allow 5001/udp`; Windows: aceitar o aviso do Defender).
- A descoberta por broadcast só funciona na mesma rede local.
- **Wireshark**: interface `lo` (ou a da LAN) com o filtro `tcp.port == 5000 || udp.port == 5001`.
  No M0 vê-se o 3-way handshake, os dados e o FIN; no M6 vêem-se os frames
  binários a seguir às linhas `FILE_CHUNK`. No Windows é preciso o Npcap com o adaptador de loopback.
