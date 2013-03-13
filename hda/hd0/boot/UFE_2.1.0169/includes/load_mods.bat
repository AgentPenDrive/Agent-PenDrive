:LOAD_DEFAULTS -----------------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==MOD CALL "%KERNEL_DIR%\includes\load.bat" "%%b"

:END ---------------------------------------------------------------------------