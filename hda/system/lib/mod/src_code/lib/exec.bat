:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib" MD "%RAM%\KERNEL\lib"

:CHECK -------------------------------------------------------------------------
IF %1==/dll GOTO DLL
IF %1==/sol GOTO SOL
IF %1==/sys GOTO SYS
GOTO END

:DLL ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\dll" MD "%RAM%\KERNEL\lib\dll"
IF %2==-clear_cache CALL "%MODDIR%\includes\dll\clear_cache.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-free CALL "%MODDIR%\includes\dll\free.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load CALL "%MODDIR%\includes\dll\load.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load_defaults CALL "%MODDIR%\includes\dll\load_defaults.bat" %3 %4 %5 %6 %7 %8 %9
GOTO END

:SHL ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\sol" MD "%RAM%\KERNEL\lib\shl"
IF %2==-clear_cache CALL "%MODDIR%\includes\shl\clear_cache.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-free CALL "%MODDIR%\includes\shl\free.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load CALL "%MODDIR%\includes\shl\load.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load_defaults CALL "%MODDIR%\includes\shl\load_defaults.bat" %3 %4 %5 %6 %7 %8 %9
GOTO END

:SYS ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\sys" MD "%RAM%\KERNEL\lib\sys"
IF %2==-clear_cache CALL "%MODDIR%\includes\sys\clear_cache.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-kill_all CALL "%MODDIR%\includes\sys\free.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load CALL "%MODDIR%\includes\sys\load.bat" %3 %4 %5 %6 %7 %8 %9
IF %2==-load_defaults CALL "%MODDIR%\includes\sys\load_defaults.bat" %3 %4 %5 %6 %7 %8 %9
GOTO END

:END ---------------------------------------------------------------------------