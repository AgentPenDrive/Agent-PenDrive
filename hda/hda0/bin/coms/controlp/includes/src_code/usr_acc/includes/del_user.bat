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
  GOTO DEL_USER
)

:DEL_USER ----------------------------------------------------------------------
CLS
IF %USER_NAME%==%AP_USERNAME% FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml) do IF %%a==LOGED_IN (
  CALL WBAT BOX "%%b" OK
  GOTO END
)
CALL "$reg" /remove -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%USER_NAME%"
GOTO END

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml" DEL "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
SET USER_NAME=
SET ERRORLEVEL=
