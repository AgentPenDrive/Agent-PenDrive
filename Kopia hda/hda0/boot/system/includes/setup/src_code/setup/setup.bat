:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\COMPONENTS\setup" MKDIR "%RAM%\COMPONENTS\setup"

:INITIAL_SETUP -----------------------------------------------------------------
CLS
DEL "%AP_DIR%\etc\reg\KEY_LOCAL_CONFIG.ap_reg"
IF EXIST "%AP_DIR%\etc\reg\KEY_LOCAL_CONFIG.ap_reg" GOTO END
IF NOT EXIST "%AP_DIR%\etc\reg\KEY_LOCAL_CONFIG.ap_reg" GOTO LANGUAGE_SETUP

:LANGUAGE_SETUP ----------------------------------------------------------------
CLS
DIR "%SYSTEM_DIR%\langs\system\*.xml" /B /A-D >"%RAM%\COMPONENTS\setup\list.xml"
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\Polish.xml:COPYRIGHT
WBAT LIST @%RAM%\COMPONENTS\setup\list.xml
IF %ERRORLEVEL%=254
SET AP_LANG=%WBAT%
ECHO %AP_LANG%
PAUSE
GOTO ACCESER_SETUP

:ACCESER_SETUP -----------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @langs\%AP_LANG%\acceser.xml:USER

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\COMPONENTS\setup" RMDIR /Q /S "%RAM%\COMPONENTS\setup"