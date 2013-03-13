:LOAD_DEFAULTS -----------------------------------------------------------------
DIR "%MODS%\*.ap_mod" /b /a-d /one>"%RAM%\KERNEL\modules\$mods_list.ap_ini"
FOR /F "delims=" %%a in (%RAM%\KERNEL\modules\$mods_list.ap_ini) do CALL "%KERNEL_DIR%\includes\load.bat" "%%a"
DEL "%RAM%\KERNEL\modules\$mods_list.ap_ini"

:END ---------------------------------------------------------------------------