@Echo OFF
TITLE Agent Pendrive - Panel Sterowania
CLS

:SYSTEM PANEL
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ Agent Pendrive - Panel Sterowania  บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Kopia zapasowa programu.       บ
echo บ 3.* Nagly WYPADEK. *               บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO PROGRAM BACKUP
if %cho%==2 GOTO HIDE THE FILES
if %cho%==3 GOTO EMERGENCY
if %cho%==W START.BAT
if %cho%==w START.BAT
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL











:PROGRAM BACKUP
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ  Agent Pendrive - Kopia zapasowa   บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Stworz kopie zapasowa.         บ
echo บ 2.* Usun kopie zapasowa.           บ
echo บ 3.* Przywroc kopie zapasowa.       บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO PROGRAM BACKUP-CREATE
if %cho%==2 GOTO PROGRAM BACKUP-DELETE
if %cho%==3 GOTO PROGRAM BACKUP-RESTORE
if %cho%==W GOTO SYSTEM PANEL
if %cho%==w GOTO SYSTEM PANEL
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-CREATE
CLS
MD "%SystemRoot%\Agent PenDrive"
MD "%SystemRoot%\Agent PenDrive\Program Backup"
attrib -h -s 	"1.PASSWORD.BAT"
COPY		"1.PASSWORD.BAT"		"%SystemRoot%\Agent PenDrive\Program Backup"
attrib +h +s 	"1.PASSWORD.BAT"
COPY 		"Juby.exe"			"%SystemRoot%\Agent PenDrive\Program Backup"
CLS
echo Tworzenie kopi zapasowej zakonczone!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-DELETE
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Program Backup"
CLS
echo Usuwanie kopi zapasowej programu zakonczone!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-RESTORE
CLS
COPY		"%SystemRoot%\Agent PenDrive\Program Backup\1.PASSWORD.BAT"
COPY 		"%SystemRoot%\Agent PenDrive\Program Backup\Juby.exe"
CLS
echo Tworzenie kopi zapasowej programu zakonczone!
PAUSE
GOTO SYSTEM PANEL
















:EMERGENCY
CLS
echo CZY JESTES PEWIEN? ZMIANY SA NIE!!!ODWRACALNE (T/N)
set /p"cho=>"
if %cho%==T GOTO YES
if %cho%==N GOTO NO
if %cho%==t GOTO YES
if %cho%==n GOTO NO

:YES
CLS
RMDIR /S /Q "OTHER"
echo *** 20%
CLS
RMDIR /S /Q "MUSIC"
echo ****** 40%
CLS
RMDIR /S /Q "PICTURE"
echo ********* 60%
CLS
RMDIR /S /Q "VIDEO"
echo ************ 80%
CLS
RMDIR /S /Q "PS3"
echo *************** 100%
GOTO RAPORT

:NO
CLS
GOTO SECURITY

:RAPORT
TYPE "RAPORT.txt"
PAUSE
GOTO SECURITY