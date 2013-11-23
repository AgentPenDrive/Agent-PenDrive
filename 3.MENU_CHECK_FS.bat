@Echo OFF
CLS
TITLE Agent Pendrive - Spawdzanie systemu plikow


:MENU
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ Agent Pendrive - Spawdzanie sys... บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Skanuj dysk                    บ
echo บ 2.* Napraw bledy na dysku          บ
echo บ 3.* Odzyskaj utracone informacje   บ
echo บ 4.* BRAK OPCJI                     บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO SCAN
if %cho%==2 GOTO REPAIR ERRORS
if %cho%==3 GOTO RECOVER INFORMATIONS
if %cho%==4 GOTO NO OPTION
if %cho%==w 3.MENU.BAT
if %cho%==W 3.MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:NO OPTION
CLS
echo Ta opcja zostaณa wycofana poniewasz
echo powodowala bledy systemowe.
echo Pracujemy nad jej ulepszeniem
echo.
PAUSE
GOTO MENU

:SCAN
CLS
CHKDSK
echo.
PAUSE
GOTO MENU

:REPAIR ERRORS
CLS
CHKDSK /X /F
echo.
PAUSE
GOTO MENU

:RECOVER INFORMATIONS
CLS
CHKDSK /X /F /R
echo.
PAUSE
GOTO MENU
