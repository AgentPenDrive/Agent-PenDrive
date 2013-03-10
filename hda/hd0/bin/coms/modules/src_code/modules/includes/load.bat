:LOAD_NAME ---------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "%1" "name" "NAME"

:LOAD_LINK ---------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "%1" "link" "LINK"

:LOAD_PARAM --------------------------------------------------------------------
CALL "$reg" /load "KEY_LOCAL_CONFIG\SYSTEM\modules\conf" "%1" "param" "PARAM"

:SAVE --------------------------------------------------------------------------
ECHO %NAME%>>"%RAM%\SYSTEM\modules\list.xml"
ECHO %NAME%=%LINK%=%PARAM%>>"%RAM%\SYSTEM\modules\index.ap_ini"

:END ---------------------------------------------------------------------------
SET NAME=
SET LINK=
SET PARAM=
SET ERRORLEVEL=
