def ispalindrome(w):
	nw = ''
	for i in range(len(w)):
		nw += w[len(w)-(1+i)]
	if nw == w:
		return True
	else:
		return False


if __name__ == '__main__':
	string = input('palavra: ')
	print(ispalindrome(string))