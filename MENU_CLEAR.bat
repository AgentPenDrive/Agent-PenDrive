@Echo OFF
CLS
TITLE Agent PenDrive - Czyszczenie

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
echo บ    Agent PenDrive - Czyszczenie    บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Usun wszystkie dane z pendriva บ
echo บ 2.* Usun wszystkie dane programu   บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO DELETE ALL FILES
if %cho%==2 GOTO CLEAR ALL PROGRAM FILES
if %cho%==w "MENU.BAT"
if %cho%==W "MENU.BAT"
CLS
echo Blad!
PAUSE
GOTO MENU

:DELETE ALL FILES
CLS
VER
TIME /T
DATE /T
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
GOTO MENU

:RAPORT
CLS
TYPE "RAPORT.txt"
PAUSE
GOTO MENU

:CLEAR ALL PROGRAM FILES
CLS
echo Uwaga!!! Ta opcja usuwa:
echo - Haslo
echo - Kopie zapasowa danych i programu
echo Czy chcesz kontynuowac? (T/N)
set /p"cho=>"
if %cho%==T GOTO CLEAR ALL PROGRAM FILES-CLEAR
if %cho%==N GOTO MENU
if %cho%==t GOTO CLEAR ALL PROGRAM FILES-CLEAR
if %cho%==n GOTO MENU

:CLEAR ALL PROGRAM FILES-CLEAR
CLS
attrib -h -s "PASSWORD.BAT"
DEL "PASSWORD.BAT"
RMDIR /S /Q "%SystemRoot%\Agent PenDrive
Agent PenDrive.exe