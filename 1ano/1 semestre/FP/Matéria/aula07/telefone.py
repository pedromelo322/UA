# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {}".format("Numero", "Nome"))
    for num in dic:
        print("{:>12s} : {}".format(num, dic[num]))

def addContact(dic):
    dic[str(input('Número: '))] = str(input('Nome: '))
    return dic

def rmvContact(dic):
    dic.pop(input('Número'))
    print(dic)

def findNumber(dic):
    num = input('Número: ')
    print(dic.get(num, num))

def addMorada(dic):
    num = input('Número: ')
    if 


def filterPartName(dic):
    d = dict()
    partName = input('Parte do Nome:').lower()
    for e in dic:
        v = dic[e].lower()
        if partName in v:
            d[e] = dic[e]
    print(d)



def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("Adicionar (M)orada")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": "Universidade de Aveiro",
        "727392822": "Cristiano Aveiro",
        "387719992": "Maria Matos",
        "887555987": "Marta Maia",
        "876111333": "Carlos Martins",
        "433162999": "Ana Bacalhau"
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            contactos = addContact(contactos)

        elif op == "R":
            contactos = rmvContact(contactos)

        elif op == "N":
            findNumber(contactos)

        elif op == "P":
            filterPartName(contactos)

        elif op == "M":
            addMorada(contactos)

        else:
            print("Não implementado!")
    

# O programa começa aqui
main()

