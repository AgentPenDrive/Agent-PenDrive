:: ----------------------------------------------------------------------------+
:: Copyright (C) 2008-2009 GitSoft                                             :
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
:: Prawa autorskie (C) 2008-2009 GitSoft                                       :
::                                                                             :
:: Ten plik jest cz©˜ci¥ Agent PenDrive.                                       :
::                                                                             :
:: Ten program jest wolnym oprogramowaniem; mo¾esz go rozprowadza† dalej       :
:: i/lub modyfikowa† na warunkach Powszechnej Licencji Publicznej GNU,         :
:: wydanej przez Fundacj© Wolnego Oprogramowania - wedˆug wersji 2 tej         :
:: Licencji lub (wedˆug twojego wyboru) kt¢rej˜ z p¢«niejszych wersji.         :
::                                                                             :
:: Niniejszy program rozpowszechniany jest z nadziej¥, i¾ b©dzie on            :
:: u¾yteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domy˜lnej             :
:: gwarancji PRZYDATNO—CI HANDLOWEJ albo PRZYDATNO—CI DO OKRE—LONYCH           :
:: ZASTOSOWAã. W celu uzyskania bli¾szych informacji si©gnij do                :
:: Powszechnej Licencji Publicznej GNU.                                        :
::                                                                             :
:: Z pewno˜ci¥ wraz z niniejszym programem otrzymaˆe˜ te¾ egzemplarz           :
:: Powszechnej Licencji Publicznej GNU (GNU General Public License);           :
:: je˜li nie, zobacz <http://www.gnu.org/licenses/>.                           :
:: -----------------------------------------------------------------------------

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