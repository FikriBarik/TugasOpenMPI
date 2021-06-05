all: assignment

assignment:
	mpifort -g -ffpe-trap=zero,invalid,overflow,underflow -Wall -Werror functions.f90 assignment.f90 -o assignment

clean:
	rm -rf functions assignment
