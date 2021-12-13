Mon Dec 13 06:00:38 UTC 2021
#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o build-intel_18.0.4_intelmpi_g.bat_%j.o
#SBATCH -e build-intel_18.0.4_intelmpi_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=mpirun.srun
module load intel/18.0.5.274 impi/2018.4.274 netcdf/4.7.0
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

tar xvfz ~/pytest-input.tar.gz
export ESMF_DIR=/scratch1/NCEPDEV/stmp2/role.esmfmaint/intel_18.0.4_intelmpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 40 2>&1| tee build_$JOBID.log

