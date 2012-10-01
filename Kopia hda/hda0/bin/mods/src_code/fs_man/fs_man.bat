:PROPER ------------------------------------------------------------------------
CLS

SET MENU_TIME=%TIME:~0,5%
SET MENU_DATE=%DATE%

:: CREATE_security_DIR
IF NOT EXIST "%RAM%\SYSTEM\fs_man" MD "%RAM%\SYSTEM\fs_man"

:: SET_DEFAULT_LANG
CALL "$def_lang" fs_man

:: ------------------------------------------------

:MEMU --------------------------------------------------------------------------
CLS
CALL "W.BAT" box @%def_lang%.xml:MENU
IF %ERRORLEVEL%==1 GOTO SCAN
IF %ERRORLEVEL%==2 GOTO REPAIR_ERRORS
IF %ERRORLEVEL%==3 GOTO RECOVER_DATA
IF %ERRORLEVEL%==4 GOTO EXIT
IF %ERRORLEVEL%==100 GOTO EXIT
GOTO MENU

:SCAN --------------------------------------------------------------------------
CLS
CALL "includes\scan.bat"
PAUSE
GOTO MEMU

:REPAIR_ERRORS -----------------------------------------------------------------
CLS
CALL "includes\repair_errors.bat"
PAUSE
GOTO MEMU

:RECOVER_DATA ------------------------------------------------------------------
CLS
CALL "includes\recover_data.bat"
PAUSE
GOTO MEMU

:EXIT --------------------------------------------------------------------------
CLS
RMDIR /Q /S "%RAM%\MODULES\fs_man"
SET MENU_TIME=
SET MENU_DATE=
