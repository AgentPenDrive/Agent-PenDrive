@Echo OFF

TITLE Agent Pendrive - Zabezpieczanie

:LOCK
CLS
attrib +h +s "OTHER"
attrib +h +s "MUSIC"
attrib +h +s "PICTURE"
attrib +h +s "VIDEO"
attrib +h +s "PS3"



echo Dane zabezpieczone!
PAUSE
3.MENU.BAT

CACLS "OTHER" /P Juby:N
CACLS "MUSIC" /P Juby:N
CACLS "PICTURE" /P Juby:N
CACLS "VIDEO" /P Juby:N
CACLS "PS3" /P Juby:N