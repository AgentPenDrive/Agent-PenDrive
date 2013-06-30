:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO LIST_DIR
IF %1==-file GOTO LIST_FILE
IF %1==-lbl GOTO LIST_LBL
IF %1==-key GOTO LIST_KEY
GOTO END

:LIST_DIR ----------------------------------------------------------------------
:: VAR_SET ----------------
SET DIR=%2
SET LIST_FILE=%3
:: VAR_CUT-----------------
SET DIR=%DIR:~1%
SET DIR=%REG%\%DIR:~0,-1%
SET LIST_FILE=%LIST_FILE:~1%
SET LIST_FILE=%LIST_FILE:~0,-1%
:: ------------------------
IF NOT EXIST "%DIR%" GOTO END
DIR "%DIR%\" /B /AD>>"%LIST_FILE%"
GOTO END

:LIST_FILE ---------------------------------------------------------------------
:: VAR_SET ----------------
SET DIR=%2
SET LIST_FILE=%3
:: VAR_CUT-----------------
SET DIR=%DIR:~1%
SET DIR=%REG%\%DIR:~0,-1%
SET LIST_FILE=%LIST_FILE:~1%
SET LIST_FILE=%LIST_FILE:~0,-1%
:: ------------------------
IF NOT EXIST "%DIR%" GOTO END
DIR "%DIR%\*.ap_ini" /B /AD>>"%LIST_FILE%"
GOTO END

:LIST_LBL ----------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LIST_FILE=%3
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LIST_FILE=%LIST_FILE:~1%
SET LIST_FILE=%LIST_FILE:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
SET CHAR=
FOR /F "tokens=1,2 delims==" %%a in (%FILE%) do CALL "%COMDIR%\includes\list\includes\list_lbl.bat" "%%a"
SET CHAR=
GOTO END

:LIST_KEY ----------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LIST_FILE=%3
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LIST_FILE=%LIST_FILE:~1%
SET LIST_FILE=%LIST_FILE:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%FILE%) do CALL "%COMDIR%\includes\list\includes\list_key.bat" "%%a"
GOTO END

:END ---------------------------------------------------------------------------
SET DIR=
SET FILE=
SET LABEL=
SET KEY=
SET VALUE=