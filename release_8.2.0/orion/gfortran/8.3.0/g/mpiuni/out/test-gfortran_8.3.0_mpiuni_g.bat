Wed Oct 6 02:41:17 CDT 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-gfortran_8.3.0_mpiuni_g.bat_%j.o
#SBATCH -e test-gfortran_8.3.0_mpiuni_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=orion
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID

module load intelpython3
module load gcc/8.3.0  netcdf/4.7.2
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export LD_PRELOAD=/apps/gcc-8/gcc-8.3.0/lib64/libstdc++.so
export ESMF_DIR=/work/noaa/da/mpotts/sandbox/gfortran_8.3.0_mpiuni_g_release_8.2.0
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/gfortran_8.3.0_mpiuni_g_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/gfortran_8.3.0_mpiuni_g_release_8.2.0/getres-int.sh
