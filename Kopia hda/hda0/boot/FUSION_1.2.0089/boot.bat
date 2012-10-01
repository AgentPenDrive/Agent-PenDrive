:PROPER ------------------------------------------------------------------------
CD "hda\hda0"
SET AP_DIR=%VME_DIR%\hda\hda0

:CHECK -------------------------------------------------------------------------
IF NOT EXIST "etc\conf\fusion\boot.ap_conf" GOTO ERROR_B0-0003
IF NOT EXIST "etc\conf\ufe\kernel.ap_conf" GOTO ERROR_B0-0003

:BOOT --------------------------------------------------------------------------
:: INSTALLATION ------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==INSTALL_DRIVE SET INSTALL_DRIVE=%%b>nul
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==INSTALL_PAR SET INSTALL_PAR=%%b>nul

:: WINDOW_CONFIG -----------------------------------------------------
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==SIZE MODE CON:COLS=%%b lines=%%c>nul
FOR /F "eol=[ tokens=1,2,3 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==CODE_PAGE MODE CON CP SELECT=%%b lines=%%c>nul
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==TITLE TITLE %%b>nul

:: MAIN_CONFIG -------------------------------------------------------
:: FUSION --------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==FUSION_DIR SET FUSION_DIR=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==FUSION_VER SET FUSION_VER=%%b
SET BOOT_DIR=%FUSION_DIR%\%FUSION_VER%
:: BOOT ----------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==BOOT SET BOOT=%BOOT_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\fusion\boot.ap_conf) do IF %%a==BOOT_LOADER SET BOOT_LOADER=%BOOT_DIR%\%%b
:: -------------------------------------------------------------------

:KERNEL ------------------------------------------------------------------------
:: MAIN_CONFIG -------------------------------------------------------
:: UFE -----------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==UFE_DIR SET UFE_DIR=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==UFE_VER SET UFE_VER=%%b
SET KERNEL_DIR=%AP_DIR%\%UFE_DIR%\%UFE_VER%
:: KERNEL --------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==CONSOLE SET CONSOLE=%KERNEL_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL SET KERNEL=%KERNEL_DIR%\%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL_LOADER SET KERNEL_LOADER=%KERNEL_DIR%\%%b
:: -------------------------------------------------------------------

:SYSTEM ------------------------------------------------------------------------
:: MAIN_CONFIG -------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==SYSTEM SET SYSTEM=%%b
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==SYSTEM_LOADER SET SYSTEM_LOADER=%%b
:: -------------------------------------------------------------------

:: VARIABLES ---------------------------------------------------------
CALL "%BOOT_DIR%\includes\var\var.bat"

:: ENVIRONMENT -------------------------------------------------------
CALL "%BOOT_DIR%\includes\env\env.bat"

:: LIBRARIES ---------------------------------------------------------
CALL "%BOOT_DIR%\includes\lib\lib.bat"

:LOAD_KERNEL -------------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL_LOADER CALL "%KERNEL_DIR%\%%b"
IF %ERROR%==0 GOTO START_KERNEL
IF NOT %ERROR%==0 GOTO ERROR_B3-0068
GOTO LOAD_KERNEL

:START_KERNEL ------------------------------------------------------------------
CLS
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL "%KERNEL_DIR%\%%b"
GOTO START_KERNEL

:: ERRORS ----------------------------------------------------------------------

:ERROR_B0-0003 "etc\boot.ap_conf has been deleted! Program cannot contine! Error B0-0003"
WBAT BOX "etc\boot.ap_conf has been deleted! Program cannot contine! Error B0-0003" OK
GOTO END

:ERROR_B3-0068 "An errror has accured! Agent PenDrive will be now closed! Error B3-0068"
WBAT BOX "An errror has accured! Agent PenDrive will be now closed! Error B3-0068" OK
GOTO END

:: -----------------------------------------------------------------------------

:END
CLS