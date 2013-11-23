@Echo OFF
TITLE Agent Pendrive - Menu

:MENU
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ        Agent Pendrive - Menu       บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Odbezpiecz dane                บ
echo บ 2.* Zabezpiecz dane                บ
echo บ 3.* Pokaz strukture programu       บ
echo บ 4.* Odzyskaj utracone dane         บ
echo บ 5.* Sprawdz system plikow          บ
echo บ 6.* Skanuj w poszukiwaniu wirusow  บ
echo บ 7.* Zmien haslo dostepu            บ
echo บ 8.* Kopia zapasowa danych          บ
echo บ 9.* Aktualizuj program             บ
echo บ 10.* O programie...                บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 3.MENU_UNLOCK.BAT
if %cho%==2 3.MENU_LOCK.BAT
if %cho%==3 3.MENU_SHOW.BAT
if %cho%==4 3.MENU_RECOVER.BAT
if %cho%==5 3.MENU_CHECK_FS.BAT
if %cho%==6 3.MENU_SCAN.BAT
if %cho%==7 3.MENU_CHANGE_PASS.BAT
if %cho%==8 3.MENU_BACKUP.BAT
if %cho%==9 3.MENU_UPGRADE.BAT
if %cho%==10 3.MENU_ABOUT.BAT
if %cho%==w START.BAT
if %cho%==W START.BAT
CLS
echo Blad!
PAUSE
GOTO MENU
