:: ----------------------------------------------------------------------------+
:: Copyright (C) 2009, 2013 GitSoft                                            :
::                                                                             :
:: This file is part of Agent PenDrive.                                        :
::                                                                             :
:: This program is free software: you can redistribute it and/or modIFy        :
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
:: along with this program; IF not, see <http://www.gnu.org/licenses/>.        :
:: ----------------------------------------------------------------------------+
:: Prawa autorskie (C) 2009, 2013 GitSoft                                      :
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

:PROPER ========================================================================
CLS
TITLE Agent PenDrive - Menu
GOTO MENU

:CHECK_ACCES ===================================================================
CLS
IF "%LOGGED_IN"=="true" GOTO MENU
IF NOT "%LOGGED_IN"=="true" (
  @ECHO OFF
  CLS
  ECHO Nieautoryzowana pr¢ba dost©pu!
  PAUSE
  EXIT
)

:MENU ==========================================================================
CLS
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º       Agent PenDrive - Menu        º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO ÉÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º 1.º Zabezpieczanie                 º
ECHO º 2.º Odzyskiwanie danych            º
ECHO º 3.º Sprawdzanie sp¢jnosci danych   º
ECHO º 4.º Oczyszczanie                   º
ECHO º 5.º Antytwirus                     º
ECHO º 6.º Kopia zapasowa                 º
ECHO º 7.º Panel sterownia                º
ECHO º 8.º O programie...                 º
ECHO º W.º Wroc                           º
ECHO ÈÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
SET /P OPT=">"
IF "%OPT%"=="1" CALL "MENU_SECURITY.BAT"
IF "%OPT%"=="2" CALL "MENU_RECOVER.BAT"
IF "%OPT%"=="3" CALL "MENU_FILE SYSTEM.BAT"
IF "%OPT%"=="4" CALL "MENU_CLEAR.BAT"
IF "%OPT%"=="5" CALL "MENU_ANTIVIRUS.BAT"
IF "%OPT%"=="6" CALL "MENU_BACKUP.BAT"
IF "%OPT%"=="7" CALL "MENU_CONTROL PANEL.BAT"
IF "%OPT%"=="8" CALL "MENU_ABOUT.BAT"
IF "%OPT%"=="w" GOTO END
IF "%OPT%"=="W" GOTO END
GOTO MENU

:END ===========================================================================
