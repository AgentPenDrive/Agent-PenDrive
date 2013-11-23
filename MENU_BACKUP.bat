@Echo OFF
CLS
TITLE Agent PenDrive - Kopia zapasowa

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
echo บ  Agent PenDrive - Kopia zapasowa   บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Stworz kopie zapasowa danych   บ
echo บ 2.* Usun kopie zapasowa danych     บ
echo บ 3.* Przywroc kopie zapasowa danych บ
echo บ 4.* Informacje                     บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO CREATE BACKUP
if %cho%==2 GOTO DELETE BACKUP
if %cho%==3 GOTO RESTORE BACKUP
if %cho%==4 GOTO INFO
if %cho%==W MENU.BAT
if %cho%==w MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:CREATE BACKUP
CLS
echo Uwaga! Wymagane jest przynajmiej 952 Mb
echo wolnego miejsca na partycji SYSTEMOWEJ.
PAUSE

CLS
echo Tworzenie katalogow kopi zapasowej...
echo.
MD "%SystemRoot%\Agent PenDrive"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3"
echo.
PAUSE

CLS
echo Tworzenie kopi zapasowej...
echo.
XCOPY /H /Y /E "OTHER"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER"
echo.
XCOPY /H /Y /E "VIDEO"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO"
echo.
XCOPY /H /Y /E "MUSIC"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC"
echo.
XCOPY /H /Y /E "PICTURE"  "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE"
echo.
XCOPY /H /Y /E "PS3"      "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3"
echo.
CLS
echo Kopia zapasowa danych stworzona!
TIME /T
DATE /T
PAUSE
GOTO MENU

:DELETE BACKUP
CLS
echo Usuwanie plikow kopi zapasowej...
echo.
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
CLS
echo Kopia zapasowa danych usunieta!
TIME /T
DATE /T
PAUSE
GOTO MENU

:RESTORE BACKUP
CLS
echo Przywracanie plikow kopi zapasowej...
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER" "OTHER"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO" "VIDEO"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC" "MUSIC"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE" "PICTURE"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3" "PS3"
echo.
CLS
echo Kopia zapasowa danych przywrocona!
TIME /T
DATE /T
PAUSE
GOTO MENU



:INFO
CLS
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Backup" GOTO INFO NOT EXIST

IF EXIST "%SystemRoot%\Agent PenDrive\Backup\Files Backup" GOTO INFO EXIST
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Backup\Files Backup" GOTO INFO NOT EXIST

:INFO EXIST
CLS
echo Kopia zapasowa danych stworzona.
TIME /T
DATE /T
TREE "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
PAUSE
GOTO MENU

:INFO NOT EXIST
CLS
echo Kopia zapasowa danych nie istnieje.
TIME /T
DATE /T
PAUSE
GOTO MENU