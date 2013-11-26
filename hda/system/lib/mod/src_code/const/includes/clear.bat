IF EXIST "%RAM%\KERNEL\const\$act_const.ap_ini" GOTO EXIST
IF NOT EXIST "%RAM%\KERNEL\const\$act_const.ap_ini" GOTO NOT_EXIST

:EXIST -------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\KERNEL\const\$act_const.ap_ini) do SET %%b=
RMDIR /Q /S "%RAM%\KERNEL\const"
GOTO END

:NOT_EXIST ---------------------------------------------------------------------
GOTO END

:END ---------------------------------------------------------------------------
SET ERROR=0
