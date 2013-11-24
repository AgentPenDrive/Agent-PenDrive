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
TITLE Agent PenDrive - Panel Sterowania

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
echo � Agent PenDrive - Panel Sterowania  �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Kopia zapasowa programu.       �
echo � 2.* Zmien haslo dostepu            �
echo � 3.* Aktualizacja                   �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO 1 PROGRAM BACKUP
if %cho%==2 GOTO 5 CHANGE PASS
if %cho%==3 GOTO 6 UPGRADE
if %cho%==W MENU.BAT
if %cho%==w MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU



:1 PROGRAM BACKUP
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo �  Agent Pendrive - Kopia Zapasowa   �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Stworz kopie zapasowa.         �
echo � 2.* Usun kopie zapasowa.           �
echo � 3.* Przywroc kopie zapasowa.       �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO 2 PROGRAM BACKUP-CREATE
if %cho%==2 GOTO 3 PROGRAM BACKUP-DELETE
if %cho%==3 GOTO 4 PROGRAM BACKUP-RESTORE
if %cho%==W GOTO MENU
if %cho%==w GOTO MENU
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL

:2 PROGRAM BACKUP-CREATE
CLS
MD "%SystemRoot%\Agent PenDrive"
MD "%SystemRoot%\Agent PenDrive\Backup"
MD "%SystemRoot%\Agent PenDrive\Backup\Program Backup"
attrib -h -s 	"PASSWORD.BAT"
COPY		"PASSWORD.BAT"		"%SystemRoot%\Agent PenDrive\Backup\Program Backup"
attrib +h +s 	"PASSWORD.BAT"
COPY 		"Agent PenDrive.exe"			"%SystemRoot%\Agent PenDrive\Backup\Program Backup"
CLS
echo Tworzenie kopi zapasowej zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP

:3 PROGRAM BACKUP-DELETE
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Backup\Program Backup"
CLS
echo Usuwanie kopi zapasowej programu zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP

:4 PROGRAM BACKUP-RESTORE
CLS
COPY		"%SystemRoot%\Agent PenDrive\Backup\Program Backup\PASSWORD.BAT"
COPY 		"%SystemRoot%\Agent PenDrive\Backup\Program Backup\Agent PenDrive.exe"
CLS
echo Przywracanie kopi zapasowej programu zakonczone!
PAUSE
GOTO 1 PROGRAM BACKUP



:5 CHANGE PASS
CLS
attrib -h -s "PASSWORD.BAT"
echo Aby zmienic haslo zedytuj plik 'PASSWORD' ktory pojawil sie przed chwila.                                              
echo W 12 wersie pliku, znajdziesz zdanie
echo            ����������������������ͻ
echo if XXXXX== � TWOJE AKTUALNE HASLO � GOTO CORRECT PASSWORD.
echo            ����������������������ͼ
echo Zamiast 'TWOJE AKTUALNE HASLO' wpisz nowe.                
PAUSE
attrib +h +s "PASSWORD.BAT"
GOTO MENU



:6 UPGRADE
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo �    Agent Pendrive - Aktualizja     �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Zainstaluj aktualizacje        �
echo � 2.* Usun aktualizacje              �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO 7 UPGRADE - INSTALL
if %cho%==2 GOTO 8 UPGRADE - UNINSTALL
if %cho%==W GOTO MENU
if %cho%==w GOTO MENU
CLS
echo Blad!
PAUSE
GOTO 6 UPGRADE

:7 UPGRADE - INSTALL
UPGRADE.EXE
CLS
echo Nie znaleziono aktualizacji...
PAUSE
GOTO 6 UPGRADE

:8 UPGRADE - UNINSTALL
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Upgrade"
echo Aktualizacja zostala usunieta...
PAUSE
GOTO 6 UPGRADE