Wed Jan 12 13:56:09 MST 2022
#!/bin/bash -l
export JOBID=12346

module use /project/esmf/stack/modulefiles
module load gnu/9.3.0/compiler gnu/9.3.0/mpich3/3.3.2-custom gnu/9.3.0/netcdf-c/4.7.4
module load gnu/9.3.0/netcdf-fortran/4.5.3 
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/Volumes/esmf/rocky/esmf-testing/gfortran_9.3.0_mpich3_O_jedwards_pio_update
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

