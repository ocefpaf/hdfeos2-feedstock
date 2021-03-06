#!/bin/sh

export CC=${PREFIX}/bin/h4cc
export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib
export CFLAGS="-fPIC"

./configure --prefix=${PREFIX} \
            --with-hdf4=${PREFIX} \
            --with-zlib=${PREFIX} \
            --with-jpeg=${PREFIX} \
            --enable-install-include

make
make check
make install

pushd include
make install-includeHEADERS
popd

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
