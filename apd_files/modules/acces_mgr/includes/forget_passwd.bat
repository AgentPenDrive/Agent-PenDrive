:: ----------------------------------------------------------------------------+
:: Copyright (C) 2009, 2013 GitSoft                                            :
::                                                                             :
:: This file is part of Agent PenDrive.                                        :
::                                                                             :
:: This program is free software: you can redistribute it and/or modify        :
:: it under the terms of the GNU General Public License as published by        :
:: the Free Software Foundation, either version 3 of the License, or           :
:: (at your option) any later version.                                         :
::                                                                             :
:: This program is distributed in the hope that it will be useful,             :
:: but WITHOUT ANY WARRANTY; without even the implied warranty of              :
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               :
:: GNU General Public License for more details.                                :
::                                                                             :
:: You should have received a copy of the GNU General Public License           :
:: along with this program; if not, see <http://www.gnu.org/licenses/>.        :
:: ----------------------------------------------------------------------------+
:: Prawa autorskie (C) 2009, 2013 GitSoft                                      :
::                                                                             :
:: Ten plik jest cz��ci� Agent PenDrive.                                       :
::                                                                             :
:: Ten program jest wolnym oprogramowaniem; mo�esz go rozprowadza� dalej       :
:: i/lub modyfikowa� na warunkach Powszechnej Licencji Publicznej GNU,         :
:: wydanej przez Fundacj� Wolnego Oprogramowania - wed�ug wersji 3 tej         :
:: Licencji lub (wed�ug twojego wyboru) kt�rej� z p��niejszych wersji.         :
::                                                                             :
:: Niniejszy program rozpowszechniany jest z nadziej�, i� b�dzie on            :
:: u�yteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domy�lnej             :
:: gwarancji PRZYDATNO�CI HANDLOWEJ albo PRZYDATNO�CI DO OKRE�LONYCH           :
:: ZASTOSOWA�. W celu uzyskania bli�szych informacji si�gnij do                :
:: Powszechnej Licencji Publicznej GNU.                                        :
::                                                                             :
:: Z pewno�ci� wraz z niniejszym programem otrzyma�e� te� egzemplarz           :
:: Powszechnej Licencji Publicznej GNU (GNU General Public License);           :
:: je�li nie, zobacz <http://www.gnu.org/licenses/>.                           :
:: -----------------------------------------------------------------------------

:PROPER ========================================================================
CLS
TITLE Agent PenDrive - Zapomniane has�o

:MENU ==========================================================================
CLS
ECHO ������������������������������������ͻ
ECHO �    Panel zabezpieczen programu     �
ECHO �  Agent PenDrive - Hiden Features.  �
ECHO ������������������������������������ͼ
ECHO.
ECHO ������������������������������������ͻ
ECHO � 1.� Poka� pliki programu.          �
ECHO � 2.� Ukryj pliki programu.          �
ECHO � 3.� Nag�y WYPADEK. *               �
ECHO � W.� Wr��                           �
ECHO ������������������������������������ͼ
SET /P OPT=">"
IF "%OPT%"=="1" GOTO SHOW_FILES
IF "%OPT%"=="2" GOTO HIDE_FILES
IF "%OPT%"=="3" GOTO EMERGENCY
IF "%OPT%"=="W" GOTO END
IF "%OPT%"=="w" GOTO END
GOTO MENU

:: =============================================================================

:SHOW_FILES
CLS
attrib -h -s "START.BAT"
attrib -h -s "HIDEN FEATURES.BAT"
attrib -h -s "PASSWORD.BAT"
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
attrib -h -s "Install.EXE"
attrib -h -s "clrav.COM"
attrib -h -s "edit.COM"
attrib -h -s "EDIT.HLP"
ECHO Pliki programu pokazane!
PAUSE
GOTO MENU

:HIDE_FILES
CLS
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
attrib +h +s "STOP.BAT"
attrib +h +s "ACCES.BAT"
attrib +h +s "Install.EXE"
attrib +h +s "clrav.COM"
attrib +h +s "edit.COM"
attrib +h +s "EDIT.HLP"
ECHO Pliki programu ukryte!
PAUSE
GOTO MENU

:: =============================================================================

:EMERGENCY =====================================================================
CLS
ECHO CZY JESTE� PEWIEN(A)? ZMIANY S� NIEODWRACALNE (T/N)
SET /P OPT=>"
IF "%OPT%"=="T" GOTO YES
IF "%OPT%"=="t" GOTO YES
IF "%OPT%"=="n" GOTO MENU
IF "%OPT%"=="N" GOTO MENU
GOTO EMERGENCY

:YES
CLS
RMDIR /Q "OTHER">>"RAPORT.TXT"
ECHO ��� 20%
CLS
RMDIR /Q "MUSIC">>"RAPORT.TXT"
ECHO ������ 40%
CLS
RMDIR /Q "PICTURE">>"RAPORT.TXT"
ECHO ��������� 60%
CLS
RMDIR /Q "VIDEO">>"RAPORT.TXT"
ECHO ������������ 80%
CLS
RMDIR /Q "PS3">>"RAPORT.TXT"
ECHO ��������������� 100%
GOTO RAPORT

:RAPORT
TYPE "RAPORT.TXT"
PAUSE
GOTO MENU