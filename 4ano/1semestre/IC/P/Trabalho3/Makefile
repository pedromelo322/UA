CXX = g++
CXXFLAGS = -std=c++17 -O3 -Wall -march=native -flto
LDFLAGS = -pthread -flto

TARGETS = bin/01_extract_header bin/02_calc_global bin/03_analyze_split bin/encoder bin/decoder

all: | build output bin $(TARGETS)

build:
	mkdir -p build

output:
	mkdir -p output

bin:
	mkdir -p bin

bin/01_extract_header: src/01_extract_header.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

bin/02_calc_global: src/02_calc_global.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

bin/03_analyze_split: src/03_analyze_split.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

bin/encoder: src/encoder.cpp
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $<

bin/decoder: src/decoder.cpp
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $<



clean:
	rm -f $(TARGETS)

.PHONY: all clean build out