#!/bin/bash
#
#SBATCH --job-name=assignment
#SBATCH --output=%A.out
#SBATCH --error=%A.err
#
#SBATCH --time=00:05:00
#SBATCH --nodelist=komputasi03,komputasi06

hostname -s;
whoami;

make clean; make all;
#mpirun --report-bindings --oversubscribe --bind-to hwthread -np 20 assignment
mpirun --hostfile hosts --report-bindings --oversubscribe --bind-to hwthread -npernode 20 assignment
