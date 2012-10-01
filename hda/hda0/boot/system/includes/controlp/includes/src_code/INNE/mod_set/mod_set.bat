:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\mod_set" MD "%RAM%\SYSTEM\controlp\mod_set"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\mod_set\list.xml"
CALL "$reg" /list -lbl KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf %RAM%\SYSTEM\controlp\mod_set\$list.ap_ini
SORT "%RAM%\SYSTEM\controlp\mod_set\$list.ap_ini" /O "%RAM%\SYSTEM\controlp\mod_set\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\controlp\mod_set\$list.ap_ini) do CALL "includes\load.bat" %%a
DEL "%RAM%\SYSTEM\controlp\mod_set\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
CALL "W.BAT" TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @%RAM%\SYSTEM\controlp\mod_set\list.xml
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 CALL "includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
RMDIR /Q /S "%RAM%\SYSTEM\controlp\mod_set"
