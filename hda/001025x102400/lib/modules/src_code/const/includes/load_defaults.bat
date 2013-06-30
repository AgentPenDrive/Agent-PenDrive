:LOAD_LIST ---------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\const" MD "%RAM%\KERNEL\const"
DIR "%CONSTS%\*.*" /b /a-d /one > "%RAM%\KERNEL\const\$list.ap_ini"
GOTO SET_PATH

:SET_PATH ----------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\const\$list.ap_ini) do IF NOT "%%a"=="" CALL "%MODDIR%\includes\load.bat" "%CONSTS%\%%a"
DEL "%RAM%\KERNEL\const\$list.ap_ini"
SET ERROR=0
