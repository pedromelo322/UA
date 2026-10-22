# Protocolo do chat (versão M6 — com transferência de ficheiros)

## Transporte
- TCP, porta por omissão **5000**.
- Cada mensagem é **um objeto JSON numa linha**, codificado em **UTF-8** e terminado por `\n` (0x0A).
  O JSON não pode conter `\n` literal (o `json.dumps` escapa-o como `\n`).
- O recetor acumula bytes até encontrar `\n`; um `recv()` pode trazer meia mensagem ou várias.
- Linhas vazias são ignoradas. Campos desconhecidos são ignorados.
- Tamanho máximo de uma linha: **64 KiB** (sem contar o `\n`).

## Descoberta (UDP)
- O servidor escuta em **UDP 5001** (todas as interfaces).
- O cliente envia em broadcast para `255.255.255.255:5001` um datagrama com o JSON
  `{"type":"DISCOVER"}` (sem `\n` obrigatório; cada datagrama é uma mensagem).
- Cada servidor responde **em unicast** para o endereço/porta de origem:
  `{"type":"SERVER","port":5000,"name":"pc-ana","users":3}`
  - `port` (int, obrigatório): porta TCP do chat; o IP é o de origem do datagrama.
  - `name` (string) e `users` (int, nº de nicks registados) são informativos.
- O cliente espera respostas durante ~1 s. Datagramas que não sejam `DISCOVER`
  são ignorados pelo servidor, sem resposta.
- O broadcast só chega à rede local (não passa routers) e a firewall tem de
  deixar entrar UDP 5001 no servidor.

## Mensagens cliente → servidor

| Tipo | Campos | Resposta |
|---|---|---|
| `NICK` | `nick` (string) | `OK` ao cliente e `EVENT "<nick> joined"` a todos; ou `ERROR` 400/409/422 |
| `MSG`  | `text` (string) | `CHAT` com `private:false` para **todos, incluindo o remetente** (não há `OK`) |
| `PRIV` | `to`, `text` (strings) | `CHAT` com `private:true` só para o destino + `OK` ao remetente; ou `ERROR` 404 |
| `LIST` | — | `USERS` com a lista de nicks ordenada |
| `QUIT` | — | `OK`; o servidor fecha a ligação e envia `EVENT "<nick> left"` aos restantes |

- `NICK` tem de ser a **primeira** mensagem. Qualquer outro pedido (exceto `QUIT`) antes dele → `ERROR 401`.
- Nick válido: 1–16 caracteres de `[A-Za-z0-9_-]`, único (sensível a maiúsculas).
- Não é possível mudar de nick: um segundo `NICK` → `ERROR 400 "already registered"`.
- Fechar a ligação sem `QUIT` tem o mesmo efeito que `QUIT` (os outros recebem `left`).

`FILE_OFFER`, `FILE_CHUNK` e `FILE_END` estão descritos em [Transferência de ficheiros](#transferência-de-ficheiros-m6-extensão-a).

## Mensagens servidor → cliente

| Tipo | Campos | Significado |
|---|---|---|
| `OK` | (`id` nas transferências) | Último pedido aceite (`NICK`, `PRIV`, `QUIT`, `FILE_OFFER`, `FILE_END`) |
| `CHAT` | `from`, `text`, `private` (bool) | Mensagem para mostrar |
| `USERS` | `nicks` (lista de strings) | Resposta a `LIST` |
| `EVENT` | `text` | Avisos de entrada/saída |
| `ERROR` | `code` (int), `reason` (string) | Pedido recusado |

## Códigos de erro

| Código | `reason` | Quando |
|---|---|---|
| 400 | `bad json` / `unknown type` / `missing ...` / `already registered` | Linha não é um objeto JSON, `type` desconhecido, campo em falta ou de tipo errado, segundo `NICK` |
| 401 | `NICK required` | Pedido antes de `NICK` |
| 404 | `no such user` | `PRIV` para um nick que não está ligado |
| 409 | `nick taken` | Nick já em uso |
| 422 | `invalid nick` | Nick fora do formato |
| 408 | `idle timeout` | Nada recebido do cliente durante o idle timeout (300 s por omissão) |
| 413 | `line too long` | Linha acima de 64 KiB |

Os erros 4xx de pedido (400, 401, 404, 409, 422) **não** fecham a ligação.
Os 408 e 413 são seguidos do fecho da ligação pelo servidor (depois de 413
não é possível voltar a encontrar o início da próxima mensagem).

## Comportamento do servidor
- **Encerramento** (Ctrl+C): o servidor envia `{"type":"EVENT","text":"server shutting down"}`
  a todos e fecha as ligações.
- **Clientes lentos**: cada cliente tem uma fila de envio limitada (1000 mensagens).
  Se encher, porque o cliente não lê o que recebe, o servidor fecha essa ligação
  sem aviso, para não atrasar os restantes. Os outros recebem `EVENT "<nick> left"`.
- Ligações que caem sem `QUIT` (FIN ou RST) são tratadas como `QUIT`.

## Transferência de ficheiros (M6, extensão A)

### Frame binário
Uma linha JSON com `"type":"FILE_CHUNK"` é **sempre** seguida de um frame binário
com prefixo de comprimento. Os bytes do ficheiro nunca passam por JSON.

```
{"type":"FILE_CHUNK","id":"9f2c"}\n   <- linha JSON normal
+----------------------+------------------------+
| comprimento N        | N bytes do ficheiro    |
| 4 bytes, big-endian  | (em bruto, qualquer    |
| sem sinal ("!I")     |  valor, incluindo \n)  |
+----------------------+------------------------+
```
- N ≤ **64 KiB** (o cliente usa 32 KiB). Frame maior → `ERROR 413 "frame too large"` e fecho.
- O frame segue o cabeçalho mesmo que o pedido seja recusado (ex. 401), para o
  recetor não perder a sincronização. Se o cabeçalho não for JSON válido, o fluxo
  fica dessincronizado — por isso o emissor deve gerar sempre JSON válido.

### Mensagens

| Direção | Mensagem | Campos | Notas |
|---|---|---|---|
| C→S | `FILE_OFFER` | `to`, `id`, `name`, `size` | `id`: string 1–64 chars escolhida pelo remetente (única por remetente). `size` em bytes |
| S→C (destino) | `FILE_OFFER` | `from`, `id`, `name`, `size` | Aceite automaticamente pelo cliente |
| C→S | `FILE_CHUNK` + frame | `id` | Enviar só depois do `OK` ao `FILE_OFFER` |
| S→C (destino) | `FILE_CHUNK` + frame | `from`, `id` | |
| C→S | `FILE_END` | `id`, `sha256` | SHA-256 do ficheiro em hexadecimal (minúsculas) |
| S→C (destino) | `FILE_END` | `from`, `id`, `sha256` | O destino verifica tamanho e hash |
| S→C | `FILE_ABORT` | `from` **ou** `to`, `id`, `reason` | `from`: o remetente desistiu/saiu (para o destino). `to`: o destino saiu (para o remetente) |

Respostas ao remetente: `{"type":"OK","id":...}` ao `FILE_OFFER` aceite e ao
`FILE_END`. Os `ERROR` relativos a uma transferência levam também o campo `id`.
Não há resposta por cada `FILE_CHUNK` (só em caso de erro).

### Erros

| Código | `reason` | Quando |
|---|---|---|
| 400 | `bad FILE_OFFER` | Campos em falta/de tipo errado, `size` < 0 |
| 400 | `duplicate transfer id` | `id` já em uso por este remetente |
| 400 | `unknown transfer` | `FILE_CHUNK`/`FILE_END` com `id` desconhecido (ou já cancelado) |
| 400 | `size mismatch or missing sha256` | `FILE_END` antes de enviar `size` bytes; o destino recebe `FILE_ABORT` |
| 404 | `no such user` | Destino não ligado |
| 413 | `file too large` | `size` acima do limite do servidor (100 MB por omissão) |
| 413 | `more data than announced` | Chunks somam mais que `size`; o destino recebe `FILE_ABORT` |

### Regras
- O servidor **não guarda ficheiros**: reencaminha cada chunk. Se a fila do destino
  estiver cheia, deixa de ler do remetente até haver espaço (backpressure via TCP);
  ao fim de 10 s sem espaço, o destino é desligado como cliente lento.
- Mensagens de chat podem ser intercaladas com chunks na mesma ligação.
- Se uma das pontas sair a meio, a outra recebe `FILE_ABORT`.
- O destino grava em `<nome>.part`, verifica tamanho e SHA-256 no `FILE_END`, e só
  então renomeia; caso contrário apaga. O nome recebido é reduzido ao nome base
  (sem diretórios) antes de ser usado.

### Exemplo
```
ana> {"type":"FILE_OFFER","to":"rui","id":"9f2c","name":"foto.png","size":40000}
S>ana {"type":"OK","id":"9f2c"}
S>rui {"type":"FILE_OFFER","from":"ana","id":"9f2c","name":"foto.png","size":40000}
ana> {"type":"FILE_CHUNK","id":"9f2c"}\n <00 00 80 00> <32768 bytes>
S>rui {"type":"FILE_CHUNK","from":"ana","id":"9f2c"}\n <00 00 80 00> <32768 bytes>
ana> {"type":"FILE_CHUNK","id":"9f2c"}\n <00 00 1c 40> <7232 bytes>
S>rui {"type":"FILE_CHUNK","from":"ana","id":"9f2c"}\n <00 00 1c 40> <7232 bytes>
ana> {"type":"FILE_END","id":"9f2c","sha256":"3a7bd3e2..."}
S>rui {"type":"FILE_END","from":"ana","id":"9f2c","sha256":"3a7bd3e2..."}
S>ana {"type":"OK","id":"9f2c"}
```

## Exemplo de sessão
(`C>` cliente ana, `S>` servidor; rui já está ligado)
```
C> {"type":"NICK","nick":"rui"}
S> {"type":"ERROR","code":409,"reason":"nick taken"}
C> {"type":"NICK","nick":"ana"}
S> {"type":"OK"}
S> {"type":"EVENT","text":"ana joined"}
C> {"type":"LIST"}
S> {"type":"USERS","nicks":["ana","rui"]}
C> {"type":"MSG","text":"olá"}
S> {"type":"CHAT","from":"ana","text":"olá","private":false}
C> {"type":"PRIV","to":"rui","text":"psst"}
S> {"type":"OK"}
C> {"type":"PRIV","to":"zé","text":"?"}
S> {"type":"ERROR","code":404,"reason":"no such user"}
C> {"type":"QUIT"}
S> {"type":"OK"}
   (ligação fechada; rui recebe {"type":"EVENT","text":"ana left"})
```
