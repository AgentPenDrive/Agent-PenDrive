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
TITLE Agent Pendrive - Menu

:MENU
CLS
VER
TIME /T
DATE /T
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        Agent Pendrive - Menu       º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1.* Odbezpiecz dane                º
echo º 2.* Zabezpiecz dane                º
echo º 3.* Pokaz strukture programu       º
echo º 4.* Odzyskaj utracone dane         º
echo º 5.* Sprawdz system plikow          º
echo º 6.* Skanuj w poszukiwaniu wirusow  º
echo º 7.* Zmien haslo dostepu            º
echo º 8.* Kopia zapasowa danych          º
echo º 9.* Aktualizuj program             º
echo º 10.* O programie...                º
echo º W.* Wroc                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set /p"cho=>"
if %cho%==1 3.MENU_UNLOCK.BAT
if %cho%==2 3.MENU_LOCK.BAT
if %cho%==3 3.MENU_SHOW.BAT
if %cho%==4 3.MENU_RECOVER.BAT
if %cho%==5 3.MENU_CHECK_FS.BAT
if %cho%==6 3.MENU_SCAN.BAT
if %cho%==7 3.MENU_CHANGE_PASS.BAT
if %cho%==8 3.MENU_BACKUP.BAT
if %cho%==9 3.MENU_UPGRADE.BAT
if %cho%==10 3.MENU_ABOUT.BAT
if %cho%==w START.BAT
if %cho%==W START.BAT
CLS
echo Blad!
PAUSE
GOTO MENU
