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

#include "byte_stream.h"

using namespace std;

//-------------------------------------------------------------------------------------------

ByteStream::ByteStream(fstream& fs, bool rw_status) : m_rw_status { rw_status }, m_fs { fs } {
	m_buf_limit = m_buf + BYTE_STREAM_BUF_SIZE;
	if(m_rw_status) { // Open for reading
		m_buf_ptr = m_buf_limit;
		m_size = BYTE_STREAM_BUF_SIZE;
	}

	else // Open for writing
		m_buf_ptr = m_buf;
}

//---------------------------------------------------------------------------------
//
// m_buf_ptr points to the next free buffer position
//
void ByteStream::put(int c) {
	*m_buf_ptr++ = c;
	m_tell++;

	if(m_buf_ptr == m_buf_limit) { // buffer is full: write it
		m_fs.write((char*)m_buf, BYTE_STREAM_BUF_SIZE);
		m_buf_ptr = m_buf;
	}
}

//---------------------------------------------------------------------------------
//
// m_buf_ptr points to the next buffer char
//
int ByteStream::get() {
	if(m_buf_ptr == m_buf_limit) { // buffer is empty: get another block
		m_fs.read((char*)m_buf, BYTE_STREAM_BUF_SIZE);
		if((m_size = m_fs.gcount()) == 0)
			return EOF;

		m_buf_ptr = m_buf;
	} else {
		if(m_buf_ptr - m_buf == m_size)
			return EOF;
	}

	m_tell++;
	return *m_buf_ptr++;
}

//---------------------------------------------------------------------------------
//
// m_buf_ptr points to a free buffer position
//
void ByteStream::flush() {
	size_t n_bytes_to_write = m_buf_ptr - m_buf;

	if(n_bytes_to_write != 0) { // If buf is not empty
		m_fs.write((char*)m_buf, n_bytes_to_write);
		m_buf_ptr = m_buf;
	}
}

//---------------------------------------------------------------------------------

off_t ByteStream::tell() {
	return m_tell;
}

//---------------------------------------------------------------------------------

void ByteStream::close() {
	if(not m_rw_status)
		this->flush();

	m_fs.close();
}

//---------------------------------------------------------------------------------

