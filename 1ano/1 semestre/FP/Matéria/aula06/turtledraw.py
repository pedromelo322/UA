# Exercise 5 on "How to think like a computer scientist", ch. 11.

import turtle

t = turtle.Turtle()

# Use t.up(), t.down() and t.goto(x, y)

# Put your code here
with open('drawing.txt') as f:
	lines = f.readlines()

for e in lines:
	e = e.split()
	#comando = e[0]
	if e[0] == 'UP':
		t.up()
	elif e[0] == 'DOWN':
		t.down()
	else:
		t.goto(int(e[0]),int(e[1]))

# wait
turtle.Screen().exitonclick()

