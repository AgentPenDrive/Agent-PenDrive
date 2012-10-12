:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\usr_acc\users.xml"
CALL "$reg" /list -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf %RAM%\SYSTEM\controlp\usr_acc\users.xml
SORT "%RAM%\SYSTEM\controlp\usr_acc\users.xml" /O "%RAM%\SYSTEM\controlp\usr_acc\users.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\usr_acc\users.xml"
IF %ERRORLEVEL%==254 GOTO END
GOTO END

:END ---------------------------------------------------------------------------
CLS
DEL "%RAM%\SYSTEM\controlp\usr_acc\users.xml"
SET ERRORLEVEL=