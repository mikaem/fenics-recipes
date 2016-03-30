#!/bin/bash

export LIBRARY_PATH=$PREFIX/lib

./configure \
  --prefix=$PREFIX \
  --download-fblaslapack=yes \
  --with-mpi-dir=$PREFIX \
  --download-metis \
  --download-parmetis \
  --download-hypre \
  --download-scalapack \
  --download-mumps \
  --download-superlu_dist \
  --download-suitesparse \
  --with-shared-libraries

make
make install

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
