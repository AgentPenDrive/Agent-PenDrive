:PROPER ------------------------------------------------------------------------
SET FILE=%1

:CHECK -------------------------------------------------------------------------
IF NOT %FILE:~-7%==.ap_app GOTO END
SET FILE=
IF NOT EXIST "%1" GOTO END

:RUN ---------------------------------------------------------------------------
CALL "%COMDIR%\includes\ap_app.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9

:END ---------------------------------------------------------------------------