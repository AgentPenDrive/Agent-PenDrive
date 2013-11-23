@Echo OFF
CLS
TITLE Agent PenDrive - Panel Sterowania

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
echo บ Agent PenDrive - Panel Sterowania  บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Kopia zapasowa programu.       บ
echo บ 2.* Zmien haslo dostepu            บ
echo บ 3.* Aktualizacja                   บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO 1 PROGRAM BACKUP
if %cho%==2 GOTO 5 CHANGE PASS
if %cho%==3 GOTO 6 UPGRADE
if %cho%==W MENU.BAT
if %cho%==w MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU



:1 PROGRAM BACKUP
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ  Agent Pendrive - Kopia Zapasowa   บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Stworz kopie zapasowa.         บ
echo บ 2.* Usun kopie zapasowa.           บ
echo บ 3.* Przywroc kopie zapasowa.       บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO 2 PROGRAM BACKUP-CREATE
if %cho%==2 GOTO 3 PROGRAM BACKUP-DELETE
if %cho%==3 GOTO 4 PROGRAM BACKUP-RESTORE
if %cho%==W GOTO MENU
if %cho%==w GOTO MENU
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL

:2 PROGRAM BACKUP-CREATE
CLS
MD "%SystemRoot%\Agent PenDrive"
MD "%SystemRoot%\Agent PenDrive\Backup"
MD "%SystemRoot%\Agent PenDrive\Backup\Program Backup"
attrib -h -s 	"PASSWORD.BAT"
COPY		"PASSWORD.BAT"		"%SystemRoot%\Agent PenDrive\Backup\Program Backup"
attrib +h +s 	"PASSWORD.BAT"
COPY 		"Agent PenDrive.exe"			"%SystemRoot%\Agent PenDrive\Backup\Program Backup"
CLS
echo Tworzenie kopi zapasowej zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP

:3 PROGRAM BACKUP-DELETE
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Backup\Program Backup"
CLS
echo Usuwanie kopi zapasowej programu zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP

:4 PROGRAM BACKUP-RESTORE
CLS
COPY		"%SystemRoot%\Agent PenDrive\Backup\Program Backup\PASSWORD.BAT"
COPY 		"%SystemRoot%\Agent PenDrive\Backup\Program Backup\Agent PenDrive.exe"
CLS
echo Przywracanie kopi zapasowej programu zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP



:5 CHANGE PASS
CLS
attrib -h -s "PASSWORD.BAT"
echo Aby zmienic haslo zedytuj plik 'PASSWORD' ktory pojawil sie przed chwila.                                              
echo W 12 wersie pliku, znajdziesz zdanie
echo            ษออออออออออออออออออออออป
echo if XXXXX== บ TWOJE AKTUALNE HASLO บ GOTO CORRECT PASSWORD.
echo            ศออออออออออออออออออออออผ
echo Zamiast 'TWOJE AKTUALNE HASLO' wpisz nowe.                
PAUSE
attrib +h +s "PASSWORD.BAT"
GOTO MENU



:6 UPGRADE
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ    Agent Pendrive - Aktualizja     บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Zainstaluj aktualizacje        บ
echo บ 2.* Usun aktualizacje              บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO 7 UPGRADE - INSTALL
if %cho%==2 GOTO 8 UPGRADE - UNINSTALL
if %cho%==W GOTO MENU
if %cho%==w GOTO MENU
CLS
echo Blad!
PAUSE
GOTO 6 UPGRADE

:7 UPGRADE - INSTALL
UPGRADE.EXE
CLS
echo Nie znaleziono aktualizacji...
PAUSE
GOTO 6 UPGRADE

:8 UPGRADE - UNINSTALL
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Upgrade"
echo Aktualizacja zostala usunieta...
PAUSE
GOTO 6 UPGRADE