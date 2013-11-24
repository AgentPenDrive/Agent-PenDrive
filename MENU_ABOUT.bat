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
:: Ten plik jest czฉciฅ Agent PenDrive.                                       :
::                                                                             :
:: Ten program jest wolnym oprogramowaniem; moพesz go rozprowadza dalej       :
:: i/lub modyfikowa na warunkach Powszechnej Licencji Publicznej GNU,         :
:: wydanej przez Fundacjฉ Wolnego Oprogramowania - wedug wersji 2 tej         :
:: Licencji lub (wedug twojego wyboru) ktขrej z pขซniejszych wersji.         :
::                                                                             :
:: Niniejszy program rozpowszechniany jest z nadziejฅ, iพ bฉdzie on            :
:: uพyteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domylnej             :
:: gwarancji PRZYDATNO—CI HANDLOWEJ albo PRZYDATNO—CI DO OKRE—LONYCH           :
:: ZASTOSOWAใ. W celu uzyskania bliพszych informacji siฉgnij do                :
:: Powszechnej Licencji Publicznej GNU.                                        :
::                                                                             :
:: Z pewnociฅ wraz z niniejszym programem otrzymae teพ egzemplarz           :
:: Powszechnej Licencji Publicznej GNU (GNU General Public License);           :
:: jeli nie, zobacz <http://www.gnu.org/licenses/>.                           :
:: -----------------------------------------------------------------------------

@Echo OFF
CLS
TITLE Agent PenDrive - O programie

IF EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO MENU
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Acces\ACCES.BAT" GOTO NO ACCES
:NO ACCES
echo Brak uprawnien!
PAUSE
EXIT

:MENU
CLS
echo ษออออออออออออออออออออออออออออออออออออป
echo บ              Autorzy               บ
echo ศออออออออออออออออออออออออออออออออออออผ
echo.
echo ษออออออออออออออออออออออออออออออออออออป
echo บ 1.* Patryk Wegrzynski              บ
echo บ 2.* Dawid Wegrzynski               บ
echo ศออออออออออออออออออออออออออออออออออออผ
PAUSE
MENU.BAT