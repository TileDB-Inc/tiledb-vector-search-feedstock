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

cd apis/python
export CMAKE_BUILD_TYPE=Release
export DOWNLOAD_TILEDB_PREBUILT=OFF
export BUILD_TESTS=OFF
export USE_MKL_CBLAS=OFF
$PYTHON setup.py install --single-version-externally-managed --record record.txt
