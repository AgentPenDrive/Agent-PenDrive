:: ----------------------------------------------------------------------------+
:: Copyright (C) 2009 GitSoft                                                  :
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
:: Prawa autorskie (C) 2009 GitSoft                                            :
::                                                                             :
:: Ten plik jest cz��ci� Agent PenDrive.                                       :
::                                                                             :
:: Ten program jest wolnym oprogramowaniem; mo�esz go rozprowadza� dalej       :
:: i/lub modyfikowa� na warunkach Powszechnej Licencji Publicznej GNU,         :
:: wydanej przez Fundacj� Wolnego Oprogramowania - wed�ug wersji 2 tej         :
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

@Echo OFF
CLS
TITLE Agent PenDrive - Hiden Features

:MENU
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo �    Panel zabezpieczen programu     �
echo �  Agent PenDrive - Hiden Features.  �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Pokaz pliki programu.          �
echo � 2.* Ukryj pliki programu.          �
echo � 3.* Nagly WYPADEK. *               �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO SHOW THE FILES
if %cho%==2 GOTO HIDE THE FILES
if %cho%==3 GOTO EMERGENCY
if %cho%==W START.BAT
if %cho%==w START.BAT
CLS
echo Blad!
PAUSE
GOTO MENU


:SHOW THE FILES
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
echo Pliki programu pokazane!
PAUSE
GOTO MENU

:HIDE THE FILES
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
echo Pliki programu ukryte!
PAUSE
GOTO MENU

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
GOTO MENU

:RAPORT
TYPE "RAPORT.txt"
PAUSE
GOTO MENU