def Feb(n):
	if n == 0:
		return 0
	elif n == 1:
		return 1
	else:
		return Feb(n-1) + Feb(n-2)



#n = int(input('Número: '))
n = 40

count = 0
while count != n+1:
	print(Feb(count),f'-----{count}')
	count += 1
