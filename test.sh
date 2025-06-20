#!/bin/sh
set -e
export MPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
make clean
sed -i 's/CUDA_ENABLER =.*/CUDA_ENABLER =/g' MakeSettings.mk
make -j -j$(nproc) all
llog ./run -i ./test/test_confs/cpu_4x4_gmres.ini && code .log.txt &
