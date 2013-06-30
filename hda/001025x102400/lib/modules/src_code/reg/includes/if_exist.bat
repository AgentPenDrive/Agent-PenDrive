IF %1==-dir GOTO IF_EXIST_DIR
IF %1==-file GOTO IF_EXIST_FILE
IF %1==-lbl GOTO IF_EXIST_LBL
IF %1==-key GOTO IF_EXIST_KEY
IF %1==-value GOTO IF_EXIST_VALUE
GOTO END

:: -----------------------------------------------------------------------------

:IF_EXIST_DIR ----------------------------------------------
:: VAR_SET ----------------
SET DIR=%2
:: VAR_CUT-----------------
SET DIR=%DIR:~1%
SET DIR=%REG%\%DIR:~0,-1%.ap_ini
:: ------------------------
IF EXIST "%DIR%" GOTO EXIST
IF NOT EXIST "%DIR%" GOTO NOT_EXIST
GOTO IF_EXIST_DIR

:IF_EXIST_FILE ---------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
:: ------------------------
IF EXIST "%FILE%" GOTO EXIST
IF NOT EXIST "%FILE%" GOTO NOT_EXIST
GOTO IF_EXIST_KEY

:IF_EXIST_LBL ----------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LABEL=%3
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO NOT_EXIST
FOR /F "tokens=1 delims=" %%a in (%FILE%) do IF "%%a"=="%LABEL%" GOTO EXIST
GOTO NOT_EXIST
GOTO IF_EXIST_LBL

:IF_EXIST_KEY ----------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET KEY=%3
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO NOT_EXIST
FOR /F "eol=[ tokens=1 delims==" %%a in (%FILE%) do IF "%%a"=="%KEY%" GOTO EXIST
GOTO NOT_EXIST
GOTO IF_EXIST_VALUE

:IF_EXIST_VALUE --------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET VALUE=%5
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET VALUE=%VALUE:~1%
SET VALUE=%VALUE:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO NOT_EXIST
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%FILE%) do IF "%%b"=="%VALUE%" GOTO EXIST
GOTO NOT_EXIST
GOTO IF_EXIST_VALUE

:: -----------------------------------------------------------------------------

:EXIST -----------------------------------------------------
SET if_exist=true
GOTO END

:NOT_EXIST -------------------------------------------------
SET if_exist=false
GOTO END

:: -----------------------------------------------------------------------------

:END -------------------------------------------------------
SET DIR=
SET FILE=
SET LABEL=
SET KEY=
SET VALUE=