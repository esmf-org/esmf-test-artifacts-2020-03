Thu Oct 7 07:37:46 UTC 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o build-intel_18.0.4_mpiuni_g.bat_%j.o
#SBATCH -e build-intel_18.0.4_mpiuni_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
module load intel/18.0.5.274  netcdf/4.7.0
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_mpiuni_g_release_8.2.0
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 40 2>&1| tee build_$JOBID.log

