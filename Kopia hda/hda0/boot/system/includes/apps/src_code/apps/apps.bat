:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\apps" MD "%RAM%\SYSTEM\apps"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane wtyczki" [x]>"%RAM%\SYSTEM\apps\list.xml"
CALL "$reg" /list -lbl KEY_LOCAL_CONFIG\SYSTEM\apps\conf "%RAM%\SYSTEM\apps\$list.ap_ini"
SORT "%RAM%\SYSTEM\apps\$list.ap_ini" /O "%RAM%\SYSTEM\apps\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\apps\$list.ap_ini) do CALL "includes\load.bat" %%a
DEL "%RAM%\SYSTEM\apps\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @%RAM%\SYSTEM\apps\list.xml
IF %ERRORLEVEL%==254 GOTO END
CALL "includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\apps" RMDIR /Q /S "%RAM%\SYSTEM\apps"
SET ERRORLEVEL=
