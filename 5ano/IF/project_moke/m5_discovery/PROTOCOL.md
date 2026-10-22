# Protocolo do chat (versão M5)

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

## Mensagens servidor → cliente

| Tipo | Campos | Significado |
|---|---|---|
| `OK` | — | Último pedido aceite (`NICK`, `PRIV`, `QUIT`) |
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
