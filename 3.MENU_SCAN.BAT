@ECHO OFF
TITLE Agent Pendrive - AntiVirus
CLS

:MENU
clrav.COM /s /Rpt a>RAPORT_SKANOWANIE.TXT
DEL "clrav.rpt"
CLS
echo Skanowanie zakonczone, chcesz zobaczyc Raport (T/N)
set /p"cho=>"
if %cho%==T GOTO YES
if %cho%==N GOTO NO
if %cho%==t GOTO YES
if %cho%==n GOTO NO

:YES
CLS
TYPE "RAPORT_SKANOWANIE.TXT"
PAUSE
3.MENU.BAT

:NO
CLS
3.MENU.BAT