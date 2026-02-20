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

#ifndef BYTE_STREAM_H
#define BYTE_STREAM_H

#include <fstream>
#include <cstdint>

const int BYTE_STREAM_BUF_SIZE = 65536;
const bool STREAM_READ = true;
const bool STREAM_WRITE = false;

class ByteStream {
  private:
	uint8_t			m_buf[BYTE_STREAM_BUF_SIZE];
	uint8_t*		m_buf_ptr;
	uint8_t*		m_buf_limit;
	int				m_size;
	bool			m_rw_status { STREAM_READ };
	off_t			m_tell { };
	std::fstream&	m_fs;

  public:
	ByteStream(std::fstream& fs, bool rw_status);

	ByteStream() = delete;
	ByteStream(const ByteStream&) = delete;
	ByteStream(ByteStream&&) = delete;
	ByteStream& operator=(ByteStream&&) = delete;
	ByteStream& operator=(const ByteStream&) = delete;

	void put(int c);
	int get();
	void flush();
	off_t tell();
	void close();
};

#endif

