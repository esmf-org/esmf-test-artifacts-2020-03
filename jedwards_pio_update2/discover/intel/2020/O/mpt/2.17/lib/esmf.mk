build time -- 2022-03-02 01:16:03.970208
# ESMF application makefile fragment
#
# Use the following ESMF_ variables to compile and link
# your ESMF application against this ESMF build.
#
# !!! VERY IMPORTANT: If the location of this ESMF build is   !!!
# !!! changed, e.g. libesmf.a is copied to another directory, !!!
# !!! this file - esmf.mk - must be edited to adjust to the   !!!
# !!! correct new path                                        !!!
#
# Please see end of file for options used on this ESMF build
#

#----------------------------------------------
ESMF_VERSION_STRING=8.3.0 beta snapshot
ESMF_VERSION_STRING_GIT=v8.3.0b08-90-g763a12848c
#----------------------------------------------

ESMF_VERSION_MAJOR=8
ESMF_VERSION_MINOR=3
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/apps/appsO/Linux.intel.64.mpt.default
ESMF_LIBSDIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default


ESMF_F90COMPILER=ifort
ESMF_F90LINKER=mpif90

ESMF_F90COMPILEOPTS=-O -fPIC -debug=minimal -assume realloc_lhs -m64 -mcmodel=small -pthread -threads  -qopenmp
ESMF_F90COMPILEPATHS=-I/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/mod/modO/Linux.intel.64.mpt.default -I/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/src/include -I/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/include -I/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.3.0b08-90-g763a12848c' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpt -DESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=
ESMF_F90COMPILEFIXCPP=
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=  -m64 -mcmodel=small -pthread -threads -Wl,--no-as-needed  -qopenmp
ESMF_F90LINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default -L/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib -L/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib 
ESMF_F90ESMFLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default -Wl,-rpath,/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib -Wl,-rpath,/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib 
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default
ESMF_F90LINKLIBS= -lmpi++ -cxxlib -lrt -ldl -lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lnetcdff -lpioc
ESMF_F90ESMFLINKLIBS=-lesmf  -lmpi++ -cxxlib -lrt -ldl -lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lnetcdff -lpioc

ESMF_CXXCOMPILER=icpc
ESMF_CXXLINKER=mpicxx

ESMF_CXXCOMPILEOPTS=-std=c++11 -O -DNDEBUG -fPIC -debug=minimal -m64 -mcmodel=small -pthread  -qopenmp
ESMF_CXXCOMPILEPATHS= -I/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/src/include  -I/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/include -I/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.3.0b08-90-g763a12848c' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpt -DESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2 -D__SDIR__='' -DESMF_CXXSTD=11

ESMF_CXXLINKOPTS=  -m64 -mcmodel=small -pthread -Wl,--no-as-needed  -qopenmp
ESMF_CXXLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default -L/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib -L/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib -L/gpfsm/dulocal/sles12/intel/2020/compilers_and_libraries_2020.4.304/linux/compiler/lib/intel64_lin/
ESMF_CXXESMFLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default -Wl,-rpath,/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib -Wl,-rpath,/usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib  -Wl,-rpath,/gpfsm/dulocal/sles12/intel/2020/compilers_and_libraries_2020.4.304/linux/compiler/lib/intel64_lin/
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default
ESMF_CXXLINKLIBS= -lifport -lifcoremt -limf -lsvml -lm -lipgo -liomp5 -lintlc -lpthread -lsvml -lgcc -lgcc_s -lirc_s -ldl -lrt -ldl -lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lnetcdff -lpioc
ESMF_CXXESMFLINKLIBS=-lesmf  -lifport -lifcoremt -limf -lsvml -lm -lipgo -liomp5 -lintlc -lpthread -lsvml -lgcc -lgcc_s -lirc_s -ldl -lrt -ldl -lnetcdff -lnetcdf -lhdf5_hl -lhdf5 -lnetcdff -lpioc

ESMF_SO_F90COMPILEOPTS=-fPIC -debug=minimal
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CXXCOMPILEOPTS=-fPIC -debug=minimal
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=-Wl,-export-dynamic

ESMF_OPENMP_F90COMPILEOPTS= -qopenmp
ESMF_OPENMP_F90LINKOPTS= -qopenmp
ESMF_OPENMP_CXXCOMPILEOPTS= -qopenmp
ESMF_OPENMP_CXXLINKOPTS= -qopenmp

ESMF_OPENACC_F90COMPILEOPTS=
ESMF_OPENACC_F90LINKOPTS=
ESMF_OPENACC_CXXCOMPILEOPTS=
ESMF_OPENACC_CXXLINKOPTS=

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2/lib/libO/Linux.intel.64.mpt.default/libesmftrace_preload.so
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2
ESMF_INTERNAL_MPIRUN=mpirun -p %g: 

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O_jedwards_pio_update2
# ESMF_OS: Linux
# ESMF_MACHINE: x86_64
# ESMF_ABI: 64
# ESMF_COMPILER: intel
# ESMF_BOPT: O
# ESMF_COMM: mpt
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: ON
# ESMF_OPENACC: OFF
# ESMF_ARRAY_LITE: FALSE
# ESMF_NO_INTEGER_1_BYTE: TRUE
# ESMF_NO_INTEGER_2_BYTE: TRUE
# ESMF_FORTRANSYMBOLS: default
# ESMF_MAPPER_BUILD: OFF
# ESMF_AUTO_LIB_BUILD: ON
# ESMF_DEFER_LIB_BUILD: ON
# ESMF_SHARED_LIB_BUILD: ON
# 
# ESMF environment variables pointing to 3rd party software:
# ESMF_MOAB:              internal
# ESMF_LAPACK:            internal
# ESMF_ACC_SOFTWARE_STACK:            none
# ESMF_NETCDF:            nc-config
# ESMF_NETCDF_INCLUDE:    /usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/include
# ESMF_NETCDF_LIBS:       -lnetcdff -lnetcdf -lhdf5_hl -lhdf5
# ESMF_NETCDF_LIBPATH:    /usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/include
# ESMF_NETCDFF_LIBS:      -lnetcdff
# ESMF_NETCDFF_LIBPATH:   /usr/local/other/netcdf4/4.7.4/intel/19.1.3.304/lib
# ESMF_PIO:               internal
# ESMF_PIO_LIBS:          -lpioc
# ESMF_YAMLCPP:           internal