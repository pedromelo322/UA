def countDigits(string):
	count = 0
	for e in string:
		if e.isdigit() == True:
			count += 1
	return count

if __name__ == '__main__':
	string = input('String: ')
	print(countDigits(string))