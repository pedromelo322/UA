#!/usr/bin/env python3
"""Gera a versao so-perguntas a partir da versao resolvida.
Remove tudo entre os marcadores <!--ANS--> e <!--/ANS--> (inclusive).
Uso: python3 strip_answers.py ASE_exame_resolvido.md ASE_exame_pratica.md
"""
import sys

src, dst = sys.argv[1], sys.argv[2]
out, skip = [], False
with open(src, encoding="utf-8") as f:
    for line in f:
        s = line.strip()
        if s == "<!--ANS-->":
            skip = True
            continue
        if s == "<!--/ANS-->":
            skip = False
            continue
        if not skip:
            out.append(line)

# colapsa multiplas linhas em branco resultantes
clean, blank = [], False
for line in out:
    if line.strip() == "":
        if blank:
            continue
        blank = True
    else:
        blank = False
    clean.append(line)

text = "".join(clean)
text = text.replace("Banco de perguntas por secção (com resoluções)",
                    "Banco de perguntas por secção (simulação de exame)")

with open(dst, "w", encoding="utf-8") as f:
    f.write(text)
print(f"Escrito {dst}")
