:CHECK -------------------------------------------------------------------------
IF %1==/up GOTO UP
IF %1==/down GOTO DOWN
GOTO DOWN

:UP ----------------------------------------------------------------------------
WBAT TEXT 1,1 (light white on light blue) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
GOTO END

:DOWN --------------------------------------------------------------------------
WBAT TEXT 80,1 (light white on light blue) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
GOTO END

:END ---------------------------------------------------------------------------