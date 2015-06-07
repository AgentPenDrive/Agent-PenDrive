@ECHO OFF
TITLE Virtual Machine Emulator
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
CLS

:: PREPARING ===================================================================

:PREPARING ---------------------------------------------------------------------
CLS
CALL :ENVIRONMENT & IF NOT ERRORLEVEL==0 CALL :ERROR & EXIT /B 100
CALL :ERROR_CHECK & IF NOT ERRORLEVEL==0 CALL :ERROR & EXIT /B 100
GOTO POST

:ENVIRONMENT
SET VME_DIR=%CD%
IF "%VME_DIR%"=="%CD%" EXIT /B 0
IF NOT "%VME_DIR%"=="%CD%" EXIT /B 100

:ERROR_CHECK
IF NOT EXIST "config" CALL :ERROR & EXIT /B 100
IF NOT EXIST "config\CMOS.vme_cmos" CALL :ERROR & EXIT /B 100
IF NOT EXIST "devices" CALL :ERROR & EXIT /B 100
IF NOT EXIST "includes" CALL :ERROR & EXIT /B 100
EXIT /B 0

:POST --------------------------------------------------------------------------
CLS

GOTO BOOT

:: MAIN PROGRAM ================================================================

:BOOT --------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2,3 delims==" %%a in (config\CMOS.vme_cmos) do IF "%%a"=="BOOT" (
:: ---------------------------
  IF "%%b"=="1" (
    SET MEDIA_NAME=%%c
    SET MEDIA_TYPE=
    SET MEDIA_LOCATION=
    FOR /F "tokens=1,2,3,4 delims==" %%a in (config\CMOS.vme_cmos) do IF "%%a"=="MEDIA" IF "%%c"=="%MEDIA_NAME%" ECHO %%c %%b %%d & SET MEDIA_TYPE=%%b & SET MEDIA_LOCATION=%%d 
    IF "%MEDIA_TYPE%"=="CDD" (
      ECHO CDD
      PAUSE
      CALL :BOOT_CDD %%d
      EXIT /B
    )
    IF "%%c"=="HDD" (
      ECHO HDD
      PAUSE
      CALL :BOOT_HDD %%d
      EXIT /B
    )
  )
:: ---------------------------
  IF "%%b"=="2" (
    IF "%%c"=="CDD" (
      CALL :BOOT_CDD %%d
      EXIT /B
    )
    IF "%%c"=="HDD" (
      CALL :BOOT_HDD %%d
      EXIT /B
    )
  )
:: ---------------------------
  IF "%%b"=="3" (
    IF "%%c"=="CDD" (
      CALL :BOOT_CDD %%d
      EXIT /B
    )
    IF "%%c"=="HDD" (
      CALL :BOOT_HDD %%d
      EXIT /B
    )
  )
:: ---------------------------
  IF "%%b"=="4" (
    IF "%%c"=="CDD" (
      CALL :BOOT_CDD %%d
      EXIT /B
    )
    IF "%%c"=="HDD" (
      CALL :BOOT_HDD %%d
      EXIT /B
    )
  )
)
:: ---------------------------
GOTO END

:: FUNCTIONS ===================================================================

:BOOT_CDD ----------------------------------------------------------------------
CLS
ECHO BOOT_CDD
PAUSE
IF NOT EXIST "%1\$mbr.vme_mbr" CALL :ERROR NOT_BOOTABLE
FOR /F "eol=[ tokens=1,2,3 delims==" %%a IN (%1\$mbr.vme_mbr) DO IF %%a==BOOTSTRAP (
  IF NOT EXIST "%1\%%b\%%c" CALL :ERROR & EXIT /B 100
  CALL "%1\%%b\%%c" %1 %%b %%c
)
EXIT /B 0

:BOOT_HDD ----------------------------------------------------------------------
CLS
ECHO BOOT_HDD
PAUSE
IF NOT EXIST "%1\$mbr.vme_mbr" CALL :ERROR NOT_BOOTABLE
FOR /F "eol=[ tokens=1,2,3 delims==" %%a IN (%1\$mbr.vme_mbr) DO IF %%a==BOOTSTRAP (
  IF NOT EXIST "%1\%%b\%%c" CALL :ERROR & EXIT /B 100
  CALL "%1\%%b\%%c" %1 %%b %%c
)
EXIT /B 0

:: ERRORS ----------------------------------------------------------------------

:ERROR
CLS
ECHO ERROR FCHUJ!
PAUSE
IF EXIST "langs\English.vme_lng" (
  FOR /F "tokens=1,2 delims==" %%a IN (langs\English.vme_lng) DO IF %%a==ERROR_NOT_COMPLETE_FILES (
    IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
      IF EXIST "includes\cmds\wbat250\WBAT.COM" CALL "includes\cmds\wbat250\WBAT" BOX %%b OK
      IF NOT EXIST "includes\cmds\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
    )
    IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
  )
)
IF NOT EXIST "langs\English.vme_lng" (

)
EXIT /B

:: =============================================================================

:END ---------------------------------------------------------------------------
CLS
ECHO Now you can safety turn off your machine!
PAUSE>NUL
GOTO END