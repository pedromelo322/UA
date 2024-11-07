import re

# Caminho do arquivo de entrada e saída
arquivo_entrada = 'log.txt'
arquivo_saida = 'log_limpo.txt'

# Regex para sequências ANSI
ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')

# Ler o arquivo de entrada e remover sequências ANSI
with open(arquivo_entrada, 'r') as entrada, open(arquivo_saida, 'w') as saida:
    for linha in entrada:
        saida.write(ansi_escape.sub('', linha))

print("As sequências ANSI foram removidas. Verifique o arquivo 'arquivo_limpo.txt'.")
