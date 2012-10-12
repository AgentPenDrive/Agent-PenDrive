:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\setup\acceser" MKDIR "%RAM%\SYSTEM\setup\acceser"
SET LOGIN=
SET PASS=
SET PASS2=

:USERS -------------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml:USRS
IF %ERRORLEVEL%==1 GOTO USERS_ADDING
IF %ERRORLEVEL%==2 GOTO USERS_LIST
IF %ERRORLEVEL%==3 GOTO BACK
IF %ERRORLEVEL%==4 GOTO NEXT
IF %ERRORLEVEL%==100 GOTO BACK
GOTO USERS_ADDING

:USERS_ADDING ------------------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml:USRS_ADD
IF %ERRORLEVEL%==1 GOTO USERS
IF %ERRORLEVEL%==2 GOTO ADD_USER
IF %ERRORLEVEL%==100 GOTO USERS
GOTO USERS_ADDING

:ADD_USER ----------------------------------------------------------------------
CLS
IF "%PASS%"=="" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==PASS_NOT_ENT WBAT BOX %%b OK
  SET PASS=
  SET PASS2=
  GOTO USERS_ADDING
)
IF "%PASS2%"=="" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==PASS_NOT_ENT WBAT BOX %%b OK
  SET PASS=
  SET PASS2=
  GOTO USERS_ADDING
)
IF NOT "%PASS%"=="%PASS2%" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==PASS_NOT_EQU WBAT BOX %%b OK
  SET PASS=
  SET PASS2=
  GOTO USERS_ADDING
)
CALL "$reg" /if_exist -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%LOGIN%"
IF "%if_exist%"=="true" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==USR_EXIST WBAT BOX %%b OK
  SET PASS=
  SET PASS2=
  GOTO USERS_ADDING
)
:: USER_ADDING -----------------------------------------------------------------
CLS
CALL "$reg" /if_exist -file "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf"
IF %if_exist%==false (
  CALL "$reg" /create -dir "KEY_LOCAL_CONFIG\SYSTEM\acceser"
  CALL "$reg" /create -file "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "AP_LOGIN" "AP_PASS"
  CALL "$reg" /remove -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "AP_LOGIN" "AP_PASS"
)
CALL "$reg" /create -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%LOGIN%" "%PASS%"
CALL "$reg" /if_exist -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%LOGIN%"
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do (
  IF %if_exist%==true IF %%a==USR_ADDED WBAT BOX %%b OK
  IF %if_exist%==false IF %%a==USR_NOT_ADDED WBAT BOX %%b OK
)
SET LOGIN=
SET PASS=
SET PASS2=
SET ERRORLEVEL=
GOTO USERS

:USERS_LIST --------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\setup\acceser\users.xml" DEL "%RAM%\SYSTEM\setup\acceser\users.xml"
:: CREATE_LIST -----------------------------------------------------------------
CALL "$reg" /list -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%RAM%\SYSTEM\setup\acceser\users.xml"
IF NOT EXIST "%RAM%\SYSTEM\setup\acceser\users.xml" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==NO_USR_LST WBAT BOX %%b OK
  GOTO USERS
)
SORT "%RAM%\SYSTEM\setup\acceser\users.xml" /O "%RAM%\SYSTEM\setup\acceser\users.xml"
:: USERS_LIST-OPTIONS ----------------------------------------------------------
CLS
CALL "$copyright" /down
CALL "W.BAT" LIST @"%RAM%\SYSTEM\setup\acceser\users.xml"
IF %ERRORLEVEL%==1 GOTO USERS
SET USER_NAME=%WBAT%
:: USERS_OPTIONS ---------------------------------------------------------------
CLS
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml:USRS_LST-OPT
IF %ERRORLEVEL%==1 ECHO USERS_LIST=1
IF %ERRORLEVEL%==2 ECHO USERS_LIST=2
IF %ERRORLEVEL%==3 CALL "$reg" /remove -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "[USERS]" "%USER_NAME%"
IF EXIST "%RAM%\SYSTEM\setup\acceser\users.xml" DEL "%RAM%\SYSTEM\setup\acceser\users.xml"
SET USER_NAME=
GOTO USERS_LIST

:BACK --------------------------------------------------------------------------
CLS
SET RETURN=back
GOTO END

:NEXT --------------------------------------------------------------------------
CLS
CALL "$reg" /list -key "KEY_LOCAL_CONFIG\SYSTEM\acceser\conf" "%RAM%\SYSTEM\setup\acceser\users.xml"
IF NOT EXIST "%RAM%\SYSTEM\setup\acceser\users.xml" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml) do IF %%a==NO_USR_NXT WBAT BOX %%b OK
  GOTO USERS_ADDING
)
IF EXIST "%RAM%\SYSTEM\setup\acceser\users.xml" DEL "%RAM%\SYSTEM\setup\acceser\users.xml"
SET RETURN=next
GOTO END

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\setup\acceser" RMDIR /Q /S "%RAM%\SYSTEM\setup\acceser"
SET LOGIN=
SET PASS=
SET PASS2=
SET USER_NAME=
SET if_exist=