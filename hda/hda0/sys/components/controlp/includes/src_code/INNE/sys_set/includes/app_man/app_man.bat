:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\sys_set\app_man" MD "%RAM%\SYSTEM\controlp\sys_set\app_man"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\list.xml"
CALL "$reg" /list -lbl KEY_LOCAL_CONFIG\SYSTEM\apps\conf %RAM%\SYSTEM\controlp\sys_set\app_man\$list.ap_ini
SORT "%RAM%\SYSTEM\controlp\sys_set\app_man\$list.ap_ini" /O "%RAM%\SYSTEM\controlp\sys_set\app_man\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\controlp\sys_set\app_man\$list.ap_ini) do CALL "includes\app_man\includes\load.bat" %%a
DEL "%RAM%\SYSTEM\controlp\sys_set\app_man\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
CALL "W.BAT" TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\sys_set\app_man\list.xml"
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 CALL "includes\app_man\includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\sys_set\app_man" RMDIR /Q /S "%RAM%\SYSTEM\controlp\sys_set\app_man"
SET ERRORLEVEL=
