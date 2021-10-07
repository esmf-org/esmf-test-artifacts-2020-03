Wed Oct 6 07:19:41 UTC 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-intel_18.0.4_mpiuni_g.bat_%j.o
#SBATCH -e test-intel_18.0.4_mpiuni_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
module load intel/18.0.5.274  netcdf/4.7.0
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_mpiuni_g_release_8.2.0
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh hfe10 /scratch1/NCEPDEV/stmp2/Mark.Potts//scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_mpiuni_g_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh hfe10 /scratch1/NCEPDEV/stmp2/Mark.Potts//scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_mpiuni_g_release_8.2.0/getres-int.sh
