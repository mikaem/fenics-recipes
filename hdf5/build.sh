#!/bin/bash

# ln -s $PREFIX/bin/gfortran $PREFIX/bin/f95

./configure --prefix=$PREFIX --enable-linux-lfs --with-zlib=$PREFIX --with-ssl --enable-parallel --enable-shared
make
make install

rm -rf $PREFIX/share/hdf5_examples
