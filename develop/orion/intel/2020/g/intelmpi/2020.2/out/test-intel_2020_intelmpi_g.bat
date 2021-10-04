Mon Oct 4 08:10:34 CDT 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-intel_2020_intelmpi_g.bat_%j.o
#SBATCH -e test-intel_2020_intelmpi_g.bat_%j.e
#SBATCH --time=4:00:00
#SBATCH --partition=orion
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID

module load intelpython3
module load intel/2020.2 impi/2020.2 netcdf/4.7.4
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/work/noaa/da/mpotts/sandbox/intel_2020_intelmpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/intel_2020_intelmpi_g_develop/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/intel_2020_intelmpi_g_develop/getres-int.sh

cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox/intel_2020_intelmpi_g_develop/runpython.sh 2>&1 | tee python_build.log
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
