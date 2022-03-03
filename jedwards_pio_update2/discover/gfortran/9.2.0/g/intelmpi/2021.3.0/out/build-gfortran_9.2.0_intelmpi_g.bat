Thu Mar 3 08:27:42 EST 2022
#!/bin/sh -l
#SBATCH --account=s2326
#SBATCH -o build-gfortran_9.2.0_intelmpi_g.bat_%j.o
#SBATCH -e build-gfortran_9.2.0_intelmpi_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=compute
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
module load comp/gcc/9.2.0 mpi/impi/2021.3.0 netcdf4/4.7.2
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/gfortran_9.2.0_intelmpi_g_jedwards_pio_update2
export ESMF_COMPILER=gfortran
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 28 2>&1| tee build_$JOBID.log

