set TILEDB_CONDA_BUILD=1

cd apis\python
"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1
