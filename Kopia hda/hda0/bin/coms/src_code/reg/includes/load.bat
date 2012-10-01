:CHECK_EXISTING ----------------------------------------------------------------
IF NOT EXIST "%REG%\%1.ap_ini" GOTO END

:LOAD_VALUE --------------------------------------------------------------------
INIFILE %REG%\%1.ap_ini %2 %3 >"%RAM%\KERNEL\reg\value.ap_ini"
FOR /F "tokens=1 delims=" %%a in (%RAM%\KERNEL\reg\value.ap_ini) do SET VALUE=%%a
SET VALUE=%VALUE:~4%
FOR /F "tokens=1,2 delims==" %%a in (%RAM%\KERNEL\reg\value.ap_ini) do SET %4=%%b
DEL "%RAM%\KERNEL\reg\value.ap_ini"

:END ---------------------------------------------------------------------------
SET VALUE=
