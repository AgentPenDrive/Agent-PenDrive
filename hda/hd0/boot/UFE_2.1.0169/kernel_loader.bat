:ARCHITECTURE_SELECT -----------------------------------------------------------
CLS
IF "%PROCESSOR_ARCHITECTURE%"=="x86" GOTO X86_BIT_SYSTEM
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO X64_BIT_SYSTEM
GOTO ARCHITECTURE_SELECT

:X86_BIT_SYSTEM ----------------------------------------------------------------
CLS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_0
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_1
CALL "$mods" /load_mods
IF NOT EXIST "%RAM%\KERNEL\com" GOTO ERROR_CANT_LOAD_MODS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_2
CALL "hal.bat"
IF %ERROR%==1 GOTO ERROR_CANT_LOAD_HAL
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_3
CALL "$var" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\var" GOTO ERROR_CANT_LOAD_VARS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_4
CALL "$lib" /dll -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_LIBS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\boot\ufe\Polish.xml:LOADING_5
CALL "$env" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_ENVS
:: -----------------------------------------------------------------------------
COLOR 07
GOTO OK 

:X64_BIT_SYSTEM ----------------------------------------------------------------
CLS

:: Propering...
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
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\Polish.xml) do IF %%a==AMD64_DIALOG_0 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)

:: Loading_Modules...
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
FOR /F "tokens=1,2,3 delims==" %%a in (share\langs\boot\ufe\Polish.xml) do IF %%a==AMD64_DIALOG_1 (
  IF %%b==1 ECHO %%c
  IF %%b==2 ECHO %%c
  IF %%b==3 ECHO %%c
  IF %%b==4 ECHO %%c
  IF %%b==5 ECHO %%c
  IF %%b==6 ECHO %%c
  IF %%b==7 ECHO %%c
  IF %%b==8 ECHO %%c
)
CALL "$mods" /load_mods
PAUSE

IF NOT EXIST "%RAM%\KERNEL\mods" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_MODS
)

:: Loading_Variables...
ECHO.
ECHOC 0 15 Loading Variables...
CALL "$var" -load_defaults

:: IF EXIST "%RAM%\KERNEL\var" ECHOC 0 10 OK
IF NOT EXIST "%RAM%\KERNEL\var" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_VARS
)

:: Loading_Libraries...
ECHO. 
ECHOC 0 15 Loading Libraries...
CALL "$lib" -load_defaults

:: IF EXIST "%RAM%\KERNEL\lib" ECHOC 0 10 OK
IF NOT EXIST "%RAM%\KERNEL\lib" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_LIBS
)

:: Loading_Environment_Files...
ECHO.
ECHOC 0 15 Loading Environment Files...
::ECHOC 0 14 Notice! Environment Files are temporary closed!
ECHOC 0 15 Loading Environment Files...
CALL "$env" -load_defaults

:: IF EXIST "%RAM%\KERNEL\lib" ECHOC 0 10 OK
IF NOT EXIST "%RAM%\KERNEL\lib" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_ENVS
)

:: ERRORS ----------------------------------------------------------------------



:: END -------------------------------------------------------------------------

:OK
SET ERROR=0

:END
CLS