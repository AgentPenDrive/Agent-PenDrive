:LOAD_NAME ---------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\apps\conf" "%1 "name" "NAME"

:LOAD_LINK ---------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\apps\conf" "%1" "link" "LINK"

:LOAD_LINK ---------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\apps\conf" "%1" "param" "PARAM"

:SAVE --------------------------------------------------------------------------
ECHO %NAME%>>"%RAM%\SYSTEM\apps\list.xml"
ECHO %NAME%=%LINK%=%PARAM%>>"%RAM%\SYSTEM\apps\index.ap_ini"

:END ---------------------------------------------------------------------------
SET NAME=
SET LINK=
SET PARAM=
SET ERRORLEVEL=
