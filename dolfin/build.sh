#!/bin/bash

mkdir build
cd build

CC=mpicc
CXX=mpic++

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include
export HDF5_ROOT=$PREFIX
export BLAS_DIR=$PREFIX
export UMFPACK_DIR=$PREFIX
# To make dolfin pick up anaconda swig:
ln -s ${PREFIX}/bin/swig ${PREFIX}/bin/swig3.0


cmake .. \
  -DDOLFIN_ENABLE_VTK:BOOL=FALSE \
  -DDOLFIN_ENABLE_QT:BOOL=FALSE \
  -DDOLFIN_ENABLE_SCOTCH:BOOL=FALSE \
  -DDOLFIN_ENABLE_PASTIX:BOOL=FALSE \
  -DDOLFIN_ENABLE_TRILINOS:BOOL=FALSE \
  -DDOLFIN_ENABLE_PARMETIS:BOOL=TRUE \
  -DDOLFIN_ENABLE_SLEPC4PY:BOOL=FALSE \
  -DDOLFIN_ENABLE_UNIT_TESTS:BOOL=FALSE \
  -DDOLFIN_ENABLE_HDF5:BOOL=TRUE \
  -DCMAKE_C_COMPILER=$CC \
  -DCMAKE_CXX_COMPILER=$CXX \
  -DHDF5_C_COMPILER_EXECUTABLE=$PREFIX/bin/h5pcc \
  -DHDF5_CXX_COMPILER_EXECUTABLE=$PREFIX/bin/h5pcc \
  -DCMAKE_LIBRARY_PATH="$LIBRARY_PATH;/lib/x86_64-linux-gnu/" \
  -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
  -DCMAKE_INSTALL_RPATH:STRING="${PREFIX}/lib" \
  -DBoost_INCLUDE_DIR=$INCLUDE_PATH \
  -DBoost_LIBRARY_DIRS=$LIBRARY_PATH \
  -DBoost_FILESYSTEM_LIBRARY=$LIBRARY_PATH/libboost_filesystem.so \
  -DMPI_C_LIBRARIES=$LIBRARY_PATH/libmpich.so \
  -DMPI_C_INCLUDE_PATH=$INCLUDE_PATH \
  -DMPI_CXX_LIBRARIES=$LIBRARY_PATH/libmpichcxx.so \
  -DMPI_CXX_INCLUDE_PATH=$INCLUDE_PATH \
  -DMPI_Fortran_LIBRARIES=$LIBRARY_PATH/libmpichf90.so \
  -DMPI_Fortran_INCLUDE_PATH=$INCLUDE_PATH

make -j${CPU_COUNT}
make install
