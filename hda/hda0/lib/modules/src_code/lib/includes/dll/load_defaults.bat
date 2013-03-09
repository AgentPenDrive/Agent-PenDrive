:LOAD_LIST ---------------------------------------------------------------------
DIR "%LIB%\dll\*.ap_dll" /b /a-d /one > "%RAM%\KERNEL\lib\dll\$libs_list.ap_ini"
GOTO SET_PATH

:SET_PATH ----------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\lib\dll\$libs_list.ap_ini) do CALL "%COMDIR%\includes\dll\load.bat" "%LIB%\dll\%%a"
DEL "%RAM%\KERNEL\lib\dll\$libs_list.ap_ini"