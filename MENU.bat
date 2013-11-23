@Echo OFF
CLS
TITLE Agent PenDrive - Menu

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO MENU
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

:MENU
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ        Agent PenDrive - Menu       บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Zabezpieczanie                 บ
echo บ 2.* Odzyskiwanie Danych            บ
echo บ 3.* Spojnosc Danych                บ
echo บ 4.* Czyszczenie                    บ
echo บ 5.* AntyWirus                      บ
echo บ 6.* Kopia Zapasowa                 บ
echo บ 7.* Panel Sterownia                บ
echo บ 8.* O programie...                 บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 "MENU_SECURITY.BAT"
if %cho%==2 "MENU_RECOVER.BAT"
if %cho%==3 "MENU_FILE SYSTEM.BAT"
if %cho%==4 "MENU_CLEAR.BAT"
if %cho%==5 "MENU_ANTIVIRUS.BAT"
if %cho%==6 "MENU_BACKUP.BAT"
if %cho%==7 "MENU_CONTROL PANEL.BAT"
if %cho%==8 "MENU_ABOUT.BAT"
if %cho%==w "START.BAT"
if %cho%==W "START.BAT"
CLS
echo Blad!
PAUSE
GOTO MENU
