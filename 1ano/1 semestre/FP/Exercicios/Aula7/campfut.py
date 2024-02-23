def mkteam():
	lst = list()
	ne = int(input('Número de equipas: '))
	for i in range(ne):
		lst.append(input(f'Nome da equipa {i+1}: '))

if __name__ == '__main__':
	mkteam()