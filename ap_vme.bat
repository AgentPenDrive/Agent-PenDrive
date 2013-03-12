:: ECHO Compiling...
:: CALL "hda_compiler.bat"

@ECHO OFF
TITLE Virtual Machine Emulator
CLS

:ENVIRONMENT -------------------------------------------------------------------
CLS
SET VME_DIR=%CD%
SET RAM=%CD%\RAM

:POST --------------------------------------------------------------------------
CLS
IF NOT EXIST "CMOS.vme_cmos" GOTO ERROR_VME_0B-0015-001
IF EXIST "RAM" RMDIR /Q /S "RAM" & MD "RAM"
FOR /F "tokens=1,2 delims==" %%a in (CMOS.vme_cmos) do IF %%a==LANGUAGE SET VME_LANG=%%b

:BOOT --------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2,3,4 delims==" %%a in (CMOS.vme_cmos) do IF %%a==BOOT (
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

:ERROR_VME_0B-0015-001
CLS
FOR /F "tokens=1,2 delims==" %%a in (includes\langs\English.vme_lng) do IF %%a==ERROR_VME_0B-0015-001 (
  IF EXIST "includes\cmds\wbat250\WBAT.COM" CALL "includes\cmds\wbat250\WBAT" BOX %%b OK
  IF NOT EXIST "includes\cmds\wbat250\WBAT.COM" ECHO %%b & PAUSE
)
GOTO END


:END ---------------------------------------------------------------------------
CLS
ECHO Now you can safety turn off your machine!
PAUSE>NUL
GOTO END