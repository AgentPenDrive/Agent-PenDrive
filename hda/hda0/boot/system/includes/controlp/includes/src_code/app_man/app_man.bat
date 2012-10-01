:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\app_man" MD "%RAM%\SYSTEM\controlp\app_man"

:MENU --------------------------------------------------------------------------
CLS
WBAT BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\app_man.xml":MENU
IF %ERRORLEVEL%==1 CALL "includes\install\install.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==2 CALL "includes\uninstall\uninstall.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==3 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\list.xml"
CALL "$reg" /list -lbl KEY_LOCAL_CONFIG\SYSTEM\apps\conf %RAM%\SYSTEM\controlp\app_man\$list.ap_ini
SORT "%RAM%\SYSTEM\controlp\app_man\$list.ap_ini" /O "%RAM%\SYSTEM\controlp\app_man\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\controlp\app_man\$list.ap_ini) do CALL "includes\load.bat" %%a
DEL "%RAM%\SYSTEM\controlp\app_man\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
WBAT LIST @"%RAM%\SYSTEM\controlp\app_man\list.xml"
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 CALL "includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\app_man" RMDIR /Q /S "%RAM%\SYSTEM\controlp\app_man"
SET ERRORLEVEL=
