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
TITLE Agent Pendrive - Spawdzanie systemu plikow


:MENU
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo � Agent Pendrive - Spawdzanie sys... �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Skanuj dysk                    �
echo � 2.* Napraw bledy na dysku          �
echo � 3.* Odzyskaj utracone informacje   �
echo � 4.* BRAK OPCJI                     �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO SCAN
if %cho%==2 GOTO REPAIR ERRORS
if %cho%==3 GOTO RECOVER INFORMATIONS
if %cho%==4 GOTO NO OPTION
if %cho%==w 3.MENU.BAT
if %cho%==W 3.MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:NO OPTION
CLS
echo Ta opcja zosta�a wycofana poniewasz
echo powodowala bledy systemowe.
echo Pracujemy nad jej ulepszeniem
echo.
PAUSE
GOTO MENU

:SCAN
CLS
CHKDSK
echo.
PAUSE
GOTO MENU

:REPAIR ERRORS
CLS
CHKDSK /X /F
echo.
PAUSE
GOTO MENU

:RECOVER INFORMATIONS
CLS
CHKDSK /X /F /R
echo.
PAUSE
GOTO MENU
