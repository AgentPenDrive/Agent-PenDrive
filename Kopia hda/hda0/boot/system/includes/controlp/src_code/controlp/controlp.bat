:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp" MD "%RAM%\SYSTEM\controlp"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
WBAT BOX @%SYSTEM_DIR%\langs\controlp\%AP_LANG%\controlp.xml:MENU
IF %ERRORLEVEL%==1 CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\sec_cen.ap_app
IF %ERRORLEVEL%==2 CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\usr_acc.ap_app
IF %ERRORLEVEL%==3 CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\app_man.ap_app
IF %ERRORLEVEL%==4 FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\system\%AP_LANG%.xml) do IF %%a==BETA CALL WBAT BOX (light white on light blue) "%%b" OK
IF %ERRORLEVEL%==5 FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\system\%AP_LANG%.xml) do IF %%a==BETA CALL WBAT BOX (light white on light blue) "%%b" OK
IF %ERRORLEVEL%==6 FOR /F "tokens=1,2 delims==" %%a in (%SYSTEM_DIR%\langs\system\%AP_LANG%.xml) do IF %%a==BETA CALL WBAT BOX (light white on light blue) "%%b" OK
IF %ERRORLEVEL%==7 CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\app_set.ap_app
IF %ERRORLEVEL%==8 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp" RMDIR /Q /S "%RAM%\SYSTEM\controlp"
SET ERRORLEVEL=

:: CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\net_set.ap_app
:: CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\thm_set.ap_app
:: CALL "$run" %SYSTEM_DIR%\includes\controlp\includes\lng_set.ap_app