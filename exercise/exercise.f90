program exercise
  use mpi
  use functions
  implicit none

  integer :: process_rank, cluster_size, ierror
  integer, parameter :: MASTER_RANK = 0
  double precision :: x
  double precision :: y(2),argmin_y(2)

  call MPI_INIT(ierror)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, cluster_size, ierror)
  call MPI_COMM_RANK(MPI_COMM_WORLD, process_rank, ierror)

  call random_number(x)
  x=x*3-0.5
  ![-0.5,2.5], x*(2.5-(-0.5))+(-0.5)
  y(1)=f(x)
  y(2)=process_rank
  call MPI_ALLREDUCE(y, argmin_y, 1, MPI_2DOUBLE_PRECISION, MPI_MINLOC, MPI_COMM_WORLD, ierror)
  print *, "rank ", process_rank, "memiliki nilai x=",x,"f(x)=",y(1)
  call MPI_BARRIER(MPI_COMM_WORLD,ierror)
  IF (process_rank .EQ. int(argmin_y(2))) THEN
    print *, argmin_y(1),"merupakan nilai terkecil dari process rank", process_rank, "dengan nilai x=",x
  END IF

  call MPI_FINALIZE(ierror)

end program exercise
