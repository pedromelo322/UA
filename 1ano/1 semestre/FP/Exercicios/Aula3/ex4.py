def polinomio(x):
	return x^2 + 2*x +3

if __name__ == '__main__':
	for i in range(3):
		print(polinomio(i))
	print(polinomio(polinomio(1)))