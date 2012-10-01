:CHECK_EXISTING ----------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\com\%1" GOTO RUN
IF NOT EXIST "%RAM%\KERNEL\com\%1" CALL "%KERNEL_DIR%\includes\load.bat" %1

:RUN ---------------------------------------------------------------------------
SET COMDIR=%RAM%\KERNEL\com\%1
FOR /F "eol=# tokens=1,2 delims==" %%a in (%RAM%\KERNEL\com\%1\$boot.ap_ini) do IF %%a==BOOT CALL "%RAM%\KERNEL\com\%1\%%b" %2 %3 %4 %5 %6 %7 %8 %8 %9
SET COMDIR=

:END ---------------------------------------------------------------------------
SET ERROR=coms-error_code-0
