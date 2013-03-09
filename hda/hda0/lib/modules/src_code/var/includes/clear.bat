IF EXIST "%RAM%\KERNEL\var\$act_var.ap_ini" GOTO EXIST
IF NOT EXIST "%RAM%\KERNEL\var\$act_var.ap_ini" GOTO NOT_EXIST

:EXIST -------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%RAM%\KERNEL\var\$act_var.ap_ini) do SET %%b=
RMDIR /Q /S "%RAM%\KERNEL\var"
GOTO END

:NOT_EXIST ---------------------------------------------------------------------
GOTO END

:END ---------------------------------------------------------------------------
SET ERROR=0
