def inputFloatList():
	lista = []
	while True:
		try:
			v = int(input('Valor: '))
			lista.append(v)
		except:
			break
	return lista

def countLower(lst,v):
	count = 0
	for e in lst:
		if e < v:
			count += 1
	return count

def minmax(lst):
	max_n = lst[0]
	min_n = lst[0]

	for e in lst:
		if e > max_n:
			max_n = e
		elif e < min_n:
			min_n = e

	return (max_n+min_n)/2

if __name__ == '__main__':
	lst = inputFloatList()
	v = minmax(lst)
	count = countLower(lst,v)
	print(count)

