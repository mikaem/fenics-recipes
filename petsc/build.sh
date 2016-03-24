#!/bin/bash

export LIBRARY_PATH=$PREFIX/lib

ln -s $PREFIX/bin/gfortran $PREFIX/bin/f95

./configure \
  --prefix=$PREFIX \
  --with-blas-lapack-lib=libopenblas.so \
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

# Add more build steps here, if they are necessary.
# rm $PREFIX/bin/f95

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
