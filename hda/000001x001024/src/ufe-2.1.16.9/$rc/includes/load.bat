:CHECK -------------------------------------------------------------------------
IF NOT EXIST "%MODS%\%1.ap_mod" GOTO ERROR_MOD-LOAD_0A-0002-007

:UNPACK_FILES ------------------------------------------------------------------
UNRAR x -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 "%MODS%\%1.ap_mod" "%RAM%\KERNEL\modules\">nul
GOTO END

:: ERRORS ----------------------------------------------------------------------

:ERROR_MOD-LOAD_0A-0002-007
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==ERROR_MOD-LOAD_0A-0002-007 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:: -----------------------------------------------------------------------------

:END ---------------------------------------------------------------------------