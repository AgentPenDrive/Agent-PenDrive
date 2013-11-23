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
echo ษออออออออออออออออออออออออออออออออออออป
echo บ              Autorzy               บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Patryk Wegrzynski              บ
echo บ 2.* Dawid Wegrzynski               บ
echo ศออออออออออออออออออออออออออออออออออออผ
PAUSE
MENU.BAT