#!/bin/bash
set -x -e
cd ${SRC_DIR}/build
make install

cd $PREFIX
rm -rf libexec share bin include
mv lib lib2
mkdir lib
if [[ "$PKG_NAME" == "libclang-cpp" ]]; then
    mv lib2/${PKG_NAME}${SHLIB_EXT} lib/
else
    mv lib2/libclang-cpp.*.* lib/
fi
rm -rf lib2

