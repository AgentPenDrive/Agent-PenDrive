@Echo OFF
CLS
TITLE Agent PenDrive - O programie

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO MENU
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

:MENU
CLS
echo ������������������������������������ͻ
echo �              Autorzy               �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Patryk Wegrzynski              �
echo � 2.* Dawid Wegrzynski               �
echo ������������������������������������ͼ
PAUSE
MENU.BAT