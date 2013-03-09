:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM" MD "%RAM%\SYSTEM"
:: WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\Polish.xml:COPYRIGHT

:SETUP -------------------------------------------------------------------------
CLS
CALL "$run" %SYSTEM_DIR%\includes\setup\setup.ap_app

:UPDATER -----------------------------------------------------------------------
CLS
CALL "$run" %SYSTEM_DIR%\includes\updater\updater.ap_app

:ACCESER -----------------------------------------------------------------------
CLS
CALL "$run" %SYSTEM_DIR%\includes\acceser\acceser.ap_app
IF %ACCESER%=="" GOTO ACCESER
IF %ACCESER%==true (
SET ACCESER=
GOTO MENU
)
IF %ACCESER%==false (
SET ACCESER=
GOTO ACCESER
)
IF %ACCESER%==EXIT (
SET ACCESER=
GOTO END
)

:MENU --------------------------------------------------------------------------
CLS
:: -------------------------------------
IF %AP_USERNAME%=="" GOTO ACCESER
SET MENU_TIME=%TIME:~0,5%
SET MENU_DATE=%DATE%
:: -------------------------------------
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO USER_MENU
IF %ERRORLEVEL%==2 CALL "$run" %SYSTEM_DIR%\includes\modules\modules.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==3 CALL "$run" %SYSTEM_DIR%\includes\downloads\downloads.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==4 CALL "$run" %SYSTEM_DIR%\includes\apps\apps.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==5 CALL "$run" %SYSTEM_DIR%\includes\controlp\controlp.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==6 CALL "$run" %SYSTEM_DIR%\includes\help\help.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==7 CALL "$run" %SYSTEM_DIR%\includes\run\run.ap_app & SET ERRORLEVEL=
IF %ERRORLEVEL%==8 GOTO END
IF %ERRORLEVEL%==9 (
  CLS
  SET
  PAUSE
  CLS
)
IF %ERRORLEVEL%==100 SET AP_USERNAME="" & GOTO ACCESER
GOTO MENU

:USER_MENU ---------------------------------------------------------------------
CLS
CALL "$copyright" /down
WBAT BOX @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:USER_MENU
IF %ERRORLEVEL%==1 SET AP_USERNAME="" & GOTO END
IF %ERRORLEVEL%==2 SET AP_USERNAME="" & GOTO ACCESER
IF %ERRORLEVEL%==3 GOTO MENU
IF %ERRORLEVEL%==100 GOTO MENU
GOTO USER_MENU

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM" RMDIR /Q /S "%RAM%\SYSTEM"
SET MENU_TIME=
SET MENU_DATE=