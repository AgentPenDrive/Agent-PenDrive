:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\MODULES\antivirus" MKDIR "%RAM%\MODULES\antivirus"

:OPTION_CHECK ------------------------------------------------------------------
IF %1==-install CALL "$setup\includes\install.bat"
IF %1==-get_param GOTO GET_PARAM
GOTO END

:GET_PARAM ---------------------------------------------------------------------
IF %2==name (
  FOR /F "tokens=1,2 delims==" %%a in (langs\%AP_LANG%.xml) do IF %%a==APP_NAME SET NAME=%%b
)
GOTO END

:END ---------------------------------------------------------------------------
IF NOT EXIST "%RAM%\MODULES\antivirus" RMDIR "%RAM%\MODULES\antivirus"