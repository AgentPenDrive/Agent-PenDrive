@Echo OFF
TITLE Agent Pendrive - Menu

:MENU
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo �        Agent Pendrive - Menu       �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Odbezpiecz dane                �
echo � 2.* Zabezpiecz dane                �
echo � 3.* Pokaz strukture programu       �
echo � 4.* Odzyskaj utracone dane         �
echo � 5.* Sprawdz system plikow          �
echo � 6.* Skanuj w poszukiwaniu wirusow  �
echo � 7.* Zmien haslo dostepu            �
echo � 8.* Kopia zapasowa danych          �
echo � 9.* Aktualizuj program             �
echo � 10.* O programie...                �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
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
