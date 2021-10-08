Fri Oct 8 04:09:50 MDT 2021
#!/bin/sh -l
#PBS -N test-intel_18.0.5_intelmpi_O.bat
#PBS -l walltime=3:00:00
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/intel_18.0.5_intelmpi_O_release_8.2.0
module load intel/18.0.5 impi/2018.4.274 netcdf/4.6.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/glade/scratch/mpotts/intel_18.0.5_intelmpi_O_release_8.2.0
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh cheyenne6 /glade/scratch/mpotts//glade/scratch/mpotts/intel_18.0.5_intelmpi_O_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh cheyenne6 /glade/scratch/mpotts//glade/scratch/mpotts/intel_18.0.5_intelmpi_O_release_8.2.0/getres-int.sh

cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh cheyenne6 /glade/scratch/mpotts/intel_18.0.5_intelmpi_O_release_8.2.0/runpython.sh 2>&1 | tee python_build.log
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
