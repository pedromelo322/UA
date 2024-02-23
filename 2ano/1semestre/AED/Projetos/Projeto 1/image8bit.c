/// image8bit - A simple image processing module.
///
/// This module is part of a programming project
/// for the course AED, DETI / UA.PT
///
/// You may freely use and modify this code, at your own risk,
/// as long as you give proper credit to the original and subsequent authors.
///
/// João Manuel Rodrigues <jmr@ua.pt>
/// 2013, 2023

// Student authors (fill in below):
// NMec: 114208, 113600 Name: Pedro Miguel Miranda Melo, Henrique Manuel Pereira Ferreira
// 
// 
// 
// Date:26/11/23
//

#include "image8bit.h"

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "instrumentation.h"

// The data structure
//
// An image is stored in a structure containing 3 fields:
// Two integers store the image width and height.
// The other field is a pointer to an array that stores the 8-bit gray
// level of each pixel in the image.  The pixel array is one-dimensional
// and corresponds to a "raster scan" of the image from left to right,
// top to bottom.
// For example, in a 100-pixel wide image (img->width == 100),
//   pixel position (x,y) = (33,0) is stored in img->pixel[33];
//   pixel position (x,y) = (22,1) is stored in img->pixel[122].
// 
// Clients should use images only through variables of type Image,
// which are pointers to the image structure, and should not access the
// structure fields directly.

// Maximum value you can store in a pixel (maximum maxval accepted)
const uint8 PixMax = 255;

// Internal structure for storing 8-bit graymap images
struct image {
  int width;
  int height;
  int maxval;   // maximum gray value (pixels with maxval are pure WHITE)
  uint8* pixel; // pixel data (a raster scan)
};


// This module follows "design-by-contract" principles.
// Read `Design-by-Contract.md` for more details.

/// Error handling functions

// In this module, only functions dealing with memory allocation or file
// (I/O) operations use defensive techniques.
// 
// When one of these functions fails, it signals this by returning an error
// value such as NULL or 0 (see function documentation), and sets an internal
// variable (errCause) to a string indicating the failure cause.
// The errno global variable thoroughly used in the standard library is
// carefully preserved and propagated, and clients can use it together with
// the ImageErrMsg() function to produce informative error messages.
// The use of the GNU standard library error() function is recommended for
// this purpose.
//
// Additional information:  man 3 errno;  man 3 error;

// Variable to preserve errno temporarily
static int errsave = 0;

// Error cause
static char* errCause;

/// Error cause.
/// After some other module function fails (and returns an error code),
/// calling this function retrieves an appropriate message describing the
/// failure cause.  This may be used together with global variable errno
/// to produce informative error messages (using error(), for instance).
///
/// After a successful operation, the result is not garanteed (it might be
/// the previous error cause).  It is not meant to be used in that situation!
char* ImageErrMsg() { ///
  return errCause;
}


// Defensive programming aids
//
// Proper defensive programming in C, which lacks an exception mechanism,
// generally leads to possibly long chains of function calls, error checking,
// cleanup code, and return statements:
//   if ( funA(x) == errorA ) { return errorX; }
//   if ( funB(x) == errorB ) { cleanupForA(); return errorY; }
//   if ( funC(x) == errorC ) { cleanupForB(); cleanupForA(); return errorZ; }
//
// Understanding such chains is difficult, and writing them is boring, messy
// and error-prone.  Programmers tend to overlook the intricate details,
// and end up producing unsafe and sometimes incorrect programs.
//
// In this module, we try to deal with these chains using a somewhat
// unorthodox technique.  It resorts to a very simple internal function
// (check) that is used to wrap the function calls and error tests, and chain
// them into a long Boolean expression that reflects the success of the entire
// operation:
//   success = 
//   check( funA(x) != error , "MsgFailA" ) &&
//   check( funB(x) != error , "MsgFailB" ) &&
//   check( funC(x) != error , "MsgFailC" ) ;
//   if (!success) {
//     conditionalCleanupCode();
//   }
//   return success;
// 
// When a function fails, the chain is interrupted, thanks to the
// short-circuit && operator, and execution jumps to the cleanup code.
// Meanwhile, check() set errCause to an appropriate message.
// 
// This technique has some legibility issues and is not always applicable,
// but it is quite concise, and concentrates cleanup code in a single place.
// 
// See example utilization in ImageLoad and ImageSave.
//
// (You are not required to use this in your code!)


// Check a condition and set errCause to failmsg in case of failure.
// This may be used to chain a sequence of operations and verify its success.
// Propagates the condition.
// Preserves global errno!
static int check(int condition, const char* failmsg) {
  errCause = (char*)(condition ? "" : failmsg);
  return condition;
}


/// Init Image library.  (Call once!)
/// Currently, simply calibrate instrumentation and set names of counters.
void ImageInit(void) { ///
  InstrCalibrate();
  InstrName[0] = "pixmem";  // InstrCount[0] will count pixel array acesses
  // Name other counters here...
  InstrName[1] = "comp";
  InstrName[2] = "sums";
  InstrName[3] = "mul";
  
}

// Macros to simplify accessing instrumentation counters:
#define PIXMEM InstrCount[0]
// Add more macros here...

// TIP: Search for PIXMEM or InstrCount to see where it is incremented!


/// Image management functions

/// Create a new black image.
///   width, height : the dimensions of the new image.
///   maxval: the maximum gray level (corresponding to white).
/// Requires: width and height must be non-negative, maxval > 0.
/// 
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
Image ImageCreate(int width, int height, uint8 maxval) { ///
  assert (width >= 0);
  assert (height >= 0);
  assert (0 < maxval && maxval <= PixMax);
  // Insert your code here!
  Image image = (Image) malloc(sizeof(struct image));


  if (!check(image != NULL, "ImageCreate failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    return NULL;
  }

  image->width = width;
  image->height = height;
  image->maxval = maxval; 
  image->pixel = (uint8 *)calloc(width*height, sizeof(uint8));

  if (!check(image->pixel != NULL, "PixelCreate failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    free(image);
    return NULL;
  }

  return image;
}

/// Destroy the image pointed to by (*imgp).
///   imgp : address of an Image variable.
/// If (*imgp)==NULL, no operation is performed.
/// Ensures: (*imgp)==NULL.
/// Should never fail, and should preserve global errno/errCause.
void ImageDestroy(Image* imgp) { ///
  assert (imgp != NULL);
  // Insert your code here!

  if (*imgp != NULL) {
    // Preserve the value of errno
    // liberta a memória do array de pixeis 
    free((*imgp)->pixel);
    (*imgp)->pixel = NULL;

    // liberta a memória da imagem
    free(*imgp);
    *imgp = NULL;

  }
}


/// PGM file operations

// See also:
// PGM format specification: http://netpbm.sourceforge.net/doc/pgm.html

// Match and skip 0 or more comment lines in file f.
// Comments start with a # and continue until the end-of-line, inclusive.
// Returns the number of comments skipped.
static int skipComments(FILE* f) {
  char c;
  int i = 0;
  while (fscanf(f, "#%*[^\n]%c", &c) == 1 && c == '\n') {
    i++;
  }
  return i;
}

/// Load a raw PGM file.
/// Only 8 bit PGM files are accepted.
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
Image ImageLoad(const char* filename) { ///
  int w, h;
  int maxval;
  char c;
  FILE* f = NULL;
  Image img = NULL;

  int success = 
  check( (f = fopen(filename, "rb")) != NULL, "Open failed" ) &&
  // Parse PGM header
  check( fscanf(f, "P%c ", &c) == 1 && c == '5' , "Invalid file format" ) &&
  skipComments(f) >= 0 &&
  check( fscanf(f, "%d ", &w) == 1 && w >= 0 , "Invalid width" ) &&
  skipComments(f) >= 0 &&
  check( fscanf(f, "%d ", &h) == 1 && h >= 0 , "Invalid height" ) &&
  skipComments(f) >= 0 &&
  check( fscanf(f, "%d", &maxval) == 1 && 0 < maxval && maxval <= (int)PixMax , "Invalid maxval" ) &&
  check( fscanf(f, "%c", &c) == 1 && isspace(c) , "Whitespace expected" ) &&
  // Allocate image
  (img = ImageCreate(w, h, (uint8)maxval)) != NULL &&
  // Read pixels
  check( fread(img->pixel, sizeof(uint8), w*h, f) == w*h , "Reading pixels" );
  PIXMEM += (unsigned long)(w*h);  // count pixel memory accesses

  // Cleanup
  if (!success) {
    errsave = errno;
    ImageDestroy(&img);
    errno = errsave;
  }
  if (f != NULL) fclose(f);
  return img;
}

/// Save image to PGM file.
/// On success, returns nonzero.
/// On failure, returns 0, errno/errCause are set appropriately, and
/// a partial and invalid file may be left in the system.
int ImageSave(Image img, const char* filename) { ///
  assert (img != NULL);
  int w = img->width;
  int h = img->height;
  uint8 maxval = img->maxval;
  FILE* f = NULL;

  int success =
  check( (f = fopen(filename, "wb")) != NULL, "Open failed" ) &&
  check( fprintf(f, "P5\n%d %d\n%u\n", w, h, maxval) > 0, "Writing header failed" ) &&
  check( fwrite(img->pixel, sizeof(uint8), w*h, f) == w*h, "Writing pixels failed" ); 
  PIXMEM += (unsigned long)(w*h);  // count pixel memory accesses

  // Cleanup
  if (f != NULL) fclose(f);
  return success;
}


/// Information queries

/// These functions do not modify the image and never fail.

/// Get image width
int ImageWidth(Image img) { ///
  assert (img != NULL);
  return img->width;
}

/// Get image height
int ImageHeight(Image img) { ///
  assert (img != NULL);
  return img->height;
}

/// Get image maximum gray level
int ImageMaxval(Image img) { ///
  assert (img != NULL);
  return img->maxval;
}




/// Pixel stats
/// Find the minimum and maximum gray levels in image.
/// On return,
/// *min is set to the minimum gray level in the image,
/// *max is set to the maximum.
void ImageStats(Image img, uint8* min, uint8* max) { ///
  assert (img != NULL);
  // Insert your code here!
  assert (min != NULL);
  assert (max != NULL);

  int width = ImageWidth(img);
  int height = ImageHeight(img);

  *min = img->pixel[0];
  *max = img->pixel[0];

  //se image->pixel[i] for maior que max, *max = image->pixel[i]
  //se for menor que  min, *min = image->pixel[i]
  for (int i = 1; i < width * height; i++) {
    if (img->pixel[i] < *min) {
      *min = img->pixel[i];
    }
    if (img->pixel[i] > *max) {
      *max = img->pixel[i];
    }
  }
}

/// Check if pixel position (x,y) is inside img.
int ImageValidPos(Image img, int x, int y) { ///
  assert (img != NULL);
  return (0 <= x && x < img->width) && (0 <= y && y < img->height);
}

/// Check if rectangular area (x,y,w,h) is completely inside img.
int ImageValidRect(Image img, int x, int y, int w, int h) { ///
  assert (img != NULL);
  // Insert your code here!
   
  assert (w >= 0 && h >= 0); // garante que a largura e a altura são valores positivos

  // verifica se o canto superior esquerdo pertence à imagem
  if (!ImageValidPos(img, x, y)) {
    return 0;
  }

  // verifica se o canto inferior direito pertence à imagem
  if (!ImageValidPos(img, x + w - 1, y + h - 1)) {
    return 0;
  }

  return 1; // se as dimensões estiverem dentro da imagem retorna 1
}

/// Pixel get & set operations

/// These are the primitive operations to access and modify a single pixel
/// in the image.
/// These are very simple, but fundamental operations, which may be used to 
/// implement more complex operations.

// Transform (x, y) coords into linear pixel index.
// This internal function is used in ImageGetPixel / ImageSetPixel. 
// The returned index must satisfy (0 <= index < img->width*img->height)
static inline int G(Image img, int x, int y) {

  // Insert your code here!
  assert (img != NULL);
  assert (ImageValidPos(img, x, y));

  int width = ImageWidth(img);


  return y * width + x;;
}

/// Get the pixel (level) at position (x,y).
uint8 ImageGetPixel(Image img, int x, int y) { ///
  assert (img != NULL);
  assert (ImageValidPos(img, x, y));
  PIXMEM += 1;  // count one pixel access (read)
  return img->pixel[G(img, x, y)];
} 

/// Set the pixel at position (x,y) to new level.
void ImageSetPixel(Image img, int x, int y, uint8 level) { ///
  assert (img != NULL);
  assert (ImageValidPos(img, x, y));
  PIXMEM += 1;  // count one pixel access (store)
  img->pixel[G(img, x, y)] = level;
} 


/// Pixel transformations

/// These functions modify the pixel levels in an image, but do not change
/// pixel positions or image geometry in any way.
/// All of these functions modify the image in-place: no allocation involved.
/// They never fail.


/// Transform image to negative image.
/// This transforms dark pixels to light pixels and vice-versa,
/// resulting in a "photographic negative" effect.
void ImageNegative(Image img) { ///
  assert (img != NULL);
  // Insert your code here!

  //percorre a altura e a largura pixel a pixel
  for (int y = 0; y < ImageHeight(img); y++) {
    for (int x = 0; x < ImageWidth(img); x++) {
      uint8 level = ImageGetPixel(img, x, y);
      level = ImageMaxval(img) - level; // inverte o valor do pixel
      ImageSetPixel(img, x, y, level);
    }
  }
}

/// Apply threshold to image.
/// Transform all pixels with level<thr to black (0) and
/// all pixels with level>=thr to white (maxval).
void ImageThreshold(Image img, uint8 thr) { ///
  assert (img != NULL);
  // Insert your code here!

  //percorre a altura e a largura pixel a pixel 
  for (int y = 0; y < ImageHeight(img); y++) {
    for (int x = 0; x < ImageWidth(img); x++) {
      uint8 level = ImageGetPixel(img, x, y);
      if (level < thr) {
        ImageSetPixel(img, x, y, 0); // coloca o pixel preto
      } else {
        ImageSetPixel(img, x, y, ImageMaxval(img)); // coloca o pixel branco
      }
    }
  }
}

/// Brighten image by a factor.
/// Multiply each pixel level by a factor, but saturate at maxval.
/// This will brighten the image if factor>1.0 and
/// darken the image if factor<1.0.
void ImageBrighten(Image img, double factor) { ///
  assert (img != NULL);
  assert (factor >= 0.0);
  // Insert your code here!


  for (int y = 0; y < ImageHeight(img); y++) {
    for (int x = 0; x < ImageWidth(img); x++) {
      uint8 level = ImageGetPixel(img, x, y);
      level = (uint8)round(level * factor); // multiplica o valor pelo factor
      if (level > ImageMaxval(img)) {
        level = ImageMaxval(img); // se o valor for superior ao valor max valor = valorMax
      }
      ImageSetPixel(img, x, y, level); //atribuir o novo valor ao pixel
    }
  }
}


/// Geometric transformations

/// These functions apply geometric transformations to an image,
/// returning a new image as a result.
/// 
/// Success and failure are treated as in ImageCreate:
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.

// Implementation hint: 
// Call ImageCreate whenever you need a new image!

/// Rotate an image.
/// Returns a rotated version of the image.
/// The rotation is 90 degrees anti-clockwise.
/// Ensures: The original img is not modified.
/// 
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
Image ImageRotate(Image img) { ///
  assert (img != NULL);
  // Insert your code here!

  int width = ImageWidth(img);
  int height = ImageHeight(img);
  int maxval = ImageMaxval(img);

  
  // cria uma nova imagem com as dimensoes da imagem a rodar
  Image rotatedImg = ImageCreate(width, height, maxval);

  if (!check(rotatedImg != NULL, "ImageCreate failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    return NULL;
  }
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // vai buscar o valor do pixel (x, y) da imagem a rodar
      uint8 level = ImageGetPixel(img, x, y);
      
      // atribui o valor do pixel na nova posição, (y, largura - x -1)
      ImageSetPixel(rotatedImg, y, width - x -1, level);
    }
  }

  
  return rotatedImg;
}

/// Mirror an image = flip left-right.
/// Returns a mirrored version of the image.
/// Ensures: The original img is not modified.
/// 
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
/// Mirror an image = flip left-right.
/// Returns a mirrored version of the image.
/// Ensures: The original img is not modified.
/// 
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
Image ImageMirror(Image img) { ///
    assert (img != NULL);
  // Insert your code here!


  int width = ImageWidth(img);
  int height = ImageHeight(img);
  int maxval = ImageMaxval(img);


  
  // cria uma nova imagem com as dimensoes da imagem original
  Image mirroredImg = ImageCreate(width, height, maxval);
  if (!check(mirroredImg != NULL, "ImageCreate failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    return NULL;
  }

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // vai buscar o valor do pixel (x, y) da imagem original
      uint8 level = ImageGetPixel(img, x, y);
      
      // atribui o valor do pixel na nova posição,ou seja, (largura - x - 1, y)
      ImageSetPixel(mirroredImg, width - x - 1, y, level);
    }
  }
  
  return mirroredImg;
}
/// Crop a rectangular subimage from img.
/// The rectangle is specified by the top left corner coords (x, y) and
/// width w and height h.
/// Requires:
///   The rectangle must be inside the original image.
/// Ensures:
///   The original img is not modified.
///   The returned image has width w and height h.
/// 
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
/// On failure, returns NULL and errno/errCause are set accordingly.
Image ImageCrop(Image img, int x, int y, int w, int h) { ///
  assert (img != NULL);
  assert (ImageValidRect(img, x, y, w, h));
  // Insert your code here!

  

  // cria uma nova imagem com as dimensoes da imagem original
  Image croppedImg = ImageCreate(w, h, ImageMaxval(img));
  if (!check(croppedImg != NULL, "ImageCreate failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    return NULL;
  }
  
  
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      //  vai buscar o valor do pixel (x + j, y + i) da imagem original
      uint8 level = ImageGetPixel(img, x + j, y + i);
      
      // atribui o valor do pixel na  posição (j, i)
      ImageSetPixel(croppedImg, j, i, level);
    }
  }
  
  return croppedImg;
}


/// Operations on two images

/// Paste an image into a larger image.
/// Paste img2 into position (x, y) of img1.
/// This modifies img1 in-place: no allocation involved.
/// Requires: img2 must fit inside img1 at position (x, y).
void ImagePaste(Image img1, int x, int y, Image img2) { ///
  assert (img1 != NULL);
  assert (img2 != NULL);
  assert (ImageValidRect(img1, x, y, ImageWidth(img2), ImageHeight(img2)));
  // Insert your code here!


  for (int i = 0; i < ImageHeight(img2); i++) {
    for (int j = 0; j < ImageWidth(img2); j++) {
      // vai buscar o valor do pixel da img2
      uint8 level = ImageGetPixel(img2, j, i);
      
      // atribui o valor do pixel na posição (x + j, y + i)
      ImageSetPixel(img1, x + j, y + i, level);
    }
  }
  
}

/// Blend an image into a larger image.
/// Blend img2 into position (x, y) of img1.
/// This modifies img1 in-place: no allocation involved.
/// Requires: img2 must fit inside img1 at position (x, y).
/// alpha usually is in [0.0, 1.0], but values outside that interval
/// may provide interesting effects.  Over/underflows should saturate.
void ImageBlend(Image img1, int x, int y, Image img2, double alpha) { ///
  assert (img1 != NULL);
  assert (img2 != NULL);
  assert (ImageValidRect(img1, x, y, ImageWidth(img2), ImageHeight(img2)));
  // Insert your code here!

  assert (alpha >= 0.0 && alpha <= 1.0);

  for (int i = 0; i < ImageHeight(img2); i++) {
    for (int j = 0; j < ImageWidth(img2); j++) {
      // vai buscar o valor do pixel da img1 e img2
      uint8 level1 = ImageGetPixel(img1, x + j, y + i);
      uint8 level2 = ImageGetPixel(img2, j, i);
      
      // blendedlevel é a média do pixel da img1 e img2
      uint8 blendedLevel = (uint8)round((level1 * (1 - alpha)) + (level2 * alpha));
      
      // atribui o valor do blendedlevel no pixel na posição (x + j, y + i)
      ImageSetPixel(img1, x + j, y + i, blendedLevel);
    }
  }
}

/// Compare an image to a subimage of a larger image.
/// Returns 1 (true) if img2 matches subimage of img1 at pos (x, y).
/// Returns 0, otherwise.
int ImageMatchSubImage(Image img1, int x, int y, Image img2) { ///
  assert (img1 != NULL);
  assert (img2 != NULL);
  assert (ImageValidPos(img1, x, y));
  // Insert your code here!

  // garante que a subimagem(img2) nas posições x e y estão dentro dos limites da img1
  assert (x + ImageWidth(img2) <= ImageWidth(img1));
  assert (y + ImageHeight(img2) <= ImageHeight(img1));
  
  
  for (int i = 0; i < ImageHeight(img2); i++) {
    for (int j = 0; j < ImageWidth(img2); j++) {
      // vai buscar o valor do pixel da img1 e img2
      uint8 level1 = ImageGetPixel(img1, x + j, y + i);
      uint8 level2 = ImageGetPixel(img2, j, i);
      COMP++;
      // compara o pixel da imagem1 com o da imagem2 se forem diferentes retorna 0
      if (level1 != level2) {
        return 0; 
      }
    }
  }
  
  return 1; // subimagem(img2) igual a img1
}

/// Locate a subimage inside another image.
/// Searches for img2 inside img1.
/// If a match is found, returns 1 and matching position is set in vars (*px, *py).
/// If no match is found, returns 0 and (*px, *py) are left untouched.
int ImageLocateSubImage(Image img1, int* px, int* py, Image img2) { ///
  assert (img1 != NULL);
  assert (img2 != NULL);
  // Insert your code here!
  assert (px != NULL);
  assert (py != NULL);
  
  
  // percorre as posiçoes da img1 até à posição máxima que a img2 cabe na img1
  for (int y = 0; y <= ImageHeight(img1) - ImageHeight(img2); y++) {
    for (int x = 0; x <= ImageWidth(img1) - ImageWidth(img2); x++) {
      // verifica se img2 é igual a img1
      if (ImageMatchSubImage(img1, x, y, img2)) {
        // atribui a *px e *py o valor da posição onde encontrou a imagem 
        *px = x;
        *py = y;

        return 1; // imagem encontrada
      }
    }
  }
  
  return 0; // imagem não encontrada
}




/// Filtering

/// Blur an image by a applying a (2dx+1)x(2dy+1) mean filter.
/// Each pixel is substituted by the mean of the pixels in the rectangle
/// [x-dx, x+dx]x[y-dy, y+dy].
/// The image is changed in-place.
void ImageBlur(Image img, int dx, int dy) { ///
  assert (img != NULL);
  assert (dx >= 0 && dy >= 0);
  
  // cria um array
  int width = ImageWidth(img);
  int height = ImageHeight(img);
  int** sumMatrix = (int**)malloc(height * sizeof(int*));


  //se dx e dy = 0 não faz nada
  if (dx==0 && dy == 0){
    return;
  }

  if (!check(sumMatrix != NULL, "sumMatrix failed")) {
    errsave = errno;
    perror(ImageErrMsg());
    errno = errsave;
    return;
  }

  //percorre a altura da imagem e cria a matriz bidimensional para cada pixel
  for (int i = 0; i < height; i++) {
    sumMatrix[i] = (int*)malloc(width * sizeof(int)); 
    if (!check(sumMatrix[i] != NULL, "sumMatrix failed")) {
      for (int j = 0; j < i; j++) {
        free(sumMatrix[j]);
      }
      free(sumMatrix);
      errsave = errno;
      perror(ImageErrMsg());
      errno = errsave;
      return;
    }
  }
  
  // calcula para cada pixel, o somatório dos pixeis na matriz ixj
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      int sum = ImageGetPixel(img, j, i);
      if (i > 0) {SUMS++;sum += sumMatrix[i - 1][j];}
      if (j > 0) {SUMS++;sum += sumMatrix[i][j - 1];}
      if (i > 0 && j > 0) {SUMS++;sum -= sumMatrix[i - 1][j - 1];}
      sumMatrix[i][j] = sum;
    }
  }
  
  
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      SUMS += 4;
      int x1 = j - dx;
      int y1 = i - dy;
      int x2 = j + dx;
      int y2 = i + dy;
      
      // ajusta para os limites do pixeis à sua volta consoante dx e dy
      if (x1 < 0) {x1 = 0;}
      if (x2 >= width) {SUMS++;x2 = width - 1;}
      if (y1 < 0) {y1 = 0;}
      if (y2 >= height) {SUMS++;y2 = height - 1;}
      
      // calcula a soma dos pixeis à sua volta
      int sum = sumMatrix[y2][x2];
      if (x1 > 0) {SUMS++;sum -= sumMatrix[y2][x1 - 1];}
      if (y1 > 0) {SUMS++;sum -= sumMatrix[y1 - 1][x2];}
      if (x1 > 0 && y1 > 0) {SUMS++;sum += sumMatrix[y1 - 1][x1 - 1];}
      
      // calcula o numero de pixeis à sua volta e faz a média desses pixeis
      int count = (x2 - x1 + 1) * (y2 - y1 + 1);
      int mean = round((double)sum / count);
      MUL += 2;
      // atribui o valor do novo pixel na posição (j, i)
      ImageSetPixel(img, j, i, mean);
    }
  }
  
  // liberta a memória da matriz bidimensional
  for (int i = 0; i < height; i++) {
    free(sumMatrix[i]);
  }
  free(sumMatrix);
}

void ImageBlurBasica(Image img, int dx, int dy) { ///
  // Insert your code here!
  assert (img != NULL);
  assert (dx >= 0 && dy >= 0);

  // Create a temporary image to store the blurred result
  Image tempImg = ImageCreate(img->width, img->height, img->maxval);

  // Iterate over the pixels of the image
  for (int y = 0; y < img->height; y++) {
    for (int x = 0; x < img->width; x++) {
      // Calculate the sum of pixel values in the neighborhood
      int sum = 0;
      int count = 0;
      for (int i = -dy; i <= dy; i++) {
        for (int j = -dx; j <= dx; j++) {
          // Calculate the coordinates of the current pixel
          SUMS += 2;
          int nx = x + j;
          int ny = y + i;

          // Check if the pixel is within the image boundaries
          if (nx >= 0 && nx < img->width && ny >= 0 && ny < img->height) {
            // Add the pixel value to the sum
            SUMS += 2;
            sum += ImageGetPixel(img, nx, ny);
            count++;
          }
        }
      }
      // Calculate the average pixel value
      uint8 average = (uint8)round((sum / (double)count));
      MUL++;
      
      // Set the average pixel value in the temporary image
      ImageSetPixel(tempImg, x, y, average);
    }
  }

  // Copy the blurred image back to the original image
  img->pixel = tempImg->pixel;
  tempImg = NULL;

  // Free the memory allocated for the temporary image
  ImageDestroy(&tempImg);
}