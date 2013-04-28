:SETUP_CHECK -------------------------------------------------------------------
CLS
IF %1==-setup GOTO SETUP
IF NOT %1==-setup GOTO PROPER

:SETUP -------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==APP_NAME CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY] name %%b
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY] link "bin\mods\security.ap_app"  
CALL "$reg" /if_exist -lbl KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY]
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do (
  IF %if_exist%==true IF %%a==SUCCES WBAT BOX %%b OK
  IF %if_exist%==false IF %%a==FAIL WBAT BOX %%b OK
)
GOTO END

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
CALL "W.BAT" box @langs\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO QUICK_SECURE
IF %ERRORLEVEL%==2 GOTO CRYPTING
IF %ERRORLEVEL%==3 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:QUICK_SECURE ------------------------------------------------------------------
CLS
CALL "W.BAT" box @langs\%AP_LANG%.xml:QUICK_SECURE
IF %ERRORLEVEL%==1 CALL "includes\qck_sec.bat" -lock
IF %ERRORLEVEL%==2 CALL "includes\qck_sec.bat" -unlock
IF %ERRORLEVEL%==3 GOTO MEMU
IF %ERRORLEVEL%==100 GOTO MEMU
GOTO QUICK_SECURE

:CRYPTING ----------------------------------------------------------------------
CLS
CALL "W.BAT" box @langs\%AP_LANG%.xml:CRYPTING
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