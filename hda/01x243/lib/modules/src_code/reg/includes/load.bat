:PROPER ------------------------------------------------------------------------
:: VAR_SET ----------------
SET FILE=%1
SET LABEL=%2
SET KEY=%3
SET VAR=%4
:: VAR_CUT-----------------
SET FILE=%FILE:~1%
SET FILE=%REG%\%FILE:~0,-1%.ap_ini
SET LABEL=%LABEL:~1%
SET LABEL=%LABEL:~0,-1%
SET KEY=%KEY:~1%
SET KEY=%KEY:~0,-1%
SET VAR=%VAR:~1%
SET VAR=%VAR:~0,-1%
:: ------------------------

:CHECK_EXISTING ----------------------------------------------------------------
IF NOT EXIST "%FILE%" GOTO END

:LOAD_KEY ----------------------------------------------------------------------
INIFILE %FILE% %LABEL% %KEY%>"%RAM%\KERNEL\reg\value.ap_ini"
FOR /F "tokens=1 delims=" %%a in (%RAM%\KERNEL\reg\value.ap_ini) do SET VALUE=%%a
SET VALUE=%VALUE:~4%
FOR /F "tokens=1,2 delims==" %%a in (%RAM%\KERNEL\reg\value.ap_ini) do SET %VAR%=%%b
DEL "%RAM%\KERNEL\reg\value.ap_ini"

:END ---------------------------------------------------------------------------
:: VAR_CLEAR --------------
SET FILE=
SET LABEL=
SET KEY=
SET VAR=
SET VALUE=
:: ------------------------
