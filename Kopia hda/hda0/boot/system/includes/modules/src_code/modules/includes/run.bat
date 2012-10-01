:RUN ---------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\SYSTEM\modules\index.ap_ini) do IF "%%a"=="%WBAT%" (
  IF NOT EXIST "%%b" GOTO ERROR_MOD_NOT_EXIST
  CALL "$run" %%b %%c
)
GOTO END

:ERROR_MOD_NOT_EXIST -----------------------------------------------------------
WBAT TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
WBAT BOX @"%SYSTEM_DIR%\langs\modules\%AP_LANG%.xml":ERROR_MOD_NOT_EXIST

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=
