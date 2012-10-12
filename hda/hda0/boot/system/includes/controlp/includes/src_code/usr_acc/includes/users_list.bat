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
GOTO END

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml" DEL "%RAM%\SYSTEM\controlp\usr_acc\usrs.xml"
SET ERRORLEVEL=