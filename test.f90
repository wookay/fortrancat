subroutine assert_equal(expected, got)
  integer :: expected, got
  if (expected == got) then
     write(*,*) "passed: ", expected
  else
     write(*,*) "failed - expected: ", expected
     write(*,*) "         got:      ", got
  end if
end subroutine assert_equal


program test

  call assert_equal(3, 1+2)
  call assert_equal(3, 5+2)

end program
