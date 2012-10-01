:CHECK_PRAMETERS ---------------------------------------------------------------
IF %1==-dir GOTO REMOVE_DIR
IF %1==-key GOTO REMOVE_KEY
IF %1==-lbl GOTO REMOVE_LBL
IF %1==-value GOTO REMOVE_VALUE
GOTO END

:REMOVE_DIR --------------------------------------------------------------------
IF NOT EXIST "%REG%\%2" GOTO END
RMDIR /Q /S %REG%\%2
GOTO END

:REMOVE_KEY --------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
DEL %REG%\%2.ap_ini
GOTO END

:REMOVE_LBL --------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
INIFILE /remove %REG%\%2.ap_ini %3
GOTO END

:REMOVE_VALUE ------------------------------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO END
INIFILE %REG%\%2.ap_ini %3 %4=
GOTO END

:END ---------------------------------------------------------------------------
