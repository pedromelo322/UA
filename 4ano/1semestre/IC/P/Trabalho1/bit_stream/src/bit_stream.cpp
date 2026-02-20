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

#include <cstdint>
#include <fstream>
#include <string>
#include "bit_stream.h"

using namespace std;

BitStream::BitStream(fstream& fs, bool rw_status) : m_rw_status { rw_status },
  m_byte_stream { fs, rw_status } {
	if(rw_status) {
		m_bit_ptr = -1;
	} else {
		m_bit_ptr = 7;
		m_buf = 0;
	}
}

int BitStream::read_bit() {
	if(--m_bit_ptr < 0) {
		if((m_buf = m_byte_stream.get()) == EOF)
			return EOF;

		m_bit_ptr = 7;
	}

	return (m_buf & (0x01 << m_bit_ptr)) >> m_bit_ptr;
}

uint64_t BitStream::read_n_bits(int n) {
	uint64_t x { };
	for(int i = 0 ; i < n ; ++i) {
		x <<= 1;
		x |= read_bit();
	}

	return x;
}

string BitStream::read_string() {
	int c;
	string s;

	while((c = read_n_bits(8)) != '\n')
		s += c;

	return s;
}

void BitStream::write_bit(int bit) {
	if(m_bit_ptr < 0) {
		m_byte_stream.put(m_buf);
		m_bit_ptr = 7;
		m_buf = 0;
	}

	m_buf |= (bit & 0x01) << m_bit_ptr--;
}

void BitStream::write_n_bits(uint64_t bits, int n) {
	for(int i = n - 1 ; i >= 0 ; i--)
		write_bit(((0x01 << i) & bits) >> i);
}

void BitStream::write_string(const string& s) {
	for(const char c : s)
		write_n_bits(c, 8);

	write_n_bits('\n', 8); // Mark the end of the string with a newline
}

off_t BitStream::tell() {
	return m_byte_stream.tell();
}

void BitStream::close() {
	if(not m_rw_status) {
		if(m_bit_ptr != 7) // Flush the bit buffer only if there are some bits there
			m_byte_stream.put(m_buf);
	}

	m_byte_stream.close(); // Calls byte_stream flush if needed
}

