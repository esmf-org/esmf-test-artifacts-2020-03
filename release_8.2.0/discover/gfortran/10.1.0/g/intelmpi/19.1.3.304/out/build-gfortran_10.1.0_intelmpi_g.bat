Thu Oct 14 01:59:31 EDT 2021
#!/bin/sh -l
#SBATCH --account=s2326
#SBATCH -o build-gfortran_10.1.0_intelmpi_g.bat_%j.o
#SBATCH -e build-gfortran_10.1.0_intelmpi_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=compute
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
module load comp/gcc/10.1.0 mpi/impi/19.1.3.304 

module list >& module-build.log

set -x

export ESMF_F90COMPILEOPTS="-fallow-argument-mismatch -fallow-invalid-boz"
export ESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/gfortran_10.1.0_intelmpi_g_release_8.2.0
export ESMF_COMPILER=gfortran
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 28 2>&1| tee build_$JOBID.log

