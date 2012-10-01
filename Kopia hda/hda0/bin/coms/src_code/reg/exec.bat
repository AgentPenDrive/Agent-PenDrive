:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\reg" MD "%RAM%\KERNEL\reg"
SET REG=%RAM%\KERNEL\reg

:CHECK -------------------------------------------------------------------------
:: ---------------------------------------------------------
IF %1==/reg (
  IF %2==-md_keyfile (
    IF EXIST "%REG_DIR%\%3.ap_reg" (
      SET return=keyfile_exists
    )
    IF NOT EXIST "%REG_DIR%\%3.ap_reg" (
      CALL "%COMDIR%\$functions\md_keyfile.bat" %3
    )
  )
  IF %2==-rm_keyfile (
    IF EXIST "%REG_DIR%\%3.ap_reg" DEL "%REG_DIR%\%3.ap_reg"
  )
  IF %2==-load (
    UNRAR x -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 "%REG_DIR%\%3.ap_reg" "%RAM%\KERNEL\reg">nul
  )
  IF %2==-load_defaults (
    DIR "%REG_DIR%\*.ap_reg" /b /a-d /one > "%RAM%\KERNEL\reg\$reg_list.ap_ini"
    FOR /F "delims=" %%a in (%RAM%\KERNEL\reg\$reg_list.ap_ini) do CALL:LOAD "%%a"
    DEL "%RAM%\KERNEL\reg\$reg_list.ap_ini"
  )
  IF %2==-save_state (
    CALL "%COMDIR%\$functions\save_state.bat" %3
  )
  IF %2==-kill (
    IF EXIST "%RAM%\KERNEL\reg\%3" RMDIR /Q /S "%RAM%\KERNEL\reg\%3"
  )
  GOTO END
)
:: ---------------------------------------------------------
IF %1==/create CALL "%COMDIR%\includes\create.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==/remove CALL "%COMDIR%\includes\remove.bat" %2 %3 %4 %5 %6 %7 %8 %9
:: ---------------------------
IF %1==/if_exist CALL "%COMDIR%\includes\if_exist.bat" %2 %3 %4 %5 %6 %7 %8 %9
:: ---------------------------
IF %1==/load CALL "%COMDIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==/show CALL "%COMDIR%\includes\show.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %1==/list CALL "%COMDIR%\includes\list\list.bat" %2 %3 %4 %5 %6 %7 %8 %9
:: ---------------------------------------------------------
GOTO END

:: PROCEDURES ------------------------------------------------------------------

:LOAD ------------------------------------------------------
UNRAR x -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 "%REG_DIR%\%1" "%RAM%\KERNEL\reg">nul

:: -----------------------------------------------------------------------------

:END -------------------------------------------------------
SET REG=