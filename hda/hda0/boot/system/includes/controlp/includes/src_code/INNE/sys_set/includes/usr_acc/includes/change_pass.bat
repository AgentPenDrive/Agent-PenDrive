:CREATE_LIST -------------------------------------------------------------------
CLS
:: ECHO "Aktualnie zainstalowane moduly" [x]>"%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
CALL "$reg" /list -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf %RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml
SORT "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml" /O "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"

:USERS_LIST --------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" LIST @%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml
IF %ERRORLEVEL%==254 GOTO END
IF NOT %ERRORLEVEL%==254 (
  SET USER_NAME=%WBAT%
  GOTO DIALOG
)

:DIALOG ------------------------------------------------------------------------
CLS
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" @%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml:CHANGE_PASS
IF %ERRORLEVEL%==1 GOTO CHECK
IF %ERRORLEVEL%==2 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO DIALOG

:CHECK -------------------------------------------------------------------------
CLS
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] %USER_NAME% PASS_TPL
IF "%PASS_NEW%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF "%PASS_NEW2%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF "%PASS_OLD%"=="" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)

:ACTION ------------------------------------------------------------------------
CLS
IF NOT "%PASS_OLD%"=="%PASS_TPL%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==INVALID (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF NOT "%PASS_NEW%"=="%PASS_NEW2%" FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==NOT_EQU (
  CALL WBAT BOX "%%b" OK
  GOTO DIALOG
)
IF "%PASS_OLD%"=="%PASS_TPL%" (
  CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] %USER_NAME% "%PASS_NEW%"
  FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\controlp\%AP_LANG%\sys_set\usr_acc.xml) do IF %%a==VALID (
    CALL WBAT BOX "%%b" OK
  )
)
GOTO END

:END ---------------------------------------------------------------------------
CLS
DEL "%RAM%\SYSTEM\controlp\sys_set\usr_acc\usrs.xml"
SET PASS_OLD=
SET PASS_TPL=
SET PASS_NEW=
SET PASS_NEW2=
SET USER_NAME=
SET ERRORLEVEL=
