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
CLS
TITLE Agent Pendrive - Zmiena chasla

:CHANGE
attrib -h -s "1.PASSWORD.BAT"
echo Aby zmienic haslo zedytuj plik "1.PASSWORD" ktory pojawil sie przed chwila.
echo W 12 wersie pliku, znajdziesz zdanie "if %cho%==TWOJE HASLO 2.CHECK".
echo Zamiast "TWOJE HASLO" wpisz nowe.
PAUSE
attrib +h +s "1.PASSWORD.BAT"
3.MENU.BAT