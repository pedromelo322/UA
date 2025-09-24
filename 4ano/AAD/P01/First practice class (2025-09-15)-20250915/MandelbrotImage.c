//
// Tomás Oliveira e Silva,  September 2024
//
// Arquiteturas de Alto Desempenho 2024/2024
//
// Mandelbrot set
// * iterate f(z) = z * z + c starting at z = 0 for a given complex number c
// * stop iterating when either
//   * the number of iterates reaches a pre-specified limit (256)
//   or
//   * the absolute value of the iterate is larger that 2 (divergence!)
// * do this for 1025 values in each axis, such that
//   * -2.05 <= real(c) <= 0.55
//   * -1.3 <= imag(c) <= 1.3
// Generate a plain PGM image
//

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int n_samples = 2049;
  int *image = (int *)malloc((size_t)n_samples * (size_t)n_samples * sizeof(int));
  if(image == NULL)
    return 1; // no memory allocated, fail
  double c_re_min = -2.05;
  double c_re_max = +0.55;
  double c_im_min = -1.3;
  double c_im_max = +1.3;
  // generate image data
  for(int re_idx = 0;re_idx < n_samples;re_idx++)
  {
    double c_re = c_re_min + (double)re_idx * ((c_re_max - c_re_min) / (double)n_samples);
    for(int im_idx = 0;im_idx < n_samples;im_idx++)
    {
      double c_im = c_im_min + (double)im_idx * ((c_im_max - c_im_min) / (double)n_samples);
      int n_iter = 0;
      double z_re = 0.0;
      double z_im = 0.0;
      while(n_iter < 256 && z_re * z_re + z_im * z_im <= 4.0)
      { // (z_re+i*z_im)^2+(c_re+i*c_im) = (z_re^2-z_im^2+c_re)+i*(2*z_re*z_im+c_im)
        double tmp = z_re * z_re - z_im * z_im;
        z_im = 2.0 * z_re * z_im + c_im;
        z_re = tmp + c_re;
        n_iter++;
      }
      image[im_idx * n_samples + re_idx] = n_iter;
    }
  }
  // generate a plain PGM file
  FILE *fp = fopen("MandelbrotSet.pgm","w");
  if(fp == NULL)
    return 2; // unable to open file, fail
  fprintf(fp,"P2 %d %d 255\n",n_samples,n_samples);
  for(int i = 0;i < n_samples * n_samples;i++)
    if(image[i] >= 256)
      fprintf(fp,"0\n"); // black
    else
      fprintf(fp,"%d\n",64 + 6 * (image[i] % 32)); // gray bands
  fclose(fp);
  free(image);
  return 0;
}
