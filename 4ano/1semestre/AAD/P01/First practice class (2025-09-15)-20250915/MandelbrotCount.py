#
# Tomás Oliveira e Silva,  September 2024
#
# Arquiteturas de Alto Desempenho 2024/2024
#
# Mandelbrot set
# * iterate f(z) = z * z + c starting at z = 0 for a given complex number c
# * stop iterating when either
#   * the number of iterates reaches a pre-specified limit (256)
#   or
#   * the absolute value of the iterate is larger that 2 (divergence!)
# * do this for 1025 values in each axis, such that
#   * -2.05 <= real(c) <= 0.55
#   * -1.3 <= imag(c) <= 1.3
# Instead of generating an image of the Mandelbrot set we will only
# * count the number of values of c for which the iterates do not reach the iteration limit
#

import time

n_samples = 2049
c_re_min = -2.05
c_re_max = +0.55
c_im_min = -1.3
c_im_max = +1.3
count = 0
#t = time.process_time()
for re_idx in range(0,n_samples):
  c_re = c_re_min + re_idx * ((c_re_max - c_re_min) / n_samples)
  for im_idx in range(0,n_samples):
    c_im = c_im_min + im_idx * ((c_im_max - c_im_min) / n_samples)
    n_iter = 0
    z_re = 0.0
    z_im = 0.0
    while n_iter < 256 and z_re * z_re + z_im * z_im <= 4.0:
      # (z_re+i*z_im)^2+(c_re+i*c_im) = (z_re^2-z_im^2+c_re)+i*(2*z_re*z_im+c_im)
      tmp = z_re * z_re - z_im * z_im
      z_im = 2.0 * z_re * z_im + c_im
      z_re = tmp + c_re
      n_iter = n_iter + 1
    if n_iter < 256:
      count = count + 1
#t = time.process_time() - t
#print(count,'--','{:7.3f}'.format(t))
