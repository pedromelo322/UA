from tkinter import filedialog

def main():
    # 1) Pedir nome do ficheiro (experimente cada alternativa):
    #name = input("File? ")                                  #A
    name = 'nums.txt'
    #name = filedialog.askopenfilename(title="Choose File") #B
    
    # 2) Calcular soma dos números no ficheiro:
    total = fileSum(name)
    
    # 3) Mostrar a soma:
    print("Sum:", total)


def fileSum(filename):
    # Complete a função para ler números do ficheiro e devolver a sua soma.
    s = 0
    with open(filename) as f:
        lines = f.readlines()
    for e in lines:
        e = e.split('\n')
        i = e[0]
        s += float(i)
    return s



if __name__ == "__main__":
    main()

