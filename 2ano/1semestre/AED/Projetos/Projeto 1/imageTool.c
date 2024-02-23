// imageTool - A simple and versatile image processor.
//
// This program is an example use of the image8bit module,
// a programming project for the course AED, DETI / UA.PT
//
// You may freely use and modify this code, NO WARRANTY, blah blah,
// as long as you give proper credit to the original and subsequent authors.
//
// João Manuel Rodrigues <jmr@ua.pt>
// 2023

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "error.h"
#include <assert.h>

#include "image8bit.h"
#include "instrumentation.h"

static const char* USAGE =
    "USAGE: imageTool [FILE...] [OPERATION [OPERAND...]]\n"
    "  Apply pipeline of image processing operations to PGM files.\n"
    "  Arguments are processed from left to right and may be\n"
    "  FILES, OPERATIONS, or OPERANDS to operations.\n"
    "  Some operations create images, which are appended to an internal buffer:\n"
    "      I0, I1, ..., PRED, CURR\n"
    "  The last image in the buffer is called the current image CURR and its\n"
    "  predecessor is PRED.\n"
    "  Most operations apply to CURR and some also use PRED.\n"
    "\n"
    "FILES:\n"
    "  Currently, only image files in 8-bit raw PGM format are accepted.\n"
    "  Input file names must be distinct from operation names.\n"
    "\n"
    "OPERATIONS:\n"
    "  FILE            Load PGM image file, creating new image\n"
    "  save FILE       Save CURR to PGM file\n"
    "  info            Show information on CURR (size and range)\n"
    "  tic             Reset instrumentation counters and times.\n"
    "  toc             Print instrumentation counters and times.\n"
    "\n"              
    "  neg             Apply photo-negative effect to CURR\n"
    "  thr LEVEL       Apply thresholding to CURR\n"
    "  bri FACTOR      Scale brightness in CURR by FACTOR\n"
    "\n"              
    "  create W,H      Create new black image with WxH pixels\n"
    "  rotate          Rotate CURR 90º counter-clockwise, creating new image\n"
    "  mirror          Mirror CURR left-to-right, creating new image\n"
    "  crop X,Y,W,H    Crop a rectangle from CURR, creating new image\n"
    "\n"              
    "  paste X,Y       Paste PRED into CURR at position (X,Y)\n"
    "  blend X,Y,alpha Blend PRED into CURR at position (X,Y) with given alpha\n"
    "\n"              
    "  locate          Search PRED in CURR, print matching position, or NOTFOUND\n"
    "\n"              
    "  blur DX,DY      blur CURR using (2DX+1)x(2Dy+1) mean filter\n"
    "\n"              
    "OPERANDS:\n"     
    "  X,Y             Pixel coordinates: 0,0 is top left corner\n"
    "  DX,DY           Displacement\n"
    "  W,H             Width and height of image or rectangular region\n"
    "  alpha           Blending factor\n"
    "\n"
    ;

static char* errors[] = {
  "Success",
  "Insufficient operands",
  "Insufficient images",
  "Image buffer is full",
  "Image8bit failure: %s",
  "Invalid operand",
  "Invalid rect (overflow)",
  "Invalid alpha",
};


// This program strives for correctness and robustness.
// You may want to temporarily comment out operand validation, namely
// precondition checks, so that you can force precondition violations, and
// observe the effect of assertions.
//
// Also, the program does not test every module function, but you may easily
// add new operations for that purpose.

int main(int ac, char* av[]) {
  program_name = av[0];
  if (ac <= 1) {
    error(5, 0, "\n%s", USAGE);
  }

  ImageInit();

  int err = 0;
  int x, y, w, h;

  // The image buffer
  const int N = 10;   // buffer capacity
  Image img[N];     // the images
  int n = 0;          // number of images created

  int k = 1;
  while (k < ac) {
    if (strcmp(av[k], "info") == 0) {
      if (n < 1) { err = 2; break; }
      fprintf(stderr, "Info on I%d\n", n-1);
      uint8 min, max;
      w = ImageWidth(img[n-1]);
      h = ImageHeight(img[n-1]);
      uint8 maxval = ImageMaxval(img[n-1]);
      ImageStats(img[n-1], &min, &max);
      printf("# Size: %dx%d\n# Maxval: %hhu\n", w, h, maxval);
      printf("# Gray level range: [%hhu, %hhu]\n", min, max);
    } else if (strcmp(av[k], "tic") == 0) {
      InstrReset();
    } else if (strcmp(av[k], "toc") == 0) {
      InstrPrint();
    } else if (strcmp(av[k], "neg") == 0) {
      if (n < 1) { err = 2; break; }
      fprintf(stderr, "Negating I%d\n", n-1);
      ImageNegative(img[n-1]);
    } else if (strcmp(av[k], "thr") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 1) { err = 2; break; }
      uint8 thr;
      if (sscanf(av[k], "%hhu", &thr) != 1) { err = 5; break; }
      fprintf(stderr, "Thresholding I%d at %d\n", n-1, thr);
      ImageThreshold(img[n-1], (uint8)thr);
    } else if (strcmp(av[k], "bri") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 1) { err = 2; break; }
      double factor;
      if (sscanf(av[k], "%lf", &factor) != 1) { err = 5; break; }
      fprintf(stderr, "Brightening I%d by %lf\n", n-1, factor);
      ImageBrighten(img[n-1], factor);
    } else if (strcmp(av[k], "create") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n >= N) { err = 3; break; }
      if (sscanf(av[k], "%d,%d", &w, &h) != 2) { err = 5; break; }
      if (w < 0 || h < 0) { err = 5; break; }   // precondition check!
      fprintf(stderr, "Creating black image (%d,%d) -> I%d\n", w, h, n);
      img[n] = ImageCreate(w, h, PixMax);
      if (img[n] == NULL) { err = 4; break; }
      n++;
    } else if (strcmp(av[k], "rotate") == 0) {
      if (n < 1) { err = 2; break; }
      if (n >= N) { err = 3; break; }
      fprintf(stderr, "Rotating I%d -> I%d\n", n-1, n);
      img[n] = ImageRotate(img[n-1]);
      if (img[n] == NULL) { err = 4; break; }
      n++;
    } else if (strcmp(av[k], "mirror") == 0) {
      if (n < 1) { err = 2; break; }
      if (n >= N) { err = 3; break; }
      fprintf(stderr, "Mirroring I%d -> I%d\n", n-1, n);
      img[n] = ImageMirror(img[n-1]);
      if (img[n] == NULL) { err = 4; break; }
      n++;
    } else if (strcmp(av[k], "crop") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 1) { err = 2; break; }
      if (n >= N) { err = 3; break; }
      if (sscanf(av[k], "%d,%d,%d,%d", &x, &y, &w, &h) != 4) { err = 5; break; }
      if (!ImageValidRect(img[n-1], x, y, w, h)) { err = 5; break; }   // precondition check!
      fprintf(stderr, "Cropping I%d (%d,%d,%d,%d) -> I%d\n", n-1, x, y, w, h, n);
      img[n] = ImageCrop(img[n-1], x, y, w, h);
      if (img[n] == NULL) { err = 4; break; }
      n++;
    } else if (strcmp(av[k], "paste") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 2) { err = 2; break; }
      if (sscanf(av[k], "%d,%d", &x, &y) != 2) { err = 5; break; }
      w = ImageWidth(img[n-2]);
      h = ImageHeight(img[n-2]);
      if (!ImageValidRect(img[n-1], x, y, w, h)) { err = 6; break; }
      fprintf(stderr, "Pasting I%d at I%d (%d,%d)\n", n-2, n-1, x, y);
      ImagePaste(img[n-1], x, y, img[n-2]);
    } else if (strcmp(av[k], "blend") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 2) { err = 2; break; }
      double alpha;
      if (sscanf(av[k], "%d,%d,%lf", &x, &y, &alpha) != 3) { err = 5; break; }
      w = ImageWidth(img[n-2]);
      h = ImageHeight(img[n-2]);
      if (!ImageValidRect(img[n-1], x, y, w, h)) { err = 6; break; }
      fprintf(stderr, "Blending I%d with I%d@(%d,%d) with alpha=%.3f\n", n-2, n-1, x, y, alpha);
      ImageBlend(img[n-1], x, y, img[n-2], alpha);
    } else if (strcmp(av[k], "locate") == 0) {
      if (n < 2) { err = 2; break; }
      fprintf(stderr, "Locating I%d in I%d\n", n-2, n-1);
      if (ImageLocateSubImage(img[n-1], &x, &y, img[n-2])) {
        printf("# FOUND (%d,%d)\n", x, y);
      } else {
        printf("# NOTFOUND\n");
      }
    } else if (strcmp(av[k], "blur") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 1) { err = 2; break; }
      int dx; int dy;
      if (sscanf(av[k], "%d,%d", &dx, &dy) != 2) { err = 5; break; }
      fprintf(stderr, "Blur I%d with %dx%d mean filter\n", n-1, 2*dx+1, 2*dy+1);
      ImageBlur(img[n-1], dx, dy);
    } else if (strcmp(av[k], "save") == 0) {
      if (++k >= ac) { err = 1; break; }
      if (n < 1) { err = 2; break; }
      fprintf(stderr, "Saving %s <- I%d\n", av[k], n-1);
      if (ImageSave(img[n-1], av[k]) == 0) { err = 4; break; }
    } else {  // image file
      if (n >= N) { err = 3; break; }
      fprintf(stderr, "Loading %s -> I%d\n", av[k], n);
      img[n] = ImageLoad(av[k]);
      if (img[n] == NULL) { err = 4; break; }
      n++;
    }
    k++;
  }
  
  // Destroy remaining images
  while (n > 0) {
    ImageDestroy(&img[--n]);
  }

  error(err, errno, errors[err], ImageErrMsg());
  return 0;
}

