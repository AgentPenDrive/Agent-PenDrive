:CHECK -------------------------------------------------------------------------
IF NOT EXIST "device\etc\boot\bootstrap.ap_conf" GOTO ERROR_FUSION_0B-0007-001
IF NOT EXIST "etc\boot\bootstrap.ap_conf" GOTO ERROR_FUSION_0B-0008-002

:INITIALIZATION ----------------------------------------------------------------
:: INSTALLATION ------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==DEF_LANG SET AP_LANG=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==INSTALL_DRIVE SET INSTALL_DRIVE=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==INSTALL_PAR SET INSTALL_PAR=%%b>nul

:: WINDOW_CONFIG -----------------------------------------------------
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==SIZE MODE CON:COLS=%%b LINES=%%c
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==CODE_PAGE MODE CON CP SELECT=%%b LINES=%%c>nul
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==TITLE TITLE %%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\bootstrap.ap_conf) do IF %%a==COLOR COLOR %%b

:KERNEL ------------------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL (
  IF NOT EXIST "%KERNEL_DIR%\%%b" GOTO ERROR_FUSION_0F-0073-004
  "%KERNEL_DIR%\%%b"
)
GOTO END

:: ERRORS ======================================================================

:ERROR_FUSION_0B-0007-001
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0007-001 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0B-0008-002
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0008-002 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0B-0050-007
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0050-007 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0B-0054-011
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0054-011 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0B-0058-011
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0058-011 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END


:ERROR_FUSION_0F-0065-004
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0065-004 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0068-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0068-003 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0073-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0073-003 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0076-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\boot\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0076-003 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "bin\shell\wbat250\WBAT.COM" CALL "bin\shell\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "bin\shell\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:: =============================================================================

:END
CLS