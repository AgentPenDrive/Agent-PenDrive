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
TITLE Agent PenDrive - Odzyskiwanie danych

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO MENU
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

:MENU
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo �Agent PenDrive - Odzyskiwanie Danych�
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Odzyskaj folder OTHER          �
echo � 2.* Odzyskaj folder VIDEO          �
echo � 3.* Odzyskaj folder MUSIC          �
echo � 4.* Odzyskaj folder PICTURE        �
echo � 5.* Odzyskaj folder PS3            �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO RECOVER OTHER
if %cho%==2 GOTO RECOVER VIDEO
if %cho%==3 GOTO RECOVER MUSIC
if %cho%==4 GOTO RECOVER PICTURE
if %cho%==5 GOTO RECOVER PS3
if %cho%==w MENU.BAT
if %cho%==W MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:RECOVER OTHER
CLS
RECOVER "OTHER"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER VIDEO
CLS
RECOVER "VIDEO"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER MUSIC
CLS
RECOVER "MUSIC"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER PICTURE
CLS
RECOVER "PICTURE"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU

:RECOVER PS3
CLS
RECOVER "PS3"
CLS
echo Odzyskiwanie zakonczone!
PAUSE
GOTO MENU