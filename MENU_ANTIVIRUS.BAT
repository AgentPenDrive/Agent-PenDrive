@ECHO OFF
CLS
TITLE Agent PenDrive - AntiVirus

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO MENU
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

:MENU
clrav.COM /s /Rpt a>RAPORT_SKANOWANIE.TXT
DEL "%MYFILES%\clrav.rpt"
CLS
echo Skanowanie zakonczone, chcesz zobaczyc Raport (T/N)
set /p"cho=>"
if %cho%==T GOTO YES
if %cho%==N GOTO NO
if %cho%==t GOTO YES
if %cho%==n GOTO NO
CLS
echo Blad!
PAUSE
GOTO MENU

:YES
CLS
TYPE "RAPORT_SKANOWANIE.TXT"
PAUSE
MENU.BAT

:NO
CLS
MENU.BAT