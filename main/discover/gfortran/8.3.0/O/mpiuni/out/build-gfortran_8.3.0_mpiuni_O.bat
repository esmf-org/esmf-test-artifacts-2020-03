Fri Oct 29 01:25:26 EDT 2021
#!/bin/sh -l
#SBATCH --account=s2326
#SBATCH -o build-gfortran_8.3.0_mpiuni_O.bat_%j.o
#SBATCH -e build-gfortran_8.3.0_mpiuni_O.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=compute
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=/gpfsm/dnb04/projects/p98/mpotts/esmf/gfortran_8.3.0_mpiuni_O_main/src/Infrastructure/stubs/mpiuni/mpirun
module load comp/gcc/8.3.0  

module list >& module-build.log

set -x

export ESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/gfortran_8.3.0_mpiuni_O_main
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 28 2>&1| tee build_$JOBID.log

