:LOAD_DEFAULTS -----------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\com" MD "%RAM%\KERNEL\com"
DIR "%COMS%\*.ap_com" /b /a-d /one > "%RAM%\KERNEL\com\$coms_list.ap_ini"
FOR /F "delims=" %%a in (%RAM%\KERNEL\com\$coms_list.ap_ini) do CALL "%KERNEL_DIR%\includes\load.bat" "%%a"
DEL "%RAM%\KERNEL\com\$coms_list.ap_ini"

:END ---------------------------------------------------------------------------