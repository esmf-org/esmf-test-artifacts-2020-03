Sat Oct 9 02:30:12 CDT 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-gfortran_8.3.0_openmpi_O.bat_%j.o
#SBATCH -e test-gfortran_8.3.0_openmpi_O.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=orion
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID

module load intelpython3
module load gcc/8.3.0 openmpi/4.0.2 netcdf/4.7.2
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export LD_PRELOAD=/apps/gcc-8/gcc-8.3.0/lib64/libstdc++.so
export ESMF_DIR=/work/noaa/da/mpotts/sandbox/gfortran_8.3.0_openmpi_O_release_8.2.0
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/gfortran_8.3.0_openmpi_O_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox//work/noaa/da/mpotts/sandbox/gfortran_8.3.0_openmpi_O_release_8.2.0/getres-int.sh

cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh Orion-login-1.HPC.MsState.Edu /work/noaa/da/mpotts/sandbox/gfortran_8.3.0_openmpi_O_release_8.2.0/runpython.sh 2>&1 | tee python_build.log
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
