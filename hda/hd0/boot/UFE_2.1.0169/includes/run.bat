:CHECK_EXISTING ----------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\modules\%1" GOTO RUN
IF NOT EXIST "%RAM%\KERNEL\modules\%1" (
  IF EXIST "%MODS%\%1.ap_mod" CALL "%KERNEL_DIR%\includes\load.bat" %1
  IF NOT EXIST "%MODS%\%1.ap_mod" GOTO ERROR_MOD-RUN_0A-0005-007
)

:RUN ---------------------------------------------------------------------------
SET MODDIR=%RAM%\KERNEL\modules\%1
FOR /F "eol=# tokens=1,2 delims==" %%a in (%RAM%\KERNEL\modules\%1\$boot.ap_ini) do IF %%a==BOOT CALL "%RAM%\KERNEL\modules\%1\%%b" %2 %3 %4 %5 %6 %7 %8 %9
SET MODDIR=
GOTO END

:: ERRORS ----------------------------------------------------------------------

:ERROR_MOD-RUN_0A-0005-007
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==ERROR_MOD-RUN_0A-0005-007 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:: -----------------------------------------------------------------------------

:END ---------------------------------------------------------------------------
SET ERROR=mods-error_code-0