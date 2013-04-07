:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\BOOT\lib" MD "%RAM%\BOOT\lib"

:CHECK_LIBS --------------------------------------------------------------------
FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\mods\lib\lib.ap_conf) do IF %%a==LIB (
  IF %%b==DLL CALL "%BOOT_DIR%\includes\lib\includes\dll.bat" %%c %%d
  IF %%b==SYS CALL "%BOOT_DIR%\includes\lib\includes\sys.bat" %%c %%d
)

:: -----------------------------------------------------------------------------