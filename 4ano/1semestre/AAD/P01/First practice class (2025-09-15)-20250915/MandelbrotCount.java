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
// Instead of generating an image of the Mandelbrot set we will only
// * count the number of values of c for which the iterates do not reach the iteration limit
//

public class MandelbrotCount
{
  public static void main(String args[])
  {
    int n_samples = 2049;
    double c_re_min = -2.05;
    double c_re_max = +0.55;
    double c_im_min = -1.3;
    double c_im_max = +1.3;
    int count = 0;
    long t = System.nanoTime();
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
        if(n_iter < 256)
          count++;
      }
    }
    t = System.nanoTime() - t;
    System.out.printf("%d -- %7.3f\n",count,1.0e-9 * (double)t);
  }
}
