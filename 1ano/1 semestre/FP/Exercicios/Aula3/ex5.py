def maximo(v1, v2):
	if v1>v2:
		return v1
	elif v2>v1:
		return v2
	else:
		return f'os valores {v1} e {v2} são iguais'

if __name__ == '__main__':
	v1,v2 = int(input('valor 1:')), int(input('valor 2:'))
	print(maximo(v1,v2))