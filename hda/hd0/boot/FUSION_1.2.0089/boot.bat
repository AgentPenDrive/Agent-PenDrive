:PROPER ------------------------------------------------------------------------
CD "%VME_DIR%\%1\%2"
SET ROOT=%VME_DIR%\%1\%2
FOR /F "tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==DEF_LANG SET AP_LANG=%%b

:CHECK -------------------------------------------------------------------------
IF NOT EXIST "etc\boot\fusion.ap_conf" GOTO ERROR_FUSION_0B-0007-001
IF NOT EXIST "etc\boot\ufe.ap_conf" GOTO ERROR_FUSION_0B-0008-002

:BOOT --------------------------------------------------------------------------
:: INSTALLATION ------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==INSTALL_DRIVE SET INSTALL_DRIVE=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==INSTALL_PAR SET INSTALL_PAR=%%b>nul

:: WINDOW_CONFIG -----------------------------------------------------
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==SIZE MODE CON:COLS=%%b LINES=%%c
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==CODE_PAGE MODE CON CP SELECT=%%b LINES=%%c>nul
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==TITLE TITLE %%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==COLOR COLOR %%b

:: MAIN_CONFIG -------------------------------------------------------
:: FUSION --------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==FUSION_DIR SET FUSION_DIR=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==FUSION_VER SET FUSION_VER=%%b
SET BOOT_DIR=%FUSION_DIR%\%FUSION_VER%
:: BOOT ----------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==BOOT SET BOOT=%BOOT_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==BOOT_LOADER SET BOOT_LOADER=%BOOT_DIR%\%%b
:: -------------------------------------------------------------------

:KERNEL ------------------------------------------------------------------------
:: MAIN_CONFIG -------------------------------------------------------
:: UFE -----------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==UFE_DIR SET UFE_DIR=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==UFE_VER SET UFE_VER=%%b
SET KERNEL_DIR=%UFE_DIR%\%UFE_VER%
:: KERNEL --------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==CONSOLE SET CONSOLE=%KERNEL_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL SET KERNEL=%KERNEL_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL_LOADER SET KERNEL_LOADER=%KERNEL_DIR%\%%b
:: -------------------------------------------------------------------

:SYSTEM ------------------------------------------------------------------------
:: MAIN_CONFIG -------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==SYSTEM SET SYSTEM=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==SYSTEM_LOADER SET SYSTEM_LOADER=%%b
:: -------------------------------------------------------------------

:: CONSTANTS ---------------------------------------------------------
IF NOT EXIST "%BOOT_DIR%\includes\const\const.bat" GOTO ERROR_FUSION_0B-0050-007
CALL "%BOOT_DIR%\includes\const\const.bat"

:: ENVIRONMENT -------------------------------------------------------
IF NOT EXIST "%BOOT_DIR%\includes\env\env.bat" GOTO ERROR_FUSION_0B-0054-011
CALL "%BOOT_DIR%\includes\env\env.bat"

:: LIBRARIES ---------------------------------------------------------
IF NOT EXIST "%BOOT_DIR%\includes\lib\lib.bat" GOTO ERROR_FUSION_0B-0058-015
CALL "%BOOT_DIR%\includes\lib\lib.bat"

:KERNEL ------------------------------------------------------------------------
ECHO ------------------------------------------------------------------ %DATE% --%TIME% ------------------------------------------------------------------>>var\logs\const\log.log
SET>>var\logs\const\log.log
ECHO ------------------------------------------------------------------ %DATE% --%TIME% ------------------------------------------------------------------>>var\logs\env\log.log
PATH>>var\logs\env\log.log
ECHO ------------------------------------------------------------------ %DATE% --%TIME% ------------------------------------------------------------------>>var\logs\lib\log.log
PATH>>var\logs\lib\log.log
:: LOAD_KERNEL -----------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL_LOADER (
  IF NOT EXIST "%KERNEL_DIR%\%%b" GOTO ERROR_FUSION_0F-0065-004
  CALL "%KERNEL_DIR%\%%b"
)
IF NOT %ERROR%==0 GOTO ERROR_FUSION_0F-0068-004

:: START_KERNEL ----------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL (
  IF NOT EXIST "%KERNEL_DIR%\%%b" GOTO ERROR_FUSION_0F-0073-004
  "%KERNEL_DIR%\%%b"
)
GOTO ERROR_FUSION_0F-0076-003

:: ERRORS ----------------------------------------------------------------------

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

:: -----------------------------------------------------------------------------

:END
CLS