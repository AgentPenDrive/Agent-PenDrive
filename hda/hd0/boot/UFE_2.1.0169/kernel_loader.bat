:ARCHITECTURE_SELECT -----------------------------------------------------------
CLS
IF "%PROCESSOR_ARCHITECTURE%"=="x86" GOTO X86_BIT_SYSTEM
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO X64_BIT_SYSTEM
GOTO ARCHITECTURE_SELECT

:X86_BIT_SYSTEM ----------------------------------------------------------------
CLS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_0
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_1
CALL "$mods" /load_mods
IF NOT EXIST "%RAM%\KERNEL\modules" GOTO ERROR_CANT_LOAD_MODS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_2
CALL "hal.bat"
IF %ERROR%==1 GOTO ERROR_CANT_LOAD_HAL
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_3
CALL "$var" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\var" GOTO ERROR_CANT_LOAD_VARS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_4
CALL "$lib" /dll -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_LIBS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\%AP_LANG%.xml:LOADING_5
CALL "$env" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_ENVS
:: -----------------------------------------------------------------------------
GOTO OK 

:X64_BIT_SYSTEM ----------------------------------------------------------------
CLS

:: Propering... ----------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_0 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)

:: Loading_Modules... ----------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_1 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "$mods" /load_def

IF NOT EXIST "%RAM%\KERNEL\modules" (
  ECHO ERROR!
  PAUSE
  GOTO ERROR_CANT_LOAD_MODS
)

:: Loading_HAL... --------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_2 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "hal.bat"
ECHO ------------------------------------------------------------------------------
PAUSE

IF %ERROR%==1 (
  ECHO ERROR!
  PAUSE
  GOTO ERROR_CANT_LOAD_HAL
)

:: Loading_Constants... --------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_3 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "$var" -load_defaults

IF NOT EXIST "%RAM%\KERNEL\var" (
  ECHO ERROR!
  PAUSE
  GOTO ERROR_CANT_LOAD_VARS
)

:: Loading_Libraries... --------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_4 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "$lib" -load_defaults

IF NOT EXIST "%RAM%\KERNEL\lib" (
  ECHO ERROR!
  PAUSE
  GOTO ERROR_CANT_LOAD_LIBS
)

:: Loading_Environment_Files...  -----------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\%AP_LANG%.xml) do IF %%a==AMD64_DIALOG_5 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "$env" -load_defaults

IF NOT EXIST "%RAM%\KERNEL\env" (
  ECHO ERROR!
  PAUSE
  GOTO ERROR_CANT_LOAD_ENVS
)

GOTO OK

:: ERRORS ----------------------------------------------------------------------



:: END -------------------------------------------------------------------------

:OK
ECHO OK
PAUSE
COLOR 07
SET ERROR=0

:END
CLS