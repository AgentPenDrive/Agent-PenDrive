@Echo OFF
CLS
TITLE Agent PenDrive - Spojnosc Danych

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
echo �  Agent PenDrive - Spojnosc Danych  �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Skanuj dysk                    �
echo � 2.* Napraw bledy na dysku          �
echo � 3.* Odzyskaj utracone informacje   �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO SCAN
if %cho%==2 GOTO REPAIR ERRORS
if %cho%==3 GOTO RECOVER INFORMATIONS
if %cho%==w MENU.BAT
if %cho%==W MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:SCAN
CLS
CHKDSK
echo.
PAUSE
GOTO MENU

:REPAIR ERRORS
CLS
CHKDSK /X /F
echo.
PAUSE
GOTO MENU

:RECOVER INFORMATIONS
CLS
CHKDSK /X /F /R
echo.
PAUSE
GOTO MENU
