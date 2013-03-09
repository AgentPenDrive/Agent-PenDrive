:PROPER ------------------------------------------------------------------------
CD "hda\hda0"
SET AP_DIR=%VME_DIR%\hda\hda0

:CHECK -------------------------------------------------------------------------
IF NOT EXIST "etc\boot\fusion.ap_conf" GOTO ERROR_FUSION_0B-0006-001
IF NOT EXIST "etc\boot\ufe.ap_conf" GOTO ERROR_FUSION_0B-0007-002

:BOOT --------------------------------------------------------------------------
:: INSTALLATION ------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==INSTALL_DRIVE SET INSTALL_DRIVE=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==INSTALL_PAR SET INSTALL_PAR=%%b>nul

:: WINDOW_CONFIG -----------------------------------------------------
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==SIZE MODE CON:COLS=%%b lines=%%c
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\boot\fusion.ap_conf) do IF %%a==CODE_PAGE MODE CON CP SELECT=%%b lines=%%c>nul
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

:: VARIABLES ---------------------------------------------------------
IF NOT EXIST "%BOOT_DIR%\includes\var\var.bat" GOTO ERROR_FUSION_0E-0049-007
CALL "%BOOT_DIR%\includes\var\var.bat"

:: ENVIRONMENT -------------------------------------------------------
IF NOT EXIST "%BOOT_DIR%\includes\env\env.bat" GOTO ERROR_FUSION_0E-0053-011
CALL "%BOOT_DIR%\includes\env\env.bat"

:: LIBRARIES ---------------------------------------------------------
GOTO ERROR_FUSION_0E-0055-015
IF NOT EXIST "%BOOT_DIR%\includes\lib\lib.bat" GOTO ERROR_FUSION_0E-0055-015
CALL "%BOOT_DIR%\includes\lib\lib.bat"

:KERNEL ------------------------------------------------------------------------
PAUSE
:: LOAD_KERNEL -----------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL_LOADER CALL "%KERNEL_DIR%\%%b"
IF NOT %ERROR%==0 GOTO ERROR_FUSION_0F-0061-004

:: START_KERNEL ----------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\boot\ufe.ap_conf) do IF %%a==KERNEL "%KERNEL_DIR%\%%b"
GOTO ERROR_FUSION_0F-0066-003

:: ERRORS ----------------------------------------------------------------------

:ERROR_FUSION_0B-0006-001
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "Error! etc\boot\fusion.ap_conf is missed! System cannot continue! Error code: ERROR_FUSION_0B-0006-001" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO Error! etc\boot\fusion.ap_conf is missed! System cannot continue! Error code: ERROR_FUSION_0B-0006-001 & PAUSE
GOTO END

:ERROR_FUSION_0B-0007-002
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "Error! etc\boot\ufe.ap_conf is missed! System cannot continue! Error code: ERROR_FUSION_0B-0007-002" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO Error! etc\boot\ufe.ap_conf is missed! System cannot continue! Error code: ERROR_FUSION_0B-0007-002 & PAUSE
GOTO END

:ERROR_FUSION_0E-0049-007
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "Error! boot\fusion\includes\var\var.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0049-007" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO Error! boot\fusion\includes\var\var.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0049-007 & PAUSE
GOTO END

:ERROR_FUSION_0E-0053-011
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "Error! boot\fusion\includes\env\env.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0053-011" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO Error! boot\fusion\includes\env\env.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0053-011 & PAUSE
GOTO END

:ERROR_FUSION_0E-0055-015
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "Error! boot\fusion\includes\lib\lib.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0055-015" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO Error! boot\fusion\includes\lib\lib.bat is missed! System cannot continue! Error code: ERROR_FUSION_0E-0055-015 & PAUSE
GOTO END

:ERROR_FUSION_0F-0061-004
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "An error has occured while loading or trying to load kernel! Error code: ERROR_FUSION_0F-0061-004" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO An error has occured while loading or trying to load kernel! Error code: ERROR_FUSION_0F-0061-004 & PAUSE
GOTO END

:ERROR_FUSION_0F-0066-003
CLS
IF EXIST "bin\cmds\wbat250\WBAT.COM" CALL "bin\cmds\wbat250\WBAT" BOX "An error has occured while trying to execute kernel! Error code: ERROR_FUSION_0F-0066-003" OK
IF NOT EXIST "bin\cmds\wbat250\WBAT.COM" ECHO An error has occured while trying to execute kernel! Error code: ERROR_FUSION_0F-0066-003 & PAUSE
GOTO END

:: -----------------------------------------------------------------------------

:END
CLS