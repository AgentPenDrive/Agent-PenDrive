:LOAD --------------------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%1) do IF %%a==LOCAL SET %%b=%APDATA%\%%c
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%1) do IF %%a==GLOBAL SET %%b=%%c
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (%1) do @ECHO %%a=%%b=%%c>>%RAM%\KERNEL\var\$act_var.ap_ini
GOTO END

:END ---------------------------------------------------------------------------
SET ERROR=0
