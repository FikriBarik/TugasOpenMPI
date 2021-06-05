program assignment
  use mpi
  use functions
  implicit none

  integer :: process_rank, cluster_size, ierror
  integer :: i
  integer, parameter :: MASTER_RANK = 0
  double precision :: x,xmin
  double precision :: y(2),argmin_y(2)

  call MPI_INIT(ierror)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, cluster_size, ierror)
  call MPI_COMM_RANK(MPI_COMM_WORLD, process_rank, ierror)

  call random_number(x)
  x=x*3-0.5
  y(2)=process_rank
  do i=1,20
        y(1)=f(x)
        call MPI_ALLREDUCE(y, argmin_y, 1, MPI_2DOUBLE_PRECISION, MPI_MINLOC, MPI_COMM_WORLD, ierror)
        if(process_rank.EQ.int(argmin_y(2))) then
                xmin=x
                print*, "x minimum iterasi ke-",i,"adalah",xmin,"dengan f(x)=",f(x),"dari process",process_rank
        endif
        x=x+(0.05*(xmin-x))
        call MPI_BARRIER(MPI_COMM_WORLD,ierror)
  enddo
  IF (process_rank .EQ. int(argmin_y(2))) THEN
    print *, argmin_y(1),"nilai akhir terkecil dari process rank", process_rank, "dengan nilai x=",x
  END IF

  call MPI_FINALIZE(ierror)

end program assignment
