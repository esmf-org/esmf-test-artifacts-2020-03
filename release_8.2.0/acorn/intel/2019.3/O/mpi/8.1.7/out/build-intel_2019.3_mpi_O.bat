Tue Oct 26 20:35:18 UTC 2021
#!/bin/sh -l
#PBS -N build-intel_2019.3_mpi_O.bat
#PBS -l walltime=1:00:00
#PBS -l walltime=1:00:00
#PBS -q dev
#PBS -A GFS-DEV
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /lfs/h1/emc/ptmp/Mark.Potts/intel_2019.3_mpi_O_release_8.2.0

module unload PrgEnv-cray PrgEnv-gnu

module load PrgEnv-intel cray-pals craype
module load intel/19.1.3.304 cray-mpich/8.1.7 netcdf/4.7.4
module load hdf5/1.10.6 
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_OS=Linux
export ESMF_CXXCOMPILER=CC
export ESMF_F90COMPILER=ftn
export ESMF_CXXLINKER=CC
export ESMF_F90LINKER=ftn
export ESMF_MPIRUN=mpirun.unicos
export ESMF_CXXCOMPILECPPFLAGS=-fPIC
export ESMF_CXXLINKOPTS="-fPIC -lnetcdff -lnetcdff"
export ESMF_NETCDF=nc-config
sed -i 's/^aprun/mpiexec/' scripts/mpirun.unicos
sed -i 's/lmpi++/lfmpich/' build_config/Linux.intel.default/build_rules.mk
export ESMF_DIR=/lfs/h1/emc/ptmp/Mark.Potts/intel_2019.3_mpi_O_release_8.2.0
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 128 2>&1| tee build_$JOBID.log

