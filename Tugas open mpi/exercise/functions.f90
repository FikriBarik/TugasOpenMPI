module functions
  implicit none

  contains
    function f(x) result(y)
      implicit none
      double precision :: pi = 4.D0*DATAN(1.D0)
      double precision, intent(in) :: x
      double precision :: y
      y = sin(10*pi*x)/2*x + (x-1)**4
    end function f

end module functions
