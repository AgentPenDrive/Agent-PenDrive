:PROPER ------------------------------------------------------------------------
CLS
IF NOT EXIST "%VAR%\log\raport" MD "%VAR%\log\raport"
SET ID=%RANDOM%
IF EXIST "%ID%.ap_log" GOTO PROPER
IF NOT EXIST "%ID%.ap_log" GOTO CREATE_RAPORT

:CREATE_RAPORT -----------------------------------------------------------------
CLS
ECHO Nazwa u¼ytkownika AP           %AP_USERNAME%>"%VAR%\log\raport\%ID%.ap_log"
ECHO Nazwa u¼ytkownika WINDOWS      %USERNAME%>>"%VAR%\log\raport\%ID%.ap_log"
ECHO Czas i Data uruchomienia       %TIME% - %DATE%>>"%VAR%\log\raport\%ID%.ap_log"
ECHO Nazwa komputera                %COMPUTERNAME%>>"%VAR%\log\raport\%ID%.ap_log"
ECHO.>>"%VAR%\log\raport\%ID%.ap_log"
ECHO --------------------------------------------------------------------------->>"%VAR%\log\raport\%ID%.ap_log"
ECHO.>>"%VAR%\log\raport\%ID%.ap_log"
ECHO Konfiguracja ¦ieciowa>>"%VAR%\log\raport\%ID%.ap_log"
IPCONFIG /all >>"%VAR%\log\raport\%ID%.ap_log"

:END ---------------------------------------------------------------------------
CLS
SET ID=
