@Echo OFF
TITLE Agent Pendrive - Aktualizowanie
CLS

:UPGRADE
IF EXIST UPGRADE.BAT GOTO EXIST
IF NOT EXIST UPGRADE.BAT GOTO NOT EXIST

:EXIST
echo Znaleziono pliki aktualizacji.
echo Czy chcesz rozpoczac aktualizacje? (T/N)
set /p"cho=>"
if %cho%==T GOTO UPGRADE
if %cho%==N 3.MENU
if %cho%==t GOTO UPGRADE
if %cho%==n 3.MENU
CLS
echo Blad!
PAUSE
CLS
GOTO EXIST

:UPGRADE
CLS

echo Przygotowywanie instalacji...
UPGRADE.BAT

:NOT EXIST
echo Nie znaleziono plikow aktualizacji.
echo.
PAUSE
3.MENU