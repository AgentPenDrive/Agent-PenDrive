:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\env" MD "%RAM%\KERNEL\env"

:CHECK -------------------------------------------------------------------------
IF %1==-clear CALL "%COMDIR%\includes\clear.bat"
IF %1==-kill_all CALL "%COMDIR%\includes\kill_all.bat"
IF %1==-load CALL "%COMDIR%\includes\load.bat"
IF %1==-load_defaults CALL "%COMDIR%\includes\load_defaults.bat"
GOTO END

:END ---------------------------------------------------------------------------