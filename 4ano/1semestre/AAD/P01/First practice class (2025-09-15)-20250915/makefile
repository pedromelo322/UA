#
# makefile for the practical class AAD_P01
#
# if you have gfortran, please remove the # near the end of the line that starts with run_all:
# you may also replace cc by clang if you have the clang compiler installed in your system
#
# do
#   make run_all
# at least three times and record the best time of each program in the shared spreadsheet
#

clean:
	rm -f a.out MandelbrotCountC0 MandelbrotCountC2 MandelbrotCount.class MandelbrotCountF2
	rm -f MandelbrotCount.html MandelbrotCount.js MandelbrotCount.wasm
	rm -f a.out MandelbrotSet.pgm MandelbrotSet.png


MandelbrotCountC0:	MandelbrotCount.c
	cc -Wall -O0 MandelbrotCount.c -o MandelbrotCountC0

MandelbrotCountC2:	MandelbrotCount.c
	cc -Wall -O2 MandelbrotCount.c -o MandelbrotCountC2

MandelbrotCount.class:	MandelbrotCount.java
	javac MandelbrotCount.java

MandelbrotCountF2:	MandelbrotCount.f90
	gfortran -Wall -O2 MandelbrotCount.f90 -o MandelbrotCountF2


run_all:		MandelbrotCountC0 MandelbrotCountC2 MandelbrotCount.class MandelbrotCount.py MandelbrotCountF2
	@set -e ; \
	if [ -x ./MandelbrotCountC0     ]; then echo -n "MandelbrotCountC0     " ; ./MandelbrotCountC0 ;        fi ; \
	if [ -x ./MandelbrotCountC2     ]; then echo -n "MandelbrotCountC2     " ; ./MandelbrotCountC2 ;        fi ; \
	if [ -e ./MandelbrotCount.class ]; then echo -n "MandelbrotCount.class " ; java MandelbrotCount ;       fi ; \
	if [ -e ./MandelbrotCount.py    ]; then echo -n "MandelbrotCount.py    " ; python3 MandelbrotCount.py ; fi ; \
	if [ -x ./MandelbrotCountF2     ]; then echo -n "MandelbrotCountF2     " ; ./MandelbrotCountF2 ;        fi ; \
	echo "Done!"


WebAssembly:			MandelbrotCount.c
	emcc -Wall -O2 MandelbrotCount.c -o MandelbrotCount.html

MandelbrotSet.png:		MandelbrotImage.c
	cc -Wall -O2 MandelbrotImage.c -o a.out
	./a.out
	convert MandelbrotSet.pgm MandelbrotSet.png
	rm -f a.out
