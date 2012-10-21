:RUN ---------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\SYSTEM\modules\index.ap_ini) do IF "%%a"=="%WBAT%" (
  :: IF NOT EXIST "%%b" GOTO ERROR_MOD_NOT_EXIST
  CALL "$run" %AP_DIR%\%%b %%c
)
GOTO END

:ERROR_MOD_NOT_EXIST -----------------------------------------------------------
CALL "$copyright" /down
WBAT BOX @"%SYSTEM_DIR%\langs\modules\%AP_LANG%.xml":ERROR_MOD_NOT_EXIST

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=
