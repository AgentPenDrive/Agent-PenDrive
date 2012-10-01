:: -----------------------------------------------------------------------------

:CHECK_LOGIN -----------------------------------------------
CALL "$reg" /if_exist -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf %LOGIN%
IF %if_exist%==false GOTO INVALID

:CHECK_PASSWORD --------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] %LOGIN% PASS_TPL
IF NOT #%PASS%==#%PASS_TPL% GOTO INVALID

:: -----------------------------------------------------------------------------

:VALID -----------------------------------------------------
CLS
SET ACCESER=true
SET AP_USERNAME=%LOGIN%
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
FOR /F "eol=# tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\acceser\%AP_LANG%.xml) do IF %%a==VALID WBAT BOX "%%b %AP_USERNAME%!" OK
GOTO END

:INVALID ---------------------------------------------------
CLS
SET ACCESER=false
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
FOR /F "eol=# tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\acceser\%AP_LANG%.xml) do IF %%a==INVALID WBAT BOX (light white on light red) "%%b" OK
GOTO END

:: -----------------------------------------------------------------------------

:END -------------------------------------------------------
SET ERRORLEVEL=
SET PASS_TPL=
