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
TITLE Agent PenDrive - Odzyskiwanie danych

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
ECHO �Agent PenDrive - Odzyskiwanie Danych�
ECHO ������������������������������������ͼ
ECHO.
ECHO ������������������������������������ͻ
ECHO � 1.� Odzyskaj folder OTHER          �
ECHO � 2.� Odzyskaj folder VIDEO          �
ECHO � 3.� Odzyskaj folder MUSIC          �
ECHO � 4.� Odzyskaj folder PICTURE        �
ECHO � 5.� Odzyskaj folder PS3            �
ECHO � W.� Wroc                           �
ECHO ������������������������������������ͼ
SET /P OPT=">"
IF "%OPT%"=="1" GOTO RECOVER_OTHER
IF "%OPT%"=="2" GOTO RECOVER_VIDEO
IF "%OPT%"=="3" GOTO RECOVER_MUSIC
IF "%OPT%"=="4" GOTO RECOVER_PICTURE
IF "%OPT%"=="5" GOTO RECOVER_PS3
IF "%OPT%"=="W" GOTO END
IF "%OPT%"=="W" GOTO END
GOTO MENU

:RECOVER_OTHER
CLS
RECOVER "OTHER"
CLS
ECHO Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER_VIDEO
CLS
RECOVER "VIDEO"
CLS
ECHO Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER_MUSIC
CLS
RECOVER "MUSIC"
CLS
ECHO Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER_PICTURE
CLS
RECOVER "PICTURE"
CLS
ECHO Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER_PS3
CLS
RECOVER "PS3"
CLS
ECHO Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:END ===========================================================================