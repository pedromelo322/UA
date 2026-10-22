# TODO

M0–M6 estão feitos (M6 = opção A, transferência de ficheiros). Ver `README.md`.

## Interop com colegas
- [ ] Combinar a semântica que o enunciado deixa em aberto (ver `m6_files/PROTOCOL.md`):
  - o remetente recebe o próprio `MSG` como `CHAT`? (aqui: sim)
  - `PRIV` responde `OK`? (aqui: sim)
  - pode-se mudar de nick? (aqui: não)
  - formato do nick e códigos de erro (400/401/404/408/409/413/422)
- [ ] Combinar a porta e o formato da descoberta UDP (aqui: UDP 5001, `DISCOVER` → `SERVER {port,name,users}`).
- [ ] Se outros grupos também fizerem a opção A, alinhar o formato dos frames
      (aqui: cabeçalho JSON `FILE_CHUNK` + 4 bytes big-endian + dados) e o uso de SHA-256.
- [ ] Testar o nosso cliente com o servidor deles e vice-versa (há `nc` para testes rápidos).

## Possíveis melhorias (fora do enunciado)
- [ ] Aceitar/recusar ficheiros recebidos (`/accept`, `/reject`) em vez de aceitar sempre.
- [ ] Outras extensões do M6: B (TLS com `ssl`), C (salas `/join` `/leave`), D (nó supervisor).
