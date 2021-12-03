<<<<<<< HEAD
Thu Dec 2 17:34:57 MST 2021
=======
Thu Dec 2 05:38:00 MST 2021
>>>>>>> 630b9fc76aa7fce4b8e37709048d3cdb7132447d
#!/bin/sh -l
#PBS -N test-intel_18.0.5_intelmpi_g.bat
#PBS -l walltime=3:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

<<<<<<< HEAD
cd /glade/scratch/rlong/esmf-testing/intel_18.0.5_intelmpi_g_develop
=======
cd /glade/scratch/mpotts/intel_18.0.5_intelmpi_g_develop

module load python
>>>>>>> 630b9fc76aa7fce4b8e37709048d3cdb7132447d
module load intel/18.0.5 impi/2018.4.274 netcdf/4.6.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/glade/scratch/rlong/esmf-testing/intel_18.0.5_intelmpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
<<<<<<< HEAD
ssh cheyenne6 /glade/scratch/rlong/esmf-testing//glade/scratch/rlong/esmf-testing/intel_18.0.5_intelmpi_g_develop/getres-int.sh
=======
>>>>>>> 630b9fc76aa7fce4b8e37709048d3cdb7132447d
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

<<<<<<< HEAD
ssh cheyenne6 /glade/scratch/rlong/esmf-testing//glade/scratch/rlong/esmf-testing/intel_18.0.5_intelmpi_g_develop/getres-int.sh
=======
>>>>>>> 630b9fc76aa7fce4b8e37709048d3cdb7132447d

cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh cheyenne6 /glade/scratch/rlong/esmf-testing/intel_18.0.5_intelmpi_g_develop/runpython.sh 2>&1 | tee python_build.log
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
