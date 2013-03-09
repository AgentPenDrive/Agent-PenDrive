:: CLEAR_PATH ------------------------------------------------------------------
PATH ;

:: PATH ------------------------------------------------------------------------

FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\boot\ufe.ap_conf) do (
  IF %%a==ENV (
    IF %%b==DIR (
      IF %%c==LOCAL CALL "%BOOT_DIR%\includes\env\includes\set_path.bat" /local %%d
      IF %%c==GLOBAL CALL "%BOOT_DIR%\includes\env\includes\set_path.bat" /global %%d
    )
  )
)

:: -----------------------------------------------------------------------------

:: FILE ------------------------------------------------------------------------

:: FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (etc\boot.ap_conf) do IF %%a==ENV (
:: IF %%b==FILE PATH %%c;%PATH%
:: )

:: -----------------------------------------------------------------------------
