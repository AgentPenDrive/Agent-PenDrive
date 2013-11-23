@Echo OFF
CLS
TITLE Agent PenDrive - Sprawdzanie

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO OTHER
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

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
attrib +h +s "HIDEN FEATURES.BAT"
attrib +h +s "PASSWORD.BAT"
attrib +h +s "CHECK.BAT"
attrib +h +s "MENU.BAT"
attrib +h +s "MENU_SECURITY.BAT"
attrib +h +s "MENU_RECOVER.BAT"
attrib +h +s "MENU_FILE SYSTEM.BAT"
attrib +h +s "MENU_CLEAR.BAT"
attrib +h +s "MENU_ANTIVIRUS.BAT"
attrib +h +s "MENU_BACKUP.BAT"
attrib +h +s "MENU_CONTROL PANEL.BAT"
attrib +h +s "MENU_ABOUT.BAT"
attrib +h +s "STOP.BAT"
attrib +h +s "ACCES.BAT"
attrib +h +s "clrav.COM"
attrib +h +s "edit.COM"
attrib +h +s "EDIT.HLP"
echo.
echo Znalezione problemy zostana wyzej wyswietlone!
echo.
PAUSE
MENU.BAT