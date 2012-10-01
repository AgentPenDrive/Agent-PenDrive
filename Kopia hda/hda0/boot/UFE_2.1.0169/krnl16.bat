:RAPORT ------------------------------------------------------------------------
CLS
:: CALL "%SYSTEM_DIR%\includes\raport\raport.bat"

:START_SYSTEM ------------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do (
  IF %%a==SYSTEM_LOADER (
    CALL "$run" %%b
  )
)
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do (
  IF %%a==SYSTEM (
    CALL "$run" %%b
  )
)

:END ---------------------------------------------------------------------------
CLS
ECHO Kernel Halted!
PAUSE