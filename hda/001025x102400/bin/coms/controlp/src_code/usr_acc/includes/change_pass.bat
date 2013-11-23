:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\usr_acc\users.xml"
IF EXIST "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml" DEL "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
CALL "$reg" /list -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
SORT "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml" /O "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 (
  SET USER_NAME=%WBAT%
  GOTO DIALOG
)

:DIALOG ------------------------------------------------------------------------
CLS
SET PASS_OLD=
SET PASS_NEW=
SET PASS_NEW2=
CALL "$copyright" /down
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml":CHANGE_PASS
IF %ERRORLEVEL%==1 GOTO END
IF %ERRORLEVEL%==2 GOTO CHECK
IF %ERRORLEVEL%==100 GOTO END
GOTO DIALOG

:CHECK -------------------------------------------------------------------------
CLS
CALL "$reg" /load -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%USER_NAME%" "PASS_TPL"
ECHO %USER_NAME%
ECHO %PASS_OLD%
ECHO %PASS_TPL%
ECHO %PASS_NEW%
ECHO %PASS_NEW2%
ECHO %PASS_NEW3%
PAUSE
IF "%PASS_OLD%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF "%PASS_NEW%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF "%PASS_NEW2%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF NOT "%PASS_OLD%"=="%PASS_TPL%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF NOT "%PASS_NEW%"=="%PASS_NEW2%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)

:ACTION ------------------------------------------------------------------------
CLS
IF "%PASS_OLD%"=="%PASS_TPL%" (
  CALL "$reg" /create -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%USER_NAME%" "%PASS_NEW%"
  CALL "$reg" /load -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%USER_NAME%" "PASS_NEW3"
  IF "%PASS_NEW3%"=="%PASS_NEW%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==VALID CALL WBAT BOX "%%b" OK
)

GOTO END

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml" DEL "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
SET USER_NAME=
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
SET PASS_NEW3=
SET ERRORLEVEL=
