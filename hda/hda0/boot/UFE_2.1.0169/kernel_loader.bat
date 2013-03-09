:PROPER ------------------------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%AP_DIR%\hd0\A\etc\boot\ufe.ap_conf) do IF %%a==KERNEL_LOAD_TYPE (
  IF %%b==1 GOTO TYPE_1_LOADING
  IF %%b==2 GOTO TYPE_2_LOADING
)

:: TYPE_1 ----------------------------------------------------------------------

:TYPE_1_LOADING
CLS

:: TYPE_2 ----------------------------------------------------------------------

:TYPE_2_LOADING
CLS
COLOR CF

:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_0
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_1
CALL "$coms" /load_coms
IF NOT EXIST "%RAM%\KERNEL\com" GOTO ERROR_CANT_LOAD_COMS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_2
CALL "hal.bat"
IF %ERROR%==1 GOTO ERROR_CANT_LOAD_HAL
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_3
CALL "$var" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\var" GOTO ERROR_CANT_LOAD_VARS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_4
CALL "$lib" /dll -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_LIBS
:: -----------------------------------------------------------------------------
CALL "W.BAT" TEXT 18,20 @shared\langs\ufe\Polish.xml:LOADING_5
CALL "$env" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_ENVS
:: -----------------------------------------------------------------------------
COLOR 07
GOTO OK
:: --------------------------------------------- 

:: ERRORS ----------------------------------------------------------------------



:: END -------------------------------------------------------------------------

:OK
SET ERROR=0

:END
CLS