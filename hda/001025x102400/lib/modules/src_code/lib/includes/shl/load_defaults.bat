:LOAD_DEF_LIBS -----------------------------------------------------------------
FOR /F "tokens=1,2,3 delims==" %%a in (etc\mods\lib\lib.ap_conf) do IF %%a==DIR IF %%b==SOL (
  FOR /F "tokens=1,2,3 delims==" %%a in (etc\mods\lib\lib.ap_conf) do IF %%a==LIB IF %%b==SOL IF EXIST "%%b\%1" CALL "%MODDIR%\includes\dll\load.bat" "%1"
)