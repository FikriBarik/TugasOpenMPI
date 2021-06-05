all: exercise

exercise:
	mpifort -g -ffpe-trap=zero,invalid,overflow,underflow -Wall -Werror functions.f90 exercise.f90 -o exercise

clean:
	rm -rf functions exercise
