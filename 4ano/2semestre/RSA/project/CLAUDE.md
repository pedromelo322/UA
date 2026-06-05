# Relatório do Projeto — Cooperative Lane Merge via V2V

## Âmbito desta diretoria

Esta diretoria (`RSA/project/`) é o **espaço de escrita do relatório** do projeto de
Redes e Sistemas Autónomos. A minha responsabilidade aqui é **produzir e manter o
relatório**, não alterar o código do projeto.

- O **código** vive em `merge_lane/` e tem o seu próprio `merge_lane/CLAUDE.md` com a
  descrição completa da arquitetura, do protocolo e da estrutura do código. **Lê esse
  ficheiro para contexto técnico** — mas confirma sempre no código, porque tem pequenas
  imprecisões (ver "Notas de fidelidade" abaixo).
- O **relatório** vive em `relatorio/`.

## Estrutura da diretoria

```
RSA/project/
├── CLAUDE.md                 # ESTE ficheiro — contexto do relatório
├── relatorio/                # ← o relatório (a minha responsabilidade)
│   ├── relatorio.tex         # documento principal (LaTeX)
│   ├── referencias.bib
│   └── figuras/              # 4 diagramas + (futuramente) screenshots da dashboard
├── diagramas/                # fontes dos diagramas (.png + .xml drawio editável)
│   ├── MERGE_LANE_ARCH.png        # arquitetura em camadas
│   ├── SCENARIO1_SEQ_DIAGRAM.png  # diagrama de sequência (caso B em conflito)
│   ├── mc_state_machine.png       # máquina de estados do Merge Car
│   └── MAIN_ROAD_STATES.png       # máquina de estados do veículo da estrada
├── merge_lane/               # CÓDIGO do projeto (ver merge_lane/CLAUDE.md)
├── RSA_Proposta.pdf          # proposta inicial (ainda usa ACK; histórico)
├── MERGE_LANE_FINAL.pdf      # slides da apresentação final
├── vehicular.pdf             # material de apoio (C-ITS)
└── What is NAP-Vanetza.pdf   # material de apoio (Vanetza-NAP)
```

## Decisões fixas do relatório

- **Formato:** LaTeX. **Compilar sempre com `latexmk`** (`latexmk -pdf -interaction=nonstopmode relatorio.tex`), nunca `pdflatex` direto.
- **Autor:** Pedro Melo (n.º 114208). Idioma: **Português**.
- **Implementação** é a secção central e deve ser **muito detalhada** (funções, fórmulas,
  cálculos, pseudo-código, fluxo de mensagens) — é o requisito "very important".

## Requisitos da entrega (elearning, até 9 Jun)

Objetivos · Arquitetura · Implementação (deep) · Fluxo da demo · Resultados · link do
repositório · link do vídeo. Herda os requisitos da apresentação: diagramas com nº de
veículos/RSUs/mensagens, diagrama de sequência do protocolo, estratégia + cálculos +
pseudo-código do algoritmo, timeline da demo (ponto de partida, mensagens trocadas,
decisões, fim, aleatoriedade/variáveis), e demo ao vivo (vídeo de backup).

## Estado atual

`relatorio/relatorio.tex` compila sem erros com `latexmk`. As 4 figuras estão inseridas.
Progresso por secção:
- [x] Capa + **1. Introdução** (redigida).
- [x] **2. Objetivos** (problema, objetivo geral, objetivos específicos O1–O7, tabela
      objetivo$\rightarrow$mecanismo `tab:objetivos`).
- [ ] **3. Arquitetura** — *próximo passo sugerido* (curta; fixa vocabulário para a Implementação).
- [ ] **4. Implementação** (a mais detalhada).
- [ ] **5. Fluxo da demo** · [ ] **6. Resultados** · [ ] **7. Conclusão**.

Secções por preencher continuam como placeholders `\todo{...}`.

Falta obter do utilizador: **link do repo**, **link do vídeo**, **screenshots da
dashboard** dos 6 cenários (para Resultados).

## Notas de fidelidade (código vs documentação)

Ao escrever, prefiro o que está no **código** a `merge_lane/CLAUDE.md`/`README.md`.
Imprecisões já confirmadas a evitar repetir: ver as "Notas de fidelidade" e os factos/
fórmulas verificados no **ficheiro de plano**
`~/.claude/plans/preciso-de-ajuda-a-iterative-hartmanis.md` — contém a estrutura completa
do relatório, as constantes reais (`geo.py`/`protocol.py`) e as correções código-vs-docs.
Em caso de dúvida, confirmar sempre no código (`merge_lane/vehicle/*.py`).
