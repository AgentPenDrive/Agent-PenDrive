IF %1==/local GOTO LOCAL
IF %1==/global GOTO GLOBAL
GOTO END

:LOCAL -------------------------------------------------------------------------
IF NOT EXIST "%2" GOTO END
PATH %CD%\%2;%PATH%
GOTO END

:GLOBAL ------------------------------------------------------------------------
IF NOT EXIST "%2" GOTO END
PATH %2;%PATH%
GOTO END

:END ---------------------------------------------------------------------------
