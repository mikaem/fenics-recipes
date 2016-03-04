#!/bin/bash

export CC=mpicc
$PYTHON setup.py configure --mpi --hdf5=$PREFIX
$PYTHON setup.py build_ext
$PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
