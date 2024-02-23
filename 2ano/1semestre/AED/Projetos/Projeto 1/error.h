#ifndef _ERROR_H_
#define _ERROR_H_

// This defines a function similar to gnulib's error().
// THIS is a FIX to avoid portability problems

// The calling program should set this global variable to the program name,
// like this (or similar):
//   program_name = argv[0];
extern char *program_name;

void error(int status, int errnum, const char *message, ...);

#endif
