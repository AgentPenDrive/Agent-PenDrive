@Echo OFF
TITLE Agent Pendrive - Weryfikacja
CLS

:CONFIRM PASSWORD
CLS
VER
TIME /T
DATE /T
echo Wprowadz haslo do programu. (W - Wroc)
set/p "cho=>"
if %cho%==JUBY4466 2.CHECK
if %cho%==w START.BAT
if %cho%==W START.BAT
GOTO FAIL PASSWORD

:FAIL PASSWORD
CLS
echo Nieprawidlowe haslo!
PAUSE
GOTO CONFIRM PASSWORD