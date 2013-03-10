:MENU --------------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\updater\%AP_LANG%.xml:OPTION
IF %ERRORLEVEL%==1 GOTO CHECK
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==3 GOTO INFO
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:CHECK -------------------------------------------------------------------------
CLS
CALL "includes\check.bat"

:: TRUE - UPDATE IS AVAILABLE ------------------------------
IF %RESULT%==true GOTO DOWNLOAD
:: FALSE - UPDATE IS NOT AVAILABLE -------------------------
IF %RESULT%==false GOTO END
GOTO CHECK

:DOWNLOAD ----------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\updater\%AP_LANG%.xml:AVAILABLE
IF %ERRORLEVEL%==1 CALL "includes\download.bat"
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==3 GOTO INFO
IF %ERRORLEVEL%==100 GOTO END
GOTO END

:INFO --------------------------------------------------------------------------
CLS
CALL "includes\info.bat"
GOTO END

:END ----------------------------------------------------------------------------
CLS
RMDIR /Q /S "%AP_TMP%\SYSTEM\updater"
SET ERRORLEVEL=
SET RESULT=