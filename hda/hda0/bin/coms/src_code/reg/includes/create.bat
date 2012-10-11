:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO CREATE_DIR
IF %1==-file GOTO CREATE_FILE
IF %1==-key GOTO CREATE_KEY
GOTO END

:CREATE_DIR --------------------------------------------------------------------
:: VAR_SET ----------------
SET DIR=%2
:: VAR_CUT-----------------
SET DIR=%DIR:~1%
SET DIR=%REG%\%DIR:~0,-1%
:: ------------------------
IF EXIST "%DIR%" GOTO END
MKDIR "%DIR%"
GOTO END

:CREATE_FILE -------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LABEL=%3
SET KEY=%4
SET VALUE=%5
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
SET VALUE=%VALUE:~1%
SET VALUE=%VALUE:~0,-1%
:: ------------------------
IF EXIST "%FILE%" GOTO END
IF NOT EXIST "%FILE%" ECHO %LABEL%>"%FILE%"
INIFILE %FILE% %LABEL% %KEY%=%VALUE%
GOTO END

:CREATE_KEY --------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%2
SET LABEL=%3
SET KEY=%4
SET VALUE=%5
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
SET VALUE=%VALUE:~1%
SET VALUE=%VALUE:~0,-1%
:: ------------------------
IF NOT EXIST "%FILE%" GOTO END
INIFILE %FILE% %LABEL% %KEY%=%VALUE%
GOTO END

:END ---------------------------------------------------------------------------
SET FILE=
SET LABEL=
SET KEY=
SET VALUE=