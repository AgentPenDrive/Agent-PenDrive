:LOAD_NAME ---------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\apps\conf %1 name NAME

:LOAD_LINK ---------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\apps\conf %1 un_link UN_LINK

:LOAD_PARAM ----------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\apps\conf %1 un_param UN_PARAM

:LOAD_UN_TYPE ------------------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\apps\conf %1 un_type UN_TYPE

:SAVE --------------------------------------------------------------------------
ECHO %NAME%>>"%RAM%\SYSTEM\controlp\app_man\list.xml"
ECHO %NAME%=%UN_LINK%=%UN_PARAM%=%UN_TYPE%>>"%RAM%\SYSTEM\controlp\app_man\index.ap_ini"

:END ---------------------------------------------------------------------------
SET NAME=
SET UN_LINK=
SET UN_PARAM=
SET UN_TYPE=
SET ERRORLEVEL=
