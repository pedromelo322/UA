//-------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------

#ifndef BIT_STREAM_H
#define BIT_STREAM_H

#include <string>
#include <fstream>
#include "byte_stream.h"

class BitStream {
  private:
	bool		m_rw_status { STREAM_READ };
	int			m_buf;
	int			m_bit_ptr;
	ByteStream	m_byte_stream;

  public:
	BitStream(std::fstream& fs, bool rw_status);

	BitStream() = delete;
	BitStream(const BitStream&) = delete;
	BitStream(BitStream&&) = delete;
	BitStream& operator=(BitStream&&) = delete;
	BitStream& operator=(const BitStream&) = delete;

	int read_bit();
	uint64_t read_n_bits(int n);
	std::string read_string();
	void write_bit(int bit);
	void write_n_bits(uint64_t bits, int n);
	void write_string(const std::string& s);
	off_t tell();
	void close();
};

#endif

