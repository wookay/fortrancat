! https://en.wikibooks.org/wiki/Fortran/Fortran_examples#Fortran_90

program array
   integer, parameter :: rows = 3, cols = 4
   integer, pointer :: p(:)=>null()
   integer, allocatable, target :: A(:,:)
   integer :: istat = 0, i, j
   character(80) :: fmt

   write (fmt, '("(/ A / A, "" = ["", ", i0, "( """",", i0, "(i3, 1x), "";"" / 5x), ""]"" )")') rows, cols
 
   allocate(A(rows, cols), stat = istat)
   if (istat /= 0) stop 'Error during allocation of A and q'
 
   A = reshape([(i, i = 1, size(A))], shape(A))


! A = [  1   4   7  10 ;
!        2   5   8  11 ;
!        3   6   9  12 ;
!      ]
   write(*, fmt) "Matrix A is:", "A", ((A(i, j), j = 1, size(A, 2)), i = 1, size(A, 1))
 
!  p will be associated with the first column of A
   p => A(:, 1)
 
!  This operation on p has a direct effect on matrix A
   p = p * 100
 
!  This will end the association between p and the first column of A
   nullify(p)


! A = [100   4   7  10 ;
!      200   5   8  11 ;
!      300   6   9  12 ;
!      ]
   write(*, fmt) "Matrix A becomes:", "A", ((A(i, j), j = 1, size(A, 2)), i = 1, size(A, 1))
 
   allocate (p(1:rows*cols), stat = istat)
   if (istat /= 0) stop 'Error during allocation of p'
 
   deallocate(A, p, stat = istat)
   if (istat /= 0) stop 'Error during deallocation'

end program
