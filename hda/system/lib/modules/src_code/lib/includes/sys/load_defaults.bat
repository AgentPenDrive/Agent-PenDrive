:LOAD_LIST ---------------------------------------------------------------------
DIR "%LIB%\sys\*.ap_sys" /b /a-d /one > "%RAM%\KERNEL\lib\sys\$libs_list.ap_ini"
GOTO SET_PATH

:SET_PATH ----------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\lib\sys\$libs_list.ap_ini) do CALL "%COMDIR%\includes\sys\load.bat" "%LIB%\sys\%%a"
DEL "%RAM%\KERNEL\lib\sys\$libs_list.ap_ini"