@Echo OFF
CLS
TITLE Agent PenDrive - Zabezpieczanie 

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
echo บ  Agent PenDrive - Zabezpieczanie   บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Odbezpiecz dane                บ
echo บ 2.* Zabezpiecz dane                บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO UNLOCK
if %cho%==2 GOTO LOCK
if %cho%==w MENU.BAT
if %cho%==W MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:UNLOCK
CLS
attrib -s -h "OTHER"
attrib -s -h "MUSIC"
attrib -s -h "PICTURE"
attrib -s -h "VIDEO"
attrib -s -h "PS3"
CLS
echo Dane odbezpieczone!
PAUSE
MENU_SECURITY.BAT

:LOCK
CLS
attrib +h +s "OTHER"
attrib +h +s "MUSIC"
attrib +h +s "PICTURE"
attrib +h +s "VIDEO"
attrib +h +s "PS3"
CLS
echo Dane zabezpieczone!
PAUSE
MENU_SECURITY.BAT