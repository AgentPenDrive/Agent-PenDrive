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
echo 浜様様様様様様様様様様様様様様様様様融
echo �              Autorzy               �
echo 藩様様様様様様様様様様様様様様様様様夕
echo.
echo 浜様様様様様様様様様様様様様様様様様融
echo � 1.* Patryk Wegrzynski              �
echo � 2.* Dawid Wegrzynski               �
echo 藩様様様様様様様様様様様様様様様様様夕
PAUSE
MENU.BAT