:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\sys_set" MD "%RAM%\SYSTEM\controlp\sys_set"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\sys_set.xml:MENU
IF %ERRORLEVEL%==1 GOTO APP_MAN
IF %ERRORLEVEL%==2 GOTO USR_ACC
IF %ERRORLEVEL%==3 GOTO UPDATE_SETTING
IF %ERRORLEVEL%==4 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:APP_MAN -----------------------------------------------------------------------
CLS
SET ERRORLEVEL=
CALL "includes\app_man\app_man.bat"
SET ERRORLEVEL=
GOTO MENU

:USR_ACC -----------------------------------------------------------------------
CLS
SET ERRORLEVEL=
CALL "includes\usr_acc\usr_acc.bat"
SET ERRORLEVEL=
GOTO MENU

:UPDATE_SETTING ----------------------------------------------------------------
CLS
SET ERRORLEVEL=

SET ERRORLEVEL=
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=