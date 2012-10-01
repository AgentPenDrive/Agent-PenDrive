IF %1==-dir GOTO IF_EXIST_DIR
IF %1==-key GOTO IF_EXIST_KEY
IF %1==-lbl GOTO IF_EXIST_LBL
IF %1==-value GOTO IF_EXIST_VALUE
GOTO END

:: -----------------------------------------------------------------------------

:IF_EXIST_DIR ----------------------------------------------
IF EXIST "%REG%\%2" GOTO EXIST
IF NOT EXIST "%REG%\%2" GOTO NOT_EXIST
GOTO IF_EXIST_DIR

:IF_EXIST_KEY ----------------------------------------------
IF EXIST "%REG%\%2.ap_ini" GOTO EXIST
IF NOT EXIST "%REG%\%2.ap_ini" GOTO NOT_EXIST
GOTO IF_EXIST_KEY

:IF_EXIST_LBL ----------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO NOT_EXIST
FOR /F "tokens=1 delims==" %%a in (%REG%\%2.ap_ini) do IF %%a==%3 GOTO EXIST
GOTO NOT_EXIST
GOTO IF_EXIST_LBL

:IF_EXIST_VALUE --------------------------------------------
IF NOT EXIST "%REG%\%2.ap_ini" GOTO NOT_EXIST
FOR /F "eol=[ tokens=1 delims==" %%a in (%REG%\%2.ap_ini) do IF %%a==%3 GOTO EXIST
GOTO NOT_EXIST
GOTO IF_EXIST_VALUE

:: -----------------------------------------------------------------------------

:EXIST -----------------------------------------------------
SET if_exist=true
GOTO END

:NOT_EXIST -------------------------------------------------
SET if_exist=false
GOTO END

:: -----------------------------------------------------------------------------

:END -------------------------------------------------------
