:SETUP_CHECK -------------------------------------------------------------------
CLS
IF %1==/setup (
  CALL "$setup\setup.bat" %2 %3 %4 %5 %6 %7 %8 %9
  GOTO END
)

:PROPER ------------------------------------------------------------------------
CLS
SET MENU_TIME=%TIME:~0,5%
SET MENU_DATE=%DATE%
:: CREATE_security_DIR
IF NOT EXIST "%RAM%\MODULES\security" MD "%RAM%\MODULES\security"
:: SET_DEFAULT_LANG
:: CALL "$def_lang" security
:: ------------------------------------------------

:MEMU --------------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO QUICK_SECURE
IF %ERRORLEVEL%==2 GOTO CRYPTING
IF %ERRORLEVEL%==3 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:QUICK_SECURE ------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:QUICK_SECURE
IF %ERRORLEVEL%==1 CALL "includes\qck_sec.bat" -lock
IF %ERRORLEVEL%==2 CALL "includes\qck_sec.bat" -unlock
IF %ERRORLEVEL%==3 GOTO MEMU
IF %ERRORLEVEL%==100 GOTO MEMU
GOTO QUICK_SECURE

:CRYPTING ----------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:CRYPTING
IF %ERRORLEVEL%==1 CALL "includes\crypting.bat" -encrypt
IF %ERRORLEVEL%==2 CALL "includes\crypting.bat" -decrypt
IF %ERRORLEVEL%==3 GOTO MEMU
IF %ERRORLEVEL%==100 GOTO MEMU
GOTO CRYPTING

:EXIT --------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\MODULES\security" RMDIR /Q /S "%RAM%\MODULES\security"
SET MENU_TIME=
SET MENU_DATE=

:END ---------------------------------------------------------------------------
CLS