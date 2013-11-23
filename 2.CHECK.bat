@Echo OFF
TITLE Agent Pendrive - Sprawdzanie
CLS

:OTHER
IF EXIST OTHER GOTO MUSIC
IF NOT EXIST OTHER MD OTHER

:MUSIC
IF EXIST MUSIC GOTO PICTURE
IF NOT EXIST MUSIC MD MUSIC

:PICTURE
IF EXIST PICTURE GOTO VIDEO
IF NOT EXIST PICTURE MD PICTURE

:VIDEO
IF EXIST VIDEO GOTO PS3
IF NOT EXIST VIDEO MD VIDEO

:PS3
IF EXIST PS3 GOTO ATTRIB
IF NOT EXIST PS3 MD PS3

:ATTRIB
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
echo.
echo Znalezione problemy zostana wyzej wyswietlone!
echo.
PAUSE
3.MENU


IF EXIST 1.START GOTO OTHER
IF NOT EXIST 1.START GOTO ATTRIB