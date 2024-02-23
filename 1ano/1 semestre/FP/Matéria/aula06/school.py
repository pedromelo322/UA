import pandas as pd
# Complete o programa!

# a)
def loadFile(fname, lst):
    count = 0
    csvreader = pd.read_csv(fname)
    for e in csvreader:
        for el in csvreader[e]:
            el = el.split('\t')
            lst.append((el[0],el[1],el[5],el[6],el[7]))
    return lst

# b) Crie a função notaFinal aqui...
def NotaFinal(reg):
    lst = []
    for e in reg:
        nota = (float(e[2]) + float(e[3]) + float(e[4]))/3
        nota = round(nota,2)
        lst.append((e[0],e[1],nota))
    return lst

# c) Crie a função printPauta aqui...
def printPauta(lst):
    valor = "{}{:^59}{}".format("Numero","Nome","Nota")
    for e in lst:
        valor += "\n"
        if len(e[0]) == 5:
            valor += "{}{:^60}{}".format(e[0],e[1],e[2])
        else:
            valor += "{}{:^61}{:>}".format(e[0],e[1],e[2])
    valor += '\n'
    valor += '-'*70
    return(valor)

def guardar(valor):
    with open("pauta.txt", "w") as f:
        f.write(valor)


# d)
def main():
    lst = []
    # ler os ficheiros
    valor1 = printPauta(NotaFinal(loadFile("school1.csv", lst)))
    valor2 = printPauta(NotaFinal(loadFile("school2.csv", lst)))
    valor3 = printPauta(NotaFinal(loadFile("school3.csv", lst)))
    
    # ordenar a lista
    valor = valor1 + '\n' + valor2 + '\n'  + valor3
    guardar(valor)
    
    # mostrar a pauta
    ...


# Call main function
if __name__ == "__main__":
    main()


