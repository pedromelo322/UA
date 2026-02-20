!
! Tomás Oliveira e Silva,  September 2024
!
! Arquiteturas de Alto Desempenho 2024/2024
!
! Mandelbrot set
! * iterate f(z) = z * z + c starting at z = 0 for a given complex number c
! * stop iterating when either
!   * the number of iterates reaches a pre-specified limit (256)
!   or
!   * the absolute value of the iterate is larger that 2 (divergence!)
! * do this for 1025 values in each axis, such that
!   * -2.05 <= real(c) <= 0.55
!   * -1.3 <= imag(c) <= 1.3
! Instead of generating an image of the Mandelbrot set we will only
! * count the number of values of c for which the iterates do not reach the iteration limit
!

program MandelbrotCount
  implicit none
  integer, parameter :: n_samples = 2049
  double precision   :: c_re_min, c_re_max, c_im_min, c_im_max
  double precision   :: c_re, c_im
  integer            :: counter, re_idx, im_idx, n_iter
  double precision   :: z_re, z_im, tmp
  double precision   :: t_start, t_end
  c_re_min = -2.05D0
  c_re_max = 0.55D0
  c_im_min = -1.3D0
  c_im_max = 1.3D0
  counter = 0
  call cpu_time(t_start)
  do re_idx = 0, n_samples - 1
    c_re = c_re_min + dble(re_idx) * ((c_re_max - c_re_min) / dble(n_samples))
    do im_idx = 0, n_samples - 1
      c_im = c_im_min + dble(im_idx) * ((c_im_max - c_im_min) / dble(n_samples))
      n_iter = 0
      z_re = 0.0D0
      z_im = 0.0D0
      do while (n_iter < 256 .and. z_re * z_re + z_im * z_im <= 4.0D0)
        tmp = z_re * z_re - z_im * z_im
        z_im = 2.0 * z_re * z_im + c_im
        z_re = tmp + c_re
        n_iter = n_iter + 1
      end do
      if (n_iter < 256) counter = counter + 1
    end do
  end do
  call cpu_time(t_end)
  print '(I7,A4,F7.3)',counter,' -- ',dble(t_end-t_start)
end program MandelbrotCount
