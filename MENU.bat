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
  ECHO Nieautoryzowana pr�ba dost�pu!
  PAUSE
  EXIT
)

:MENU ==========================================================================
CLS
ECHO ������������������������������������ͻ
ECHO �       Agent PenDrive - Menu        �
ECHO ������������������������������������ͼ
ECHO ������������������������������������ͻ
ECHO � 1.� Zabezpieczanie                 �
ECHO � 2.� Odzyskiwanie danych            �
ECHO � 3.� Sprawdzanie sp�jnosci danych   �
ECHO � 4.� Oczyszczanie                   �
ECHO � 5.� Antytwirus                     �
ECHO � 6.� Kopia zapasowa                 �
ECHO � 7.� Panel sterownia                �
ECHO � 8.� O programie...                 �
ECHO � W.� Wroc                           �
ECHO ������������������������������������ͼ
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
