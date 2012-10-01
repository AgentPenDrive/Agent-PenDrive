:INITIAL_SETUP -----------------------------------------------------------------
CLS
SET LOGIN=
SET PASS=
GOTO MENU

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\acceser\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO CHECK
IF %ERRORLEVEL%==2 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:CHECK -------------------------------------------------------------------------
CLS
CALL "includes\check.bat"
IF %ACCESER%==true GOTO END
IF %ACCESER%==false GOTO MENU
GOTO END

:EXIT --------------------------------------------------------------------------
CLS
SET ACCESER=EXIT
GOTO END

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
SET LOGIN=
SET PASS=
