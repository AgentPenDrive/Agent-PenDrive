:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO LIST_DIR
IF %1==-key GOTO LIST_KEY
IF %1==-lbl GOTO LIST_LBL
IF %1==-value GOTO LIST_VALUE
GOTO END

:LIST_DIR ----------------------------------------------------------------------
IF NOT EXIST "%REG%\%2" GOTO END
DIR "%REG%\%2\" /B /AD >>"%3"
GOTO END

:LIST_KEY ----------------------------------------------------------------------
IF NOT EXIST "%REG%\%2" GOTO END
DIR "%REG%\%2\*.ap_ini" /B /AD >>"%3"
GOTO END

:LIST_LBL ----------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
FOR /F "tokens=1,2 delims==" %%a in (%REG%\%2.ap_ini) do CALL "%COMDIR%\includes\list\includes\list_lbl.bat" %%a %3
GOTO END

:LIST_VALUE --------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%REG%\%2.ap_ini) do CALL "%COMDIR%\includes\list\includes\list_value.bat" %%a %3
GOTO END

:END ---------------------------------------------------------------------------
SET CHAR=
