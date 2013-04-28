:RAPORT ------------------------------------------------------------------------
CLS
:: CALL "%SYSTEM_DIR%\includes\raport\raport.bat"

:START_SYSTEM ------------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do (
  IF %%a==SYSTEM_LOADER (
    IF EXIST "%%b" CALL "$run" %%b
    IF NOT EXIST "%%b" GOTO ERROR_2
  )
)
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do (
  IF %%a==SYSTEM (
    CALL "$run" %%b
  )
)

:ERRORS ------------------------------------------------------------------------


:END ---------------------------------------------------------------------------
CLS
ECHO Kernel Halted!
PAUSE