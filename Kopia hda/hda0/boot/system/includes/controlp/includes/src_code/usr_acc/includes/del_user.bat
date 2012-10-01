:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\usr_acc\users.xml"
CALL "$reg" /list -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf %RAM%\SYSTEM\controlp\usr_acc\users.xml
SORT "%RAM%\SYSTEM\controlp\usr_acc\users.xml" /O "%RAM%\SYSTEM\controlp\usr_acc\users.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\usr_acc\users.xml"
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
CALL "$reg" /remove -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] %USER_NAME%
GOTO END

:END ---------------------------------------------------------------------------
CLS
DEL "%RAM%\SYSTEM\controlp\usr_acc\users.xml"
SET USER_NAME=
SET ERRORLEVEL=
