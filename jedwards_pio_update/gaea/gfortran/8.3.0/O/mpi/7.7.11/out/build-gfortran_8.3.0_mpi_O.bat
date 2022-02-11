Fri Feb 11 00:48:29 EST 2022
#!/bin/sh -l
#SBATCH --account=nggps_emc
#SBATCH -o build-gfortran_8.3.0_mpi_O.bat_%j.o
#SBATCH -e build-gfortran_8.3.0_mpi_O.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c4
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID

module unload PrgEnv-intel

module load PrgEnv-gnu
module load gcc/8.3.0 cray-mpich/7.7.11 cray-netcdf/4.6.3.2
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Mark.Potts/gfortran_8.3.0_mpi_O_jedwards_pio_update
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 24 2>&1| tee build_$JOBID.log

