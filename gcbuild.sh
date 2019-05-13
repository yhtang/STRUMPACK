if [[ $1 == "r" ]];
then
rm -rf build
mkdir build
fi
cd build

cmake .. \
-DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_INSTALL_PREFIX=. \
-DCMAKE_C_COMPILER=/Users/gichavez/Documents/local/openmpi-2.1.1/build/bin/mpicc \
-DCMAKE_CXX_COMPILER=/Users/gichavez/Documents/local/openmpi-2.1.1/build/bin/mpicxx \
-DCMAKE_Fortran_COMPILER=/Users/gichavez/Documents/local/openmpi-2.1.1/build/bin/mpifort \
-DSTRUMPACK_USE_MPI=ON \
-DSTRUMPACK_USE_OPENMP=ON \
-DSTRUMPACK_COUNT_FLOPS=OFF \
-DMY_FLAGS="-DPRINT_COUNTERS=0" \
-DBUILD_SHARED_LIBS=OFF \
-DSTRUMPACK_USE_SCOTCH=OFF \
-DSTRUMPACK_DEV_TESTING=OFF \
-DSTRUMPACK_BUILD_TESTS=OFF \
-DSTRUMPACK_C_INTERFACE=OFF \
-DSTRUMPACK_TASK_TIMERS=OFF \
-DSTRUMPACK_USE_COMBBLAS=OFF \
-DSTRUMPACK_USE_PARMETIS=OFF \
-DCMAKE_EXE_LINKER_FLAGS="-dynamic -Wl,-undefined,error" \
-DTPL_METIS_INCLUDE_DIRS="/usr/local/Cellar/metis/5.1.0/include" \
-DTPL_METIS_LIBRARIES="/usr/local/Cellar/metis/5.1.0/lib/libmetis.dylib" \
-DTPL_BLAS_LIBRARIES="/usr/local/Cellar/openblas/0.2.20_1/lib/libblas.dylib" \
-DTPL_LAPACK_LIBRARIES="/usr/local/Cellar/openblas/0.2.20_1/lib/liblapack.dylib" \
-DTPL_SCALAPACK_LIBRARIES="/Users/gichavez/Documents/local/scalapack-2.0.2/libscalapack.a"

make -j install VERBOSE=1
cd examples
make