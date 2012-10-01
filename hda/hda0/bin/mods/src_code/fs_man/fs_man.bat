:SETUP_CHECK -------------------------------------------------------------------
CLS
IF %1==-setup GOTO SETUP
IF NOT %1==-setup GOTO PROPER

:SETUP -------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==APP_NAME CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\modules\conf [FS_MAN] name %%b
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [FS_MAN] link "bin\mods\fs_man.ap_app"  
CALL "$reg" /if_exist -lbl KEY_LOCAL_CONFIG\SYSTEM\modules\conf [FS_MAN]
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
IF NOT EXIST "%RAM%\SYSTEM\fs_man" MD "%RAM%\SYSTEM\fs_man"

:: SET_DEFAULT_LANG
:: CALL "$def_lang" fs_man

:: ------------------------------------------------

:MEMU --------------------------------------------------------------------------
CLS
CALL "W.BAT" box @langs\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO SCAN
IF %ERRORLEVEL%==2 GOTO REPAIR_ERRORS
IF %ERRORLEVEL%==3 GOTO RECOVER_DATA
IF %ERRORLEVEL%==4 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:SCAN --------------------------------------------------------------------------
CLS
CALL "includes\scan.bat"
PAUSE
GOTO MEMU

:REPAIR_ERRORS -----------------------------------------------------------------
CLS
CALL "includes\repair_errors.bat"
PAUSE
GOTO MEMU

:RECOVER_DATA ------------------------------------------------------------------
CLS
CALL "includes\recover_data.bat"
PAUSE
GOTO MEMU

:EXIT --------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\fs_man" RMDIR /Q /S "%RAM%\MODULES\fs_man"
SET MENU_TIME=
SET MENU_DATE=

:END ---------------------------------------------------------------------------
CLS
