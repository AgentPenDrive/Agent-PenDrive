:RUN ---------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\SYSTEM\controlp\mod_set\index.ap_ini) do IF "%%a"=="%WBAT%" (
IF NOT EXIST "%%b" GOTO ERROR_MOD_NOT_EXIST
CALL "%KERNEL%" /run run -mod %%b %%c
)
GOTO END

:ERROR_MOD_NOT_EXIST -----------------------------------------------------------
CALL "W.BAT" TEXT 80,1 (light white on light red) @"%SYSTEM_DIR%\langs\system\%AP_LANG%.xml":COPYRIGHT
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\mod_set.xml":ERROR_MOD_NOT_EXIST

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=
