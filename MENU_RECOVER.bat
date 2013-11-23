@Echo OFF
CLS
TITLE Agent PenDrive - Odzyskiwanie danych

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
echo �Agent PenDrive - Odzyskiwanie Danych�
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Odzyskaj folder OTHER          �
echo � 2.* Odzyskaj folder VIDEO          �
echo � 3.* Odzyskaj folder MUSIC          �
echo � 4.* Odzyskaj folder PICTURE        �
echo � 5.* Odzyskaj folder PS3            �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO RECOVER OTHER
if %cho%==2 GOTO RECOVER VIDEO
if %cho%==3 GOTO RECOVER MUSIC
if %cho%==4 GOTO RECOVER PICTURE
if %cho%==5 GOTO RECOVER PS3
if %cho%==w MENU.BAT
if %cho%==W MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:RECOVER OTHER
CLS
RECOVER "OTHER"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER VIDEO
CLS
RECOVER "VIDEO"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER MUSIC
CLS
RECOVER "MUSIC"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER PICTURE
CLS
RECOVER "PICTURE"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER PS3
CLS
RECOVER "PS3"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU