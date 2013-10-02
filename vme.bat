@ECHO OFF
TITLE Virtual Machine Emulator
CLS

:ENVIRONMENT -------------------------------------------------------------------
CLS
SET VME_DIR=%CD%

IF NOT EXIST "devices" CALL "includes\$procesdures\$error.bat"
IF NOT EXIST "config\CMOS.vme_cmos" CALL "includes\$procesdures\$error.bat"

:POST --------------------------------------------------------------------------
CLS


:BOOT --------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2,3,4 delims==" %%a in (config\CMOS.vme_cmos) do IF %%a==BOOT (
  IF %%b==MASTER (
    IF %%c==HDD (
      CALL "includes\$procedures\$boot_hdd.bat" %%d
      GOTO END
    )
    IF %%c==CDD (
      CALL "includes\$procedures\$boot_cdd.bat" %%d
      GOTO END
    )
  )
  IF %%b==SLAVE (
    IF %%c==HDD (
      CALL "includes\$procedures\$boot_hdd.bat" %%d
      GOTO END
    )
    IF %%c==CDD (
      CALL "includes\$procedures\$boot_cdd.bat" %%d
      GOTO END
    )
  )
)


:: ERRORS ----------------------------------------------------------------------

:ERROR_VME_0B-0012-001
CLS
FOR /F "tokens=1,2 delims==" %%a in (langs\English.vme_lng) do IF %%a==ERROR_VME_0B-0012-001 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "includes\cmds\wbat250\WBAT.COM" CALL "includes\cmds\wbat250\WBAT" BOX %%b OK
    IF NOT EXIST "includes\cmds\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END


:END ---------------------------------------------------------------------------
CLS
ECHO Now you can safety turn off your machine!
PAUSE>NUL
GOTO END