//------------------------------------------------------------------------------
//
// Copyright 2025 University of Aveiro, Portugal, All Rights Reserved.
//
// These programs are supplied free of charge for research purposes only,
// and may not be sold or incorporated into any commercial product. There is
// ABSOLUTELY NO WARRANTY of any sort, nor any undertaking that they are
// fit for ANY PURPOSE WHATSOEVER. Use them at your own risk. If you do
// happen to find a bug, or have modifications to suggest, please report
// the same to Armando J. Pinho, ap@ua.pt. The copyright notice above
// and this statement of conditions must remain an integral part of each
// and every copy made of these files.
//
// Armando J. Pinho (ap@ua.pt)
// IEETA / DETI / University of Aveiro
//
//------------------------------------------------------------------------------
//
#include <iostream>
#include <fstream>
#include "bit_stream.h"

using namespace std;

//------------------------------------------------------------------------------

int main(int argc, char* argv[]) {

	if(argc < 3) {
		cerr << "Usage: text2bin text_file bin_file\n";
		return 1;
	}

	fstream ifs { argv[argc-2], ios::in | ios::binary };
	if(not ifs.is_open()) {
		cerr << "Error opening text file " << argv[argc-2] << endl;
		return 1;
	}

	fstream ofs { argv[argc-1], ios::out | ios::binary };
	if(not ofs.is_open()) {
		cerr << "Error opening bin file " << argv[argc-1] << endl;
		return 1;
	}

	BitStream obs { ofs, STREAM_WRITE };

	char c;
	while(ifs.get(c)) {
		switch(c) {
			case '0':
				obs.write_bit(0);
				break;
			case '1':
				obs.write_bit(1);
				break;
			case '\n':
				break;
			default:
				cerr << "Error: found invalid char\n";
				return 1;
		}
	}

	obs.close();

	return 0;
}

