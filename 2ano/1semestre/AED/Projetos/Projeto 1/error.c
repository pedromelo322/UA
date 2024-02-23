#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// The calling program should set program_name
// to the name of the executing program.
char *program_name = "PROGRAM";

void error (int status, int errnum, const char *message, ...) {
  fprintf (stderr, "%s: ", program_name);
  va_list args;
  va_start (args, message);
  vfprintf (stderr, message, args);
  va_end (args);
  if (errnum)
    fprintf (stderr, ": %s", strerror(errnum));
  putc ('\n', stderr);
  fflush (stderr);
  if (status)
    exit (status);
}

