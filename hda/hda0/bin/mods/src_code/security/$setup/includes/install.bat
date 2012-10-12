:MODULES_SETUP -----------------------------------------------------------------
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==APP_NAME CALL "$reg" /create -file "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "[SECURITY]" "name" "%%b"
CALL "$reg" /create -key "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "[SECURITY]" "link" "bin\mods\security.ap_app"  

:OPTIONAL_KEYS_INSTALL ---------------------------------------------------------
CALL "$reg" /create -dir "KEY_LOCAL_CONFIG\MODULES\security"

:SETUP -------------------------------------------------------------------------
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:SETUP
ECHO %ERRORLEVEL%
PAUSE
IF %ERRORLEVEL%==1 CALL "$browser" /dir -n %CD%
IF %ERRORLEVEL%==2 GOTO ADD
IF %ERRORLEVEL%==3 (
  SET NAME=
  SET RESULT=
  GOTO LIST
)
IF %ERRORLEVEL%==4 GOTO NEXT
IF %ERRORLEVEL%==100 GOTO BACK
GOTO SETUP

:ADD ---------------------------------------------------------------------------
:: ERROR_CHECK -----------------------------------------------------------------
IF "%NAME%"=="" (
  FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NO_NAME WBAT BOX %%b OK
  GOTO SETUP
)
IF "%RESULT%"=="" (
  FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NO_PATH WBAT BOX %%b OK
  GOTO SETUP
)
:: ERROR_CHECK_2 ---------------------------------------------------------------
CALL "$reg" /if_exist -key "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%NAME%"
IF %if_exist%==true (
  FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NAME_EXIST WBAT BOX %%b OK
  GOTO SETUP
)
CALL "$reg" /if_exist -value "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%RESULT%"
IF %if_exist%==true (
  FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==PATH_EXIST WBAT BOX %%b OK
  GOTO SETUP
)
:: ADD -------------------------------------------------------------------------
CALL "$reg" /create -file "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%NAME%" "%RESULT%"
CALL "$reg" /create -key "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%NAME%" "%RESULT%"
:: -----------------------------------------------------------------------------
SET NAME=
SET RESULT=
GOTO SETUP

:LIST --------------------------------------------------------------------------
:: DELETE_LIST-IF_EXIST --------------------------------------------------------
IF EXIST "%RAM%\MODULES\security\list.xml" DEL "%RAM%\MODULES\security\list.xml"
:: CREATE_LIST -----------------------------------------------------------------
CALL "$reg" /list -key "KEY_LOCAL_CONFIG\MODULES\security\conf" "%RAM%\MODULES\security\list.xml"
IF NOT EXIST "%RAM%\MODULES\security\list.xml" (
  FOR /F "eol=[ tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NO_PATHS WBAT BOX %%b OK
  GOTO SETUP
)
SORT "%RAM%\MODULES\security\list.xml" /O "%RAM%\MODULES\security\list.xml"
:: PATHS_LIST ------------------------------------------------------------------
CALL "$copyright" /down
CALL "W.BAT" LIST @"%RAM%\MODULES\security\list.xml"
IF %ERRORLEVEL%==254 GOTO SETUP
:: EDIT_VARS -------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%WBAT%" "RESULT"
SET NAME=%WBAT%
SET PATH_NAME=%WBAT%
:: PATHS_OPTIONS ---------------------------------------------------------------
FOR /F "eol=[ tokens=1,2,3,4 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==EDIT WBAT BOX %%b,%%c,%%d
IF %ERRORLEVEL%==1 GOTO EDIT
IF %ERRORLEVEL%==2 GOTO REMOVE
IF %ERRORLEVEL%==3 GOTO LIST
:: END -------------------------------------------------------------------------
IF EXIST "%RAM%\MODULES\security\list.xml" DEL "%RAM%\MODULES\security\list.xml"
GOTO LIST

:EDIT --------------------------------------------------------------------------
CALL "W.BAT" BOX @langs\%AP_LANG%.xml:EDIT
IF %ERRORLEVEL%==1 CALL "$browser" /dir -n %CD%
IF %ERRORLEVEL%==2 GOTO LIST
IF %ERRORLEVEL%==3 (
  IF "%PATH_NAME%"=="" FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NO_NAME (
    WBAT BOX %%b OK
    GOTO SETUP
  )
  IF "%RESULT%"=="" FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==NO_PATH (
    WBAT BOX %%b OK
    GOTO SETUP
  )
  CALL "$reg" /remove -key "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%PATH_NAME%"
  CALL "$reg" /create -key "KEY_LOCAL_CONFIG\MODULES\security\conf" "[PATHS]" "%NAME%" "%RESULT%"
  GOTO LIST
)
IF %ERRORLEVEL%==100 GOTO LIST
GOTO EDIT

:REMOVE ------------------------------------------------------------------------
CALL "$reg" /remove -key KEY_LOCAL_CONFIG\MODULES\security\conf [PATHS] %PATH_NAME%
GOTO LIST

:INSTALLATION_STATUS -----------------------------------------------------------
CALL "$reg" /if_exist -lbl KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY]
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do (
  IF %if_exist%==true IF %%a==SUCCES WBAT BOX %%b OK
  IF %if_exist%==false IF %%a==FAIL WBAT BOX %%b OK
)
GOTO NEXT

:NEXT --------------------------------------------------------------------------
IF EXIST 

:END ---------------------------------------------------------------------------
SET NAME=
SET PATH_NAME=
SET RESULT=
SET if_exist=