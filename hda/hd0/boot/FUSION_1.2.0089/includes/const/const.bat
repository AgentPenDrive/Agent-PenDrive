:: LOCAL -----------------------------------------------------------------------

FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\mods\const\const.ap_conf) do IF %%a==CONST (
  IF %%b==LOCAL SET %%c=%CD%\%%d
)

:: -----------------------------------------------------------------------------

:: GLOBAL ----------------------------------------------------------------------

FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\mods\const\const.ap_conf) do IF %%a==CONST (
  IF %%b==GLOBAL SET %%c=%%d
)

:: -----------------------------------------------------------------------------