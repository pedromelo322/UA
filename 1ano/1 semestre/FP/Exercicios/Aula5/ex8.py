def evenThenOdd(w):
	wi = ''
	wp = ''
	for i in range(len(w)):
		if i%2 == 0:
			wp += w[i]
		else:
			wi += w[i]

	return wp + wi

def removeAdjacentDuplicates(w):
   nw = ''
   for i in range(len(w)):
      if i == len(w)-1 or w[i] != w[i+1]:
         nw += w[i]
   return nw

#Por acabar ######


if __name__ == '__main__':
	string = 'abcd'
	print(evenThenOdd(string))