:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO REMOVE_DIR
IF %1==-file GOTO REMOVE_FILE
IF %1==-lbl GOTO REMOVE_LBL
IF %1==-key GOTO REMOVE_KEY
GOTO END

:REMOVE_DIR --------------------------------------------------------------------
:: VAR_SET ----------------
SET DIR=%2
:: VAR_CUT-----------------
SET DIR=%DIR:~1%
SET DIR=%REG%\%DIR:~0,-1%
:: ------------------------
IF NOT EXIST "%DIR%" GOTO END
RMDIR /Q /S "%DIR%"
GOTO END

:REMOVE_FILE -------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
DEL "%FILE%"
GOTO END

:REMOVE_LBL --------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LABEL=%3
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
INIFILE /remove %FILE% %LABEL%
GOTO END

:REMOVE_KEY --------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LABEL=%3
SET KEY=%4
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
INIFILE %FILE% %LABEL% %KEY%=
GOTO END

:END ---------------------------------------------------------------------------
SET DIR=
SET FILE=
SET LABEL=
SET KEY=
SET VALUE=