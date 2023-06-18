#!/bin/sh
set -exo pipefail

# Use CC/CXX wrappers to disable -Werror
export NN_CXX_ORIG=$CXX
export NN_CC_ORIG=$CC
export CXX=$RECIPE_DIR/cxx_wrap.sh
export CC=$RECIPE_DIR/cc_wrap.sh
if [ ! -z ${MACOSX_DEPLOYMENT_TARGET}]; then
    export CMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}
fi

#CURL_LIBS_APPEND=`$PREFIX/bin/curl-config --libs`
#export LDFLAGS="${LDFLAGS} ${CURL_LIBS_APPEND}"

#if [[ $target_platform  == linux-64 ]]; then
#  export LDFLAGS="${LDFLAGS} -Wl,--no-as-needed -lrt"
#fi
#
#if [[ $target_platform == osx-arm64  ]]; then
#  export FILE_COMMAND_OVERRIDE=`which file`
#fi

#cd src
#mkdir build && cd build
#cmake ${CMAKE_ARGS} \
#  -DOVERRIDE_INSTALL_PREFIX=OFF \
#  -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
#  #-DCMAKE_INSTALL_PREFIX:PATH="../../api/python/src/tiledb/vector_search" \
#  -DCMAKE_BUILD_TYPE=Release \
#  -DCMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET} \
#  -DDOWNLOAD_TILEDB_PREBUILT=OFF \
#  -DBUILD_TESTS=OFF \
#  -DUSE_MKL_CBLAS=OFF \
#  ..
#make -j ${CPU_COUNT}
#make -C libtiledbvectorsearch install

#PYTHONPATH=/tmp/build/libtiledbvectorsearch/python/src/tiledb/vector_search
cd apis/python
#$PYTHON setup.py install --single-version-externally-managed --record record.txt --libtiledbvectorsearch="${PREFIX}"
export CMAKE_BUILD_TYPE=Release
export DOWNLOAD_TILEDB_PREBUILT=OFF
export BUILD_TESTS=OFF
export USE_MKL_CBLAS=OFF
$PYTHON setup.py install --single-version-externally-managed --record record.txt
#&& pip install -e .
