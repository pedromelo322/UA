CXX = g++
CXXFLAGS = -Wall -ggdb -pthread

TARGETS = bb-unsafe bb-safe ex2a ex3

HEADERS = fifo.h process.h utils.h dbc.h

OBJS = process.o utils.o

.PHONY:	all clean cleanall

all: $(TARGETS)

bb-unsafe: main.o fifo-unsafe.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ main.o fifo-unsafe.o $(OBJS) $(CXXFLAGS)

bb-safe: main.o fifo-sem-safe.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ main.o fifo-sem-safe.o $(OBJS) $(CXXFLAGS)

ex2a: ex2a.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ ex2a.o $(OBJS) $(CXXFLAGS)

ex3: ex3.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ ex3.o $(OBJS) $(CXXFLAGS)


clean:
	rm -f *.o

cleanall:	clean
	rm -f $(TARGETS) 
