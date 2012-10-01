:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir (
  :: VAR_SET ----------------
  SET DIR=%2
  :: VAR_CUT-----------------
  SET DIR=%DIR:~1%
  SET DIR=%REG%\%DIR:~0,-1%
  :: ------------------------
  GOTO CREATE_DIR
)
IF %1==-file (
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
  GOTO CREATE_FILE
)
IF %1==-key (
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
  GOTO CREATE_KEY
)
GOTO END

:CREATE_DIR --------------------------------------------------------------------
IF EXIST "%DIR%" GOTO END
MKDIR "%DIR%"
GOTO END

:CREATE_FILE -------------------------------------------------------------------
IF EXIST "%FILE%" GOTO END
IF NOT EXIST "%FILE%" ECHO %LABEL%>"%FILE%"
INIFILE %FILE% %LABEL% %KEY%=%VALUE%
GOTO END

:CREATE_KEY --------------------------------------------------------------------
IF NOT EXIST "%FILE%" GOTO END
INIFILE %FILE% %LABEL% %KEY%=%VALUE%
GOTO END

:END ---------------------------------------------------------------------------
SET FILE=
SET LABEL=
SET KEY=
SET VALUE=