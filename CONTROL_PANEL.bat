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
TITLE Agent Pendrive - Panel Sterowania
CLS

:SYSTEM PANEL
CLS
VER
TIME /T
DATE /T
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º Agent Pendrive - Panel Sterowania  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1.* Kopia zapasowa programu.       º
echo º 3.* Nagly WYPADEK. *               º
echo º W.* Wroc                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set /p"cho=>"
if %cho%==1 GOTO PROGRAM BACKUP
if %cho%==2 GOTO HIDE THE FILES
if %cho%==3 GOTO EMERGENCY
if %cho%==W START.BAT
if %cho%==w START.BAT
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL











:PROGRAM BACKUP
CLS
VER
TIME /T
DATE /T
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º  Agent Pendrive - Kopia zapasowa   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1.* Stworz kopie zapasowa.         º
echo º 2.* Usun kopie zapasowa.           º
echo º 3.* Przywroc kopie zapasowa.       º
echo º W.* Wroc                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set /p"cho=>"
if %cho%==1 GOTO PROGRAM BACKUP-CREATE
if %cho%==2 GOTO PROGRAM BACKUP-DELETE
if %cho%==3 GOTO PROGRAM BACKUP-RESTORE
if %cho%==W GOTO SYSTEM PANEL
if %cho%==w GOTO SYSTEM PANEL
CLS
echo Blad!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-CREATE
CLS
MD "%SystemRoot%\Agent PenDrive"
MD "%SystemRoot%\Agent PenDrive\Program Backup"
attrib -h -s 	"1.PASSWORD.BAT"
COPY		"1.PASSWORD.BAT"		"%SystemRoot%\Agent PenDrive\Program Backup"
attrib +h +s 	"1.PASSWORD.BAT"
COPY 		"Juby.exe"			"%SystemRoot%\Agent PenDrive\Program Backup"
CLS
echo Tworzenie kopi zapasowej zakonczone!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-DELETE
CLS
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Program Backup"
CLS
echo Usuwanie kopi zapasowej programu zakonczone!
PAUSE
GOTO SYSTEM PANEL

:PROGRAM BACKUP-RESTORE
CLS
COPY		"%SystemRoot%\Agent PenDrive\Program Backup\1.PASSWORD.BAT"
COPY 		"%SystemRoot%\Agent PenDrive\Program Backup\Juby.exe"
CLS
echo Tworzenie kopi zapasowej programu zakonczone!
PAUSE
GOTO SYSTEM PANEL
















:EMERGENCY
CLS
echo CZY JESTES PEWIEN? ZMIANY SA NIE!!!ODWRACALNE (T/N)
set /p"cho=>"
if %cho%==T GOTO YES
if %cho%==N GOTO NO
if %cho%==t GOTO YES
if %cho%==n GOTO NO

:YES
CLS
RMDIR /S /Q "OTHER"
echo *** 20%
CLS
RMDIR /S /Q "MUSIC"
echo ****** 40%
CLS
RMDIR /S /Q "PICTURE"
echo ********* 60%
CLS
RMDIR /S /Q "VIDEO"
echo ************ 80%
CLS
RMDIR /S /Q "PS3"
echo *************** 100%
GOTO RAPORT

:NO
CLS
GOTO SECURITY

:RAPORT
TYPE "RAPORT.txt"
PAUSE
GOTO SECURITY