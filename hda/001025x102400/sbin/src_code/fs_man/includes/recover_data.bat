FOR /F "eol=# tokens=1,2 delims==" %%a in (%def_lang%.xml) do IF %%a==RECOVER_DATA CALL "W.BAT" TEXT 1,1 (light white on light red) %%b
CHKDSK /X /F /R
ECHO.
