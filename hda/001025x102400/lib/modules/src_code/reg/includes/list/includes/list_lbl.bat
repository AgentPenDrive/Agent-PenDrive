:: VAR_SET ----------------
SET LABEL=%1
SET CHAR=%1
:: VAR_CUT-----------------
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
SET CHAR=%CHAR:~0,1%
:: ------------------------
SET CHAR=%1
SET CHAR=%CHAR:~0,1%
IF "%CHAR%"=="[" ECHO %LABEL%>>"%LIST_FILE%"
:: ------------------------
SET LABEL=
SET CHAR=