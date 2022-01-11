Tue Jan 11 10:25:52 MST 2022
#!/bin/bash -l
export JOBID=12346

module use /project/esmf/stack/modulefiles
module load intel/19.1.0.166/compiler intel/19.1.0.166/mpich3/3.4.1-custom 

module list >& module-test.log

set -x

export ESMF_MOAB=OFF
export ESMF_DIR=/Volumes/esmf/rocky/esmf-testing/intel_19.1.0.166_mpich3_O_develop
export ESMF_COMPILER=intel
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

