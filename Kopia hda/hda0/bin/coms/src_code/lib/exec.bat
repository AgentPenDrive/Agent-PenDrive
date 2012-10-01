:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib" MD "%RAM%\KERNEL\lib"

:CHECK -------------------------------------------------------------------------
IF %1==/dll GOTO DLL
IF %1==/sys GOTO SYS
GOTO END

:DLL ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\dll" MD "%RAM%\KERNEL\lib\dll"
IF %2==-clear_cache CALL "%COMDIR%\includes\dll\clear_cache.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-kill_all CALL "%COMDIR%\includes\dll\kill_all.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load CALL "%COMDIR%\includes\dll\load.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load_defaults CALL "%COMDIR%\includes\dll\load_defaults.bat" %3 %4 %5 %6 %7 %8 %9
GOTO END

:SYS ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\sys" MD "%RAM%\KERNEL\lib\sys"
IF %2==-clear_cache CALL "%COMDIR%\includes\sys\clear_cache.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-kill_all CALL "%COMDIR%\includes\sys\kill_all.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load CALL "%COMDIR%\includes\sys\load.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load_defaults CALL "%COMDIR%\includes\sys\load_defaults.bat" %3 %4 %5 %6 %7 %8 %9
GOTO END

:END ---------------------------------------------------------------------------