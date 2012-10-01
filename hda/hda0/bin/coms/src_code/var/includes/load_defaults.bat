:LOAD_LIST ---------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\var" MD "%RAM%\KERNEL\var"
DIR "%VARS%\*.*" /b /a-d /one > "%RAM%\KERNEL\var\$list.ap_ini"
GOTO SET_PATH

:SET_PATH ----------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\var\$list.ap_ini) do IF NOT "%%a"=="" CALL "%COMDIR%\includes\load.bat" "%VARS%\%%a"
DEL "%RAM%\KERNEL\var\$list.ap_ini"
SET ERROR=0
