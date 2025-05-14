@echo off
setlocal EnableDelayedExpansion

echo --------------------------------------------------
echo     Hope Supply Co. Geocoding Script Launcher
echo --------------------------------------------------
echo.
echo This helper will run the geocoding script using
echo ArcGIS Pro’s Python environment.
echo.

echo STEPS TO CONFIGURE:
echo  1) Locate your ArcGIS Pro install folder, e.g.:
echo     C:\Program Files\ArcGIS\Pro
echo  2) Open the subfolder:\Python\envs\arcgispro-py3\
echo  3) Copy the full path to python.exe in that folder.
echo  4) In the next screen, paste that path into this file.
echo.
pause

rem === EDIT BELOW: Paste your python.exe path between the quotes ===
set "PYTHON_EXE=PASTE_FULL_PATH_TO_arcgispro-py3\python.exe"
rem === END EDIT ===

echo.
echo Which geocoding script do you want to run?
echo    1 - Single-location (hopeSupplyGeocodingPartners.py)
echo    2 - Multi-location  (hopeSupplyGeocodingMulti.py)
echo.
set /p choice="Enter 1 or 2, then press ENTER: "

if "%choice%"=="1" (
    set "SCRIPT=%~dp0hopeSupplyGeocodingPartners.py"
) else if "%choice%"=="2" (
    set "SCRIPT=%~dp0hopeSupplyGeocodingMulti.py"
) else (
    echo.
    echo Invalid choice. Please run this launcher again.
    pause
    endlocal
    exit /b 1
)

echo.
echo Running: %SCRIPT%
echo using Python: %PYTHON_EXE%
echo.
"%PYTHON_EXE%" "%SCRIPT%"

if ERRORLEVEL 1 (
    echo.
    echo [ERROR] The script did not complete successfully.
    echo Check the messages above, fix any issues, and try again.
) else (
    echo.
    echo [SUCCESS] Geocoding finished without errors!
)

echo.
pause
endlocal
