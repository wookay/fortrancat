all:
	make test
	make array

test:
	gfortran -fprofile-arcs -ftest-coverage -O0 test.f90 -o test
	./test
	gcov test.f90

array:
	gfortran -fprofile-arcs -ftest-coverage -O0 array.f90 -o array
	./array
	gcov array.f90

clean:
	rm test array *.gcno *.gcda
