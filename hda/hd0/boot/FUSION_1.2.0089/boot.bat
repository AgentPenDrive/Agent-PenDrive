:PROPER ------------------------------------------------------------------------
CD "%VME_DIR%\%1\%2"
SET AP_DIR=%VME_DIR%\%1\%2
FOR /F "tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==DEF_LANG SET AP_LANG=%%b

:CHECK -------------------------------------------------------------------------
IF NOT EXIST "etc\boot\fusion.ap_conf" GOTO ERROR_FUSION_0B-0007-001
IF NOT EXIST "etc\boot\ufe.ap_conf" GOTO ERROR_FUSION_0B-0008-002
IF NOT EXIST "%BOOT_DIR%\includes\const\const.bat" GOTO ERROR_FUSION_0E-0009-007
IF NOT EXIST "%BOOT_DIR%\includes\env\env.bat" GOTO ERROR_FUSION_0E-0010-011
IF NOT EXIST "%BOOT_DIR%\includes\lib\lib.bat" GOTO ERROR_FUSION_0E-0011-015

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
CALL "%BOOT_DIR%\includes\const\const.bat"

:: ENVIRONMENT -------------------------------------------------------
CALL "%BOOT_DIR%\includes\env\env.bat"

:: LIBRARIES ---------------------------------------------------------
CALL "%BOOT_DIR%\includes\lib\lib.bat"

:KERNEL ------------------------------------------------------------------------
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
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0007-001 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0B-0008-002
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0008-002 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0E-0009-007
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0E-0009-007 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0E-0010-011
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0E-0010-011 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0E-0011-011
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0E-0011-011 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END


:ERROR_FUSION_0F-0065-004
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0065-004 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0068-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0068-003 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0073-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0073-003 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:ERROR_FUSION_0F-0076-003
CLS
FOR /F "tokens=1,2 delims==" %%a in (share\langs\fusion\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0F-0076-003 (
  IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END

:: -----------------------------------------------------------------------------

:END
CLS