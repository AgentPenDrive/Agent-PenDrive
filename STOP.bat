@Echo OFF
CLS
TITLE Agent PenDrive - Konczenie

:MENU
attrib -h -s "START.BAT"
attrib -h -s "HIDEN FEATURES.BAT"

attrib -h -s "CHECK.BAT"
attrib -h -s "MENU.BAT"
attrib -h -s "MENU_SECURITY.BAT"
attrib -h -s "MENU_RECOVER.BAT"
attrib -h -s "MENU_FILE SYSTEM.BAT"
attrib -h -s "MENU_CLEAR.BAT"
attrib -h -s "MENU_ANTIVIRUS.BAT"
attrib -h -s "MENU_BACKUP.BAT"
attrib -h -s "MENU_CONTROL PANEL.BAT"
attrib -h -s "MENU_ABOUT.BAT"
attrib -h -s "STOP.BAT"
attrib -h -s "ACCES.BAT"
attrib -h -s "clrav.COM"
attrib -h -s "edit.COM"
attrib -h -s "EDIT.HLP"
echo.
DEL "START.BAT"
DEL "HIDEN FEATURES.BAT"

DEL "CHECK.BAT"
DEL "MENU.BAT"
DEL "MENU_SECURITY.BAT"
DEL "MENU_RECOVER.BAT"
DEL "MENU_FILE SYSTEM.BAT"
DEL "MENU_CLEAR.BAT"
DEL "MENU_ANTIVIRUS.BAT"
DEL "MENU_BACKUP.BAT"
DEL "MENU_CONTROL PANEL.BAT"
DEL "MENU_ABOUT.BAT"
DEL "ACCES.BAT"
DEL "clrav.COM"
DEL "edit.COM"
DEL "EDIT.HLP"
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Acces"
DEL "STOP.BAT"

PAUSE
EXIT