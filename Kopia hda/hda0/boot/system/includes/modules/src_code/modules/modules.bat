:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\modules" MD "%RAM%\SYSTEM\modules"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\modules\list.xml"
CALL "$reg" /list -lbl KEY_LOCAL_CONFIG\SYSTEM\modules\conf %RAM%\SYSTEM\modules\$list.ap_ini
SORT "%RAM%\SYSTEM\modules\$list.ap_ini" /O "%RAM%\SYSTEM\modules\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\modules\$list.ap_ini) do CALL "includes\load.bat" %%a
DEL "%RAM%\SYSTEM\modules\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @%RAM%\SYSTEM\modules\list.xml
IF %ERRORLEVEL%==254 GOTO END
CALL "includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\modules" RMDIR /Q /S "%RAM%\SYSTEM\modules"
SET ERRORLEVEL=
