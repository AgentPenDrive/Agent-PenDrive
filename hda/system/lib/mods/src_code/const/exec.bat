:CHECK -------------------------------------------------------------------------
IF %1==-clear CALL "%MODDIR%\includes\clear.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==-load CALL "%MODDIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==-load_defaults CALL "%MODDIR%\includes\load_defaults.bat" %2 %3 %4 %5 %6 %7 %8 %9