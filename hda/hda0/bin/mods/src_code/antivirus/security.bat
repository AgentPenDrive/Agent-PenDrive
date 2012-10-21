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
IF NOT EXIST "%RAM%\MODULES\antivirus" MD "%RAM%\MODULES\antivirus"
:: SET_DEFAULT_LANG
:: CALL "$def_lang" security
:: ------------------------------------------------

:MEMU --------------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO FAST_SCANING
IF %ERRORLEVEL%==2 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU


:FAST_SCANING ------------------------------------------------------------------
IF EXIST "RAPORT.TXT" DEL "RAPORT.TXT"
CALL "clarv.com" \s Rpt a>RAPORT.TXT
CLS

:RAPORT_TYPE
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:RAPORT
IF %ERRORLEVEL%==1 GOTO RAPORT
IF %ERRORLEVEL%==2 GOTO MENU
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO RAPORT_TYPE



:RAPORT ------------------------------------------------------------------------
CLS
TYPE "RAPORT.TXT"
PAUSE
GOTO MENU


:EXIT --------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\MODULES\antivirus" RMDIR /Q /S "%RAM%\MODULES\antivirus"
SET MENU_TIME=
SET MENU_DATE=

:END ---------------------------------------------------------------------------
CLS