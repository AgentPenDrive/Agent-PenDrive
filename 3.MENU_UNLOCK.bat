@Echo OFF

TITLE Agent Pendrive - Odbezpieczanie

:UNLOCK
CLS
attrib -s -h "OTHER"
attrib -s -h "MUSIC"
attrib -s -h "PICTURE"
attrib -s -h "VIDEO"
attrib -s -h "PS3"



echo Dane odbezpieczone!
PAUSE
3.MENU.BAT

CACLS "OTHER" /P Juby:F
CACLS "MUSIC" /P Juby:F
CACLS "PICTURE" /P Juby:F
CACLS "VIDEO" /P Juby:F
CACLS "PS3" /P Juby:F