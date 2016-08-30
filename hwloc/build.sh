export CC=$PREFIX/bin/gcc
export CXX=$PREFIX/bin/g++
./configure --prefix=$PREFIX --disable-libnuma --disable-libxml2
make 
make install