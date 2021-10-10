Sun Oct 10 03:54:05 MDT 2021
#!/bin/sh -l
#PBS -N test-gfortran_7.4.0_openmpi_g.bat
#PBS -l walltime=2:00:00
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/gfortran_7.4.0_openmpi_g_release_8.2.0
module load gnu/7.4.0 openmpi/4.0.3 netcdf/4.7.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILER=mpif90
export ESMF_DIR=/glade/scratch/mpotts/gfortran_7.4.0_openmpi_g_release_8.2.0
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh cheyenne6 /glade/scratch/mpotts//glade/scratch/mpotts/gfortran_7.4.0_openmpi_g_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh cheyenne6 /glade/scratch/mpotts//glade/scratch/mpotts/gfortran_7.4.0_openmpi_g_release_8.2.0/getres-int.sh
