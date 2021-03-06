Fri Oct 29 14:30:31 MDT 2021
#!/bin/bash -l
export JOBID=12345

module use /project/esmf/stack/modulefiles
module load gnu/9.3.0/compiler  gnu/9.3.0/netcdf-c/4.7.4
module load gnu/9.3.0/netcdf-fortran/4.5.3 
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/Volumes/esmf/rocky/esmf-testing/gfortran_9.3.0_mpiuni_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 4 2>&1| tee build_$JOBID.log

