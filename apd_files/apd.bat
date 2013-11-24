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
@ECHO OFF
TITLE Agent PenDrive
CLS
GOTO WELCOME_SCREEN

:WELCOME_SCREEN ================================================================
CLS
ECHO.                                                                            
ECHO     �����������������������������������������������������������������������ͻ
ECHO     �                           Agent PenDrive                              �
ECHO     �                               v1.5.1                                  �
ECHO     �����������������������������������������������������������������������͹
ECHO     � Agent PenDrive to program s�u��cy do zabezpieczania danych na         �
ECHO     � wymiennych no�nikach *. Posiada system aplikacji kt�ry bardzo         �
ECHO     � rozbudowuje jego funkcjonalno��, poradzi sobie z wirusami, b��dami    �
ECHO     � odczytu, a nawet odzyskiwaniem przypadkowo usuni�tych danych.         �
ECHO     �                                                                       �
ECHO     � * Instalacja jest mo�liwa tak�e na innych urz�dzeniach                �
ECHO     �   lub w katalogu.                                                     �
ECHO     �����������������������������������������������������������������������͹
ECHO     � By w pe�ni korzysta� z programu, nale�y si� zalogowa�.                �
ECHO     � Je�li chcesz si� zalogowa� wpisz "1" i potwierd� klawiszem ENTER,     �
ECHO     � Je�li chcesz wyj�� - "W".                                             �
ECHO     �����������������������������������������������������������������������͹
ECHO     �  1.Logowanie  �   Copyright (C) 2009, 2013 GitSoft    �   W.Wyjscie   �
ECHO     �����������������������������������������������������������������������ͼ
ECHO.                                                                            
SET /P OPT=">"
IF %OPT%=="0" CALL "apd_files\modules\acces_mgr\acces_mgr.bat" /forget_passwd
IF %OPT%=="1" CALL "apd_files\modules\acces_mgr\acces_mgr.bat" /login
IF %OPT%=="2" GOTO EDIT
IF %OPT%=="w" GOTO END
IF %OPT%=="W" GOTO END
GOTO WELCOME_SCREEN

:EDIT ==========================================================================
TITLE Agent Pendrive - Edytor
CALL "edit.COM"

:END ===========================================================================