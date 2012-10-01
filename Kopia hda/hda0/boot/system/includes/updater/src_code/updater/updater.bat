:OPTION ------------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\updater\%AP_LANG%.xml:OPTION
IF %ERRORLEVEL%==1 GOTO CHECK
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==3 GOTO INFO
IF %ERRORLEVEL%==100 GOTO END
GOTO OPTION

:CHECK -------------------------------------------------------------------------
CLS
CALL "includes\check.bat"

:: TRUE - UPDATE IS AVAILABLE ------------------------------
IF %RESULT%==true (
  CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\updater\%AP_LANG%.xml:AVAILABLE
  IF %ERRORLEVEL%==1 GOTO DOWNLOAD
  IF %ERRORLEVEL%==2 GOTO END
  IF %ERRORLEVEL%==3 GOTO INFO
  IF %ERRORLEVEL%==100 GOTO END
)
:: FALSE - UPDATE IS NOT AVAILABLE -------------------------
IF %RESULT%==false GOTO END
GOTO CHECK

:DOWNLOAD ----------------------------------------------------------------------
CLS
CALL "includes\download.bat"
GOTO END

:INFO --------------------------------------------------------------------------
CLS
CALL "includes\info.bat"
GOTO END

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
SET RESULT=
