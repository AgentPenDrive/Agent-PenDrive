:: VAR_SET ----------------
SET KEY=%1
:: VAR_CUT-----------------
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
:: ------------------------
ECHO %KEY% >>"%LIST_FILE%"
:: ------------------------
SET KEY=