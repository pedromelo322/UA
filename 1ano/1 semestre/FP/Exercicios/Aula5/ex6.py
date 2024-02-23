def shorten(str):
	nstr = ''
	for e in str:
		if e.isupper() == True:
			nstr += e
	return nstr

if __name__ == '__main__':
	string = input('Nome: ')
	print(shorten(string))