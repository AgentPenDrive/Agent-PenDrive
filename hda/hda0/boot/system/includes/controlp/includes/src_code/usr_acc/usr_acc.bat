:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%RAM%\SYSTEM\controlp\usr_acc" MD "%RAM%\SYSTEM\controlp\usr_acc"

:MENU --------------------------------------------------------------------------
CLS
WBAT TEXT 80,1 (light white on light red) @%SYSTEM_DIR%\langs\system\%AP_LANG%.xml:COPYRIGHT
CALL "W.BAT" BOX @"%SYSTEM_DIR%\langs\controlp\%AP_LANG%\usr_acc.xml":MENU
IF %ERRORLEVEL%==1 CALL "includes\add_user.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==2 CALL "includes\del_user.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==3 CALL "includes\change_pass.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==4 CALL "includes\users_list.bat" & SET ERRORLEVEL=
IF %ERRORLEVEL%==5 GOTO END
IF %ERRORLEVEL%==100 GOTO END
GOTO MENU

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\controlp\usr_acc" RMDIR /Q /S "%RAM%\SYSTEM\controlp\usr_acc"
SET ERRORLEVEL=