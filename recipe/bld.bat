set TILEDB_CONDA_BUILD=1

set CMAKE_BUILD_TYPE=Release
set DOWNLOAD_TILEDB_PREBUILT=OFF
set BUILD_TESTS=OFF
set USE_MKL_CBLAS=OFF
cd apis\python
"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1
