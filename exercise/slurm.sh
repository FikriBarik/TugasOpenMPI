#!/bin/bash
#
#SBATCH --job-name=exercise
#SBATCH --output=%A.out
#SBATCH --error=%A.err
#
#SBATCH --time=00:05:00
#SBATCH --nodelist=komputasi03

hostname -s;
whoami;

make clean; make all;
mpirun --report-bindings --oversubscribe --bind-to hwthread -np 20 exercise
