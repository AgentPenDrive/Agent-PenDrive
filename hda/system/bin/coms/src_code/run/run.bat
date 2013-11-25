:INITIAL_SETUP -----------------------------------------------------------------
CLS
SET FILE=
GOTO MENU

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\run\%AP_LANG%.xml:MENU
IF %ERRORLEVEL%==1 GOTO CHECK
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==2 GOTO BROWSE
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:CHECK -------------------------------------------------------------------------
CLS
IF EXIST "%FILE%" GOTO OUT
IF NOT EXIST "%FILE%" GOTO IN
GOTO CHECK

:OUT ---------------------------------------------------------------------------
CLS
:: PKG ---------------------------------

IF %FILE:~-7%==.ap_pkg (
  CALL "$run" -pkg "%FILE:~0,-7%"
  GOTO END
)
IF %FILE:~-7%==.AP_PKG (
  CALL "$run" -pkg "%FILE:~0,-7%"
  GOTO END
)
:: APP ---------------------------------
IF %FILE:~-7%==.ap_app (
  CALL "$run" -app "%FILE:~0,-7%"
  GOTO END
)
IF %FILE:~-7%==.AP_APP (
  CALL "$run" -app "%FILE:~0,-7%"
  GOTO END
)
:: MOD ---------------------------------
IF %FILE:~-7%==.ap_mod (
  CALL "$run" -mod "%FILE:~0,-7%"
  GOTO END
)
IF %FILE:~-7%==.AP_MOD (
  CALL "$run" -mod "%FILE:~0,-7%"
  GOTO END
)
:: UPD ---------------------------------
IF %FILE:~-7%==.ap_upd (
  CALL "$run" -pkg "%FILE:~0,-7%"
  GOTO END
)
IF %FILE:~-7%==.AP_UPD (
  CALL "$run" -pkg "%FILE:~0,-7%"
  GOTO END
)
:: NOT ---------------------------------
CALL "%FILE%"
GOTO END

:OUT ---------------------------------------------------------------------------
CLS
IF EXIST "%BIN%\apps\%FILE%" (
  IF %FILE:~-7%==.AP_UPD (
    
  )
  GOTO END
)
  IF EXIST "%API%\mods\%FILE%" (
  GOTO END
)
  IF EXIST "%BIN%\comps\%FILE%" (
  GOTO END
)
GOTO END

:NOT_EXIST ---------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @%SYSTEM_DIR%\langs\run\%AP_LANG%.xml:NOT_EXIST
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
