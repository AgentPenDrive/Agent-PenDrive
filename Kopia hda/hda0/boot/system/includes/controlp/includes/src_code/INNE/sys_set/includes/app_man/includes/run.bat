:RUN ---------------------------------------------------------------------------
CLS
FOR /F "eol=# tokens=1,2,3,4 delims==" %%a in (%RAM%\SYSTEM\controlp\sys_set\app_man\index.ap_ini) do IF %%a==%WBAT% (
  IF %%d==build (
    IF NOT EXIST "%%b.ap_app" GOTO ERROR_APP_NOT_EXIST
    CALL "%KERNEL%" /run run -app %%b %%c
  )
  IF %%d==ext (
    IF NOT EXIST "%%c" GOTO ERROR_DIR_NOT_EXIST
    CALL "includes\app_man\includes\uninstall.bat"
  )
)
GOTO END

:ERROR_APP_NOT_EXIST -----------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
WBAT BOX @"%SYSTEM_DIR%\langs\modules\%AP_LANG%.xml":ERROR_APP_NOT_EXIST
GOTO END

:ERROR_DIR_NOT_EXIST -----------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
WBAT" BOX @"%SYSTEM_DIR%\langs\modules\%AP_LANG%.xml":ERROR_DIR_NOT_EXIST
GOTO END

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
