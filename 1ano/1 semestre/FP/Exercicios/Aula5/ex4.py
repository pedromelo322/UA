def allMatches(lst):
	lstt = []
	for e in lst:
		for el in lst:
			if e != el:
				tupla = (e, el)
				lstt.append(tupla)
	return lstt






if __name__ == '__main__':
	lst = ["FCP", "SCP", "SLB"]
	print(allMatches(lst))
