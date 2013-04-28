:LOAD_NAME ---------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf %1 name NAME

:LOAD_LINK ---------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf %1 link LINK

:LOAD_PARAM --------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf %1 param PARAM

:SAVE --------------------------------------------------------------------------
ECHO %NAME%>>"%RAM%\SYSTEM\controlp\app_set\list.xml"
ECHO %NAME%=%LINK%=%PARAM%>>"%RAM%\SYSTEM\controlp\app_set\index.ap_ini"

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=
SET NAME=
SET LINK=
SET PARAM=
