:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\app_man\uninstall" MD "%RAM%\SYSTEM\controlp\app_man\uninstall"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\list.xml"
CALL "$reg" /list -lbl "KEY_LOCAL_CONFIG\SYSTEM\apps\conf" "%RAM%\SYSTEM\controlp\app_man\uninstall\$list.ap_ini"
SORT "%RAM%\SYSTEM\controlp\app_man\uninstall\$list.ap_ini" /O "%RAM%\SYSTEM\controlp\app_man\uninstall\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\controlp\app_man\uninstall\$list.ap_ini) do CALL "includes\uninstall\includes\load.bat" %%a
DEL "%RAM%\SYSTEM\controlp\app_man\uninstall\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
CALL "$copyright" /down
WBAT LIST @"%RAM%\SYSTEM\controlp\app_man\uninstall\list.xml"
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 CALL "includes\uninstall\includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\app_man\uninstall" RMDIR /Q /S "%RAM%\SYSTEM\controlp\app_man\uninstall"
SET ERRORLEVEL=
