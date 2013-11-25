:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\sys_set" MD "%RAM%\SYSTEM\controlp\sys_set"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sec_cen.xml:MENU
IF %ERRORLEVEL%==1 GOTO UPDATE_SETTING
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:UPDATE_SETTING ----------------------------------------------------------------
CLS
SET ERRORLEVEL=
CALL "includes\upd_set\upd_set.bat"
SET ERRORLEVEL=
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=