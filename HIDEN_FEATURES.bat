@Echo OFF
TITLE Agent Pendrive - Hiden Features

:SECURITY
CLS
VER
TIME /T
DATE /T
echo ษออออออออออออออออออออออออออออออออออออป
echo บ    Panel zabezpieczen programu     บ
echo บ  Agent Pendrive - Hiden Features.  บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Pokaz pliki programu.          บ
echo บ 2.* Ukryj pliki programu.          บ
echo บ 3.* Nagly WYPADEK. *               บ
echo บ W.* Wroc                           บ
echo ศออออออออออออออออออออออออออออออออออออผ
set /p"cho=>"
if %cho%==1 GOTO SHOW THE FILES
if %cho%==2 GOTO HIDE THE FILES
if %cho%==3 GOTO EMERGENCY
if %cho%==W START.BAT
if %cho%==w START.BAT
CLS
echo Blad!
PAUSE
GOTO SECURITY

:SHOW THE FILES
CLS
attrib -h -s "START.BAT"
attrib -h -s "CONTROL_PANEL.bat"
attrib -h -s "HIDEN_FEATURES.BAT"
attrib -h -s "1.PASSWORD.BAT"
attrib -h -s "2.CHECK.BAT"
attrib -h -s "3.MENU.BAT"
attrib -h -s "3.MENU_UNLOCK.BAT"
attrib -h -s "3.MENU_LOCK.BAT"
attrib -h -s "3.MENU_SHOW.BAT"
attrib -h -s "3.MENU_RECOVER.BAT"
attrib -h -s "3.MENU_CHECK_FS.BAT"
attrib -h -s "3.MENU_SCAN.BAT"
attrib -h -s "3.MENU_CHANGE_PASS.BAT"
attrib -h -s "3.MENU_BACKUP.BAT"
attrib -h -s "3.MENU_UPGRADE.BAT"
attrib -h -s "3.MENU_ABOUT.BAT"
attrib -h -s "STOP.BAT"
attrib -h -s "clrav.COM"
attrib -h -s "edit.COM"
attrib -h -s "EDIT.HLP"
echo Pliki programu pokazane!
PAUSE
GOTO SECURITY

:HIDE THE FILES
CLS
attrib +h +s "START.BAT"
attrib +h +s "CONTROL_PANEL.bat"
attrib +h +s "HIDEN_FEATURES.BAT"
attrib +h +s "1.PASSWORD.BAT"
attrib +h +s "2.CHECK.BAT"
attrib +h +s "3.MENU.BAT"
attrib +h +s "3.MENU_UNLOCK.BAT"
attrib +h +s "3.MENU_LOCK.BAT"
attrib +h +s "3.MENU_SHOW.BAT"
attrib +h +s "3.MENU_RECOVER.BAT"
attrib +h +s "3.MENU_CHECK_FS.BAT"
attrib +h +s "3.MENU_SCAN.BAT"
attrib +h +s "3.MENU_CHANGE_PASS.BAT"
attrib +h +s "3.MENU_BACKUP.BAT"
attrib +h +s "3.MENU_UPGRADE.BAT"
attrib +h +s "3.MENU_ABOUT.BAT"
attrib +h +s "STOP.BAT"
attrib +h +s "clrav.COM"
attrib +h +s "edit.COM"
attrib +h +s "EDIT.HLP"
echo Pliki programu ukryte!
PAUSE
GOTO SECURITY

:EMERGENCY
CLS
echo CZY JESTES PEWIEN? ZMIANY SA NIE!!!ODWRACALNE (T/N)
set /p"cho=>"
if %cho%==T GOTO YES
if %cho%==N GOTO NO
if %cho%==t GOTO YES
if %cho%==n GOTO NO

:YES
CLS
RMDIR /S /Q "OTHER"
echo *** 20%
CLS
RMDIR /S /Q "MUSIC"
echo ****** 40%
CLS
RMDIR /S /Q "PICTURE"
echo ********* 60%
CLS
RMDIR /S /Q "VIDEO"
echo ************ 80%
CLS
RMDIR /S /Q "PS3"
echo *************** 100%
GOTO RAPORT

:NO
CLS
GOTO SECURITY

:RAPORT
TYPE "RAPORT.txt"
PAUSE
GOTO SECURITY