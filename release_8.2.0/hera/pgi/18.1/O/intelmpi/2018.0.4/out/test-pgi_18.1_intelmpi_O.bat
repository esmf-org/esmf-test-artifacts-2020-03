Sat Oct 9 08:30:28 UTC 2021
#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-pgi_18.1_intelmpi_O.bat_%j.o
#SBATCH -e test-pgi_18.1_intelmpi_O.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=mpirun.srun
module load pgi/18.10 impi/2018.0.4 

module list >& module-test.log

set -x

export ESMF_DIR=/scratch1/NCEPDEV/stmp2/Mark.Potts/pgi_18.1_intelmpi_O_release_8.2.0
export ESMF_COMPILER=pgi
export ESMF_COMM=intelmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh hfe10 /scratch1/NCEPDEV/stmp2/Mark.Potts//scratch1/NCEPDEV/stmp2/Mark.Potts/pgi_18.1_intelmpi_O_release_8.2.0/getres-int.sh
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh hfe10 /scratch1/NCEPDEV/stmp2/Mark.Potts//scratch1/NCEPDEV/stmp2/Mark.Potts/pgi_18.1_intelmpi_O_release_8.2.0/getres-int.sh
