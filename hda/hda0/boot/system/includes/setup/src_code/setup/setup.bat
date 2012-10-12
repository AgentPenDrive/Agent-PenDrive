:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\SYSTEM\setup" MKDIR "%RAM%\SYSTEM\setup"

:INITIAL_SETUP -----------------------------------------------------------------
CLS
CALL "$reg" /reg -rm_keyfile "KEY_LOCAL_CONFIG"
CALL "$reg" /reg -md_keyfile "KEY_LOCAL_CONFIG"
CALL "$reg" /reg -load "KEY_LOCAL_CONFIG"
CALL "$reg" /create -dir "KEY_LOCAL_CONFIG\SYSTEM"
CALL "$reg" /create -file "KEY_LOCAL_CONFIG\ap_conf" "[MAIN]" "AP_VER" "01.06.00"

:LANGUAGE_SETUP ----------------------------------------------------------------
CLS
DIR "%SYSTEM_DIR%\langs\system" /B /AD>"%RAM%\SYSTEM\setup\list.xml"
CALL "W.BAT" LIST @%RAM%\SYSTEM\setup\list.xml
IF %ERRORLEVEL%==254 GOTO LANGUAGE_SETUP
SET AP_LANG=%WBAT%
CALL "$reg" /create -key "KEY_LOCAL_CONFIG\ap_conf" "[MAIN]" "AP_LANG" "%WBAT%"
GOTO ACCESER_SETUP

:ACCESER_SETUP -----------------------------------------------------------------
CLS
CALL "includes\acceser\acceser.bat"
IF %RETURN%==back GOTO LANGUAGE_SETUP
IF %RETURN%==next GOTO MODULES_INSTALLATION
GOTO ACCESER_SETUP

:MODULES_INSTALLATION ----------------------------------------------------------
CLS
:: CREATE_MODULES_REG ----------------------------------------------------------
CALL "$reg" /create -dir "KEY_LOCAL_CONFIG\SYSTEM\modules"
:: COMPONENTS_INSTALLATION -----------------------------------------------------
CALL "$copyright" /down
CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\setup\%AP_LANG%.xml:MODULES_INSTALLATION
IF %ERRORLEVEL%==1 GOTO ACCESER_SETUP
IF %ERRORLEVEL%==2 (
  IF %WCB1%==1 CALL "$run" %AP_DIR%\bin\mods\fs_man.ap_app /setup -install
  IF %WCB2%==1 CALL "$run" %AP_DIR%\bin\mods\security.ap_app /setup -install
  GOTO END
)
IF %ERRORLEVEL%==100 GOTO ACCESER_SETUP
GOTO MODULES_INSTALLATION

:END ---------------------------------------------------------------------------
CLS
IF EXIST "%RAM%\SYSTEM\setup" RMDIR /Q /S "%RAM%\SYSTEM\setup"
SET return=