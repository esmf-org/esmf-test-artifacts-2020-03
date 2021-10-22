Fri Oct 22 12:48:47 PDT 2021
#!/bin/sh -l
#SBATCH --account=e3sm
#SBATCH -o build-intel_19.0.3_mpiuni_O.bat_%j.o
#SBATCH -e build-intel_19.0.3_mpiuni_O.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH -C haswell
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=/global/u2/r/rsdunlap/esmf-testing/intel_19.0.3_mpiuni_O_release_8.2.0/src/Infrastructure/stubs/mpiuni/mpirun
module load intel/19.0.3.199  cray-netcdf/4.6.3.2
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBS="-lnetcdf"
export ESMF_NETCDFF_LIBS="-lnetcdff"
export ESMF_DIR=/global/u2/r/rsdunlap/esmf-testing/intel_19.0.3_mpiuni_O_release_8.2.0
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 32 2>&1| tee build_$JOBID.log

