:INITIAL_SETUP -----------------------------------------------------------------
CLS
SET LOGIN=
SET PASS=
SET PASS2=
GOTO MENU

:MENU --------------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml":ADD_USER
IF %ERRORLEVEL%==1 GOTO CREATE
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:CREATE ------------------------------------------------------------------------
:: CHECK_EXISTING ----------------------
CALL "$reg" /if_exist -value "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%LOGIN%"
IF %if_exist%==true FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==EXIST (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF "%PASS%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==NOT_ENT (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF NOT "%PASS%"=="%PASS2%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==NOT_ENT (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)

:: CREATE ------------------------------
CALL "$reg" /create -value "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%LOGIN%" "%PASS%"
CALL "$reg" /if_exist -value "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%LOGIN%"
IF %if_exist%==true FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==ADDED (
  CALL WBAT BOX "%%b" OK
  GOTO END
)

:END ---------------------------------------------------------------------------
CLS
SET LOGIN=
SET PASS=
SET PASS2=
SET if_exist=
SET ERRORLEVEL=
