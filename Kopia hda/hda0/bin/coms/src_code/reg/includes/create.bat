:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO CREATE_DIR
IF %1==-key GOTO CREATE_KEY
IF %1==-value GOTO CREATE_VALUE
GOTO END

:CREATE_DIR --------------------------------------------------------------------
IF EXIST "%REG%\%2" GOTO END
MKDIR %REG%\%2
GOTO END

:CREATE_KEY --------------------------------------------------------------------
IF EXIST "%REG%\%2.ap_ini" GOTO END
IF NOT EXIST "%REG%\%2.ap_ini" ECHO %3>"%REG%\%2.ap_ini"
INIFILE %REG%\%2.ap_ini %3 %4=%5
GOTO END

:CREATE_VALUE ------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
INIFILE %REG%\%2.ap_ini %3 %4=%5
GOTO END

:END ---------------------------------------------------------------------------
