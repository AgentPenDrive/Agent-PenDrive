:LOAD_LIST ---------------------------------------------------------------------
DIR "%ENV%\*.ap_env" /b /a-d /one > "%RAM%\KERNEL\env\$envs_list.ap_ini"
GOTO SET_PATH

:SET_PATH ----------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\env\$envs_list.ap_ini) do CALL "%COMDIR%\includes\load.bat" "%ENV%\%%a"
DEL "%RAM%\KERNEL\env\$envs_list.ap_ini"