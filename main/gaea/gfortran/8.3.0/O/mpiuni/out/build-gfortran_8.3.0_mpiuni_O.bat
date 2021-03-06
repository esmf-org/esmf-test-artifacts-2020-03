Fri Oct 29 03:31:05 EDT 2021
#!/bin/sh -l
#SBATCH --account=nggps_emc
#SBATCH -o build-gfortran_8.3.0_mpiuni_O.bat_%j.o
#SBATCH -e build-gfortran_8.3.0_mpiuni_O.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c4
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID

module unload PrgEnv-intel

module load PrgEnv-gnu
export ESMF_MPIRUN=/lustre/f2/dev/ncep/Mark.Potts/gfortran_8.3.0_mpiuni_O_main/src/Infrastructure/stubs/mpiuni/mpirun
module load gcc/8.3.0  cray-netcdf/4.6.3.2
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Mark.Potts/gfortran_8.3.0_mpiuni_O_main
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 24 2>&1| tee build_$JOBID.log

