:MODULES_SETUP -----------------------------------------------------------------
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==APP_NAME CALL "$reg" /create -file "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "[ANTIVIRUS]" "name" "%%b"
CALL "$reg" /create -key "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "[ANTIVIRUS]" "link" "bin\mods\antivirus.ap_app"  

:INSTALLATION_STATUS -----------------------------------------------------------
CALL "$reg" /if_exist -lbl "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "[ANTIVIRUS]"
FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do (
  IF %if_exist%==true IF %%a==SUCCES WBAT BOX %%b OK
  IF %if_exist%==false IF %%a==FAIL WBAT BOX %%b OK
)
GOTO NED

:END ---------------------------------------------------------------------------
SET NAME=
SET PATH_NAME=
SET RESULT=
SET if_exist=