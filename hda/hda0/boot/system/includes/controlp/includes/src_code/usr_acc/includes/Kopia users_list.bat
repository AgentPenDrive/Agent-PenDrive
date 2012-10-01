:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
CALL "$reg" /list -value SYSTEM\acceser\conf %RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml
SORT "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml" /O "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
CALL "W.BAT" TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @"%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
IF %ERRORLEVEL%==100 GOTO END
SET USER_NAME=%WBAT%
GOTO MENU

:MENU --------------------------------------------------------------------------
CLS
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml":USERS_LIST
IF %ERRORLEVEL%==1 GOTO DEL_USER
IF %ERRORLEVEL%==2 GOTO CHANGE_PASS
IF %ERRORLEVEL%==3 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:DEL_USER ----------------------------------------------------------------------
CLS
IF %USER_NAME%==%AP_USERNAME% FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==LOGED_IN (
CALL WBAT BOX "%%b" OK
GOTO MENU
)
CALL "$reg" /remove -value SYSTEM\acceser\conf [USERS] %USER_NAME%
GOTO END

:CHANGE_PASS -------------------------------------------------------------------
CLS
:: PROPER --------------------------------------------------
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
:: DIALOG --------------------------------------------------
CALL "W.BAT" TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml":CHANGE_PASS
IF %ERRORLEVEL%==2 (
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
GOTO MENU
)
IF %ERRORLEVEL%==100 (
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
GOTO MENU
)
::CHECK ----------------------------------------------------
CALL "$reg" /load SYSTEM\acceser\conf [USERS] %USER_NAME% PASS_TPL
IF "%PASS_NEW%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF "%PASS_NEW2%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF "%PASS_OLD%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
:: -------------------------------------
IF NOT "%PASS_OLD%"=="%PASS_TPL%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF NOT "%PASS_NEW%"=="%PASS_NEW2%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO MENU
)
IF "%PASS_OLD%"=="%PASS_TPL%" (
  CALL "$reg" /create -value SYSTEM\acceser\conf [USERS] %USER_NAME% %PASS_NEW%
  FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==VALID (
    CALL WBAT BOX "%%b" OK
  )
)
:: END -----------------------------------------------------
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
GOTO END

:END ---------------------------------------------------------------------------
CLS
DEL "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
SET USER_NAME=
SET ERRORLEVEL=
