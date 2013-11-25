:PROPER ------------------------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%AP_DIR%\hd0\A\etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL_LOAD_TYPE (
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
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_7
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_8
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_9
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_10
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_11
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_12
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_13
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_14
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_15
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_16
CALL "W.BAT" TEXT 18,20 @%AP_DIR%\var\langs\ufe\Polish.xml:LOADING_17
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%AP_DIR%\etc\conf\fusion\boot.ap_conf) do IF %%a==COLOR COLOR %%b
GOTO OK

:: ERRORS ----------------------------------------------------------------------



:: END -------------------------------------------------------------------------

:OK
SET ERROR=0

:END
CLS