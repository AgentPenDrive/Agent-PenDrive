:CHECK_EXISTING ----------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\modules\%1" GOTO RUN
IF NOT EXIST "%RAM%\KERNEL\modules\%1" (
  IF EXIST "%MODS%\%1" CALL "%KERNEL_DIR%\includes\load.bat" %1
  IF NOT EXIST "%MODS%\%1" WBAT BOX "Module does not exist!" OK & GOTO END
)

:RUN ---------------------------------------------------------------------------
SET MODDIR=%RAM%\KERNEL\modules\%1
FOR /F "eol=# tokens=1,2 delims==" %%a in (%RAM%\KERNEL\modules\%1\$boot.ap_ini) do IF %%a==BOOT CALL "%RAM%\KERNEL\modules\%1\%%b" %2 %3 %4 %5 %6 %7 %8 %9
SET MODDIR=

:END ---------------------------------------------------------------------------
SET ERROR=mods-error_code-0