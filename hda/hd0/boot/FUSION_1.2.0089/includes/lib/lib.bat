:: DLL -----------------------------------------------------------------------

FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\mods\lib\lib.ap_conf) do IF %%a==LIB (
  IF %%b==DLL (
    IF %%c==LOCAL CALL "%BOOT_DIR%\includes\lib\includes\dll.bat" /local %%d
    IF %%c==GLOBAL CALL "%BOOT_DIR%\includes\lib\includes\dll.bat" /global %%d
  )
  IF %%b==SYS (
    IF %%c==LOCAL CALL "%BOOT_DIR%\includes\lib\includes\sys.bat" /local %%d
    IF %%c==GLOBAL CALL "%BOOT_DIR%\includes\lib\includes\sys.bat" /global %%d
  )
)

:: -----------------------------------------------------------------------------