:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\modules" MD "%RAM%\SYSTEM\modules"

:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\modules\list.xml"
CALL "$reg" /list -lbl "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "%RAM%\SYSTEM\modules\$list.ap_ini"
IF NOT EXIST "%RAM%\SYSTEM\modules\$list.ap_ini" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\modules\%AP_LANG%.xml) do IF %%a==NO_MOD WBAT BOX %%b OK
  GOTO END
)
SORT "%RAM%\SYSTEM\modules\$list.ap_ini" /O "%RAM%\SYSTEM\modules\$list.ap_ini"

:LOAD_LIST ---------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in (%RAM%\SYSTEM\modules\$list.ap_ini) do CALL "includes\load.bat" %%a
DEL "%RAM%\SYSTEM\modules\$list.ap_ini"

:MENU --------------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" LIST @%RAM%\SYSTEM\modules\list.xml
IF %ERRORLEVEL%==254 GOTO END
CALL "includes\run.bat" "%WBAT%"

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\modules" RMDIR /Q /S "%RAM%\SYSTEM\modules"
SET ERRORLEVEL=
