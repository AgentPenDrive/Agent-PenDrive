:CHECK -------------------------------------------------------------------------
IF %1==-clear CALL "%COMDIR%\includes\clear.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==-load CALL "%COMDIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==-load_defaults CALL "%COMDIR%\includes\load_defaults.bat" %2 %3 %4 %5 %6 %7 %8 %9