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
echo ������������������������������������ͻ
echo �        Agent PenDrive - Menu       �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Zabezpieczanie                 �
echo � 2.* Odzyskiwanie Danych            �
echo � 3.* Spojnosc Danych                �
echo � 4.* Czyszczenie                    �
echo � 5.* AntyWirus                      �
echo � 6.* Kopia Zapasowa                 �
echo � 7.* Panel Sterownia                �
echo � 8.* O programie...                 �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
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
