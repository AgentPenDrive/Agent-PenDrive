:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @%SYSTEM_DIR%\langs\controlp\%AP_LANG%\main_set.xml:MENU
IF %ERRORLEVEL%==1 GOTO BROWSE
IF %ERRORLEVEL%==2 GOTO CHECK
IF %ERRORLEVEL%==3 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
SET ERRORLEVEL=
