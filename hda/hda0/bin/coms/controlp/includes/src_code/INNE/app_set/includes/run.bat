:RUN ---------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\SYSTEM\controlp\app_set\index.ap_ini) do IF "%%a"=="%WBAT%" (
IF NOT EXIST "%%b" GOTO ERROR_APP_NOT_EXIST
CALL "%KERNEL%" /run run -app %%b %%c
)
GOTO END

:ERROR_APP_NOT_EXIST -----------------------------------------------------------
WBAT TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
WBAT BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\app_set.xml":ERROR_APP_NOT_EXIST

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=