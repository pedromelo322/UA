def maximo(v1, v2, v3):
	max = -np.inf
	lista = [v1,v2,v3]
	if v1 == v2 and v1 == v3:
		return 'os valores são todos iguais'
	for i in lista:
		if i > max:
			max = i
	return f'o maior número é o número {max}'


if __name__ == '__main__':
	import numpy as np
	v1,v2,v3 = int(input('valor 1:')), int(input('valor 2:')), int(input('valor 3:'))
	print(maximo(v1,v2, v3))