:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
CALL "$reg" /list -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf %RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml
SORT "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml" /O "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
CALL "W.BAT" TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
IF %ERRORLEVEL%==100 GOTO END
GOTO END

:END ---------------------------------------------------------------------------
CLS
DEL "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
SET ERRORLEVEL=
