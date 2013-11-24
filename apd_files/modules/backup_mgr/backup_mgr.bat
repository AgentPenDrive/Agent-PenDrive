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
TITLE Agent PenDrive - Kopia zapasowa

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
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º  Agent PenDrive - Kopia zapasowa   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1.* Stworz kopie zapasowa danych   º
echo º 2.* Usun kopie zapasowa danych     º
echo º 3.* Przywroc kopie zapasowa danych º
echo º 4.* Informacje                     º
echo º W.* Wroc                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set /p"cho=>"
if %cho%==1 GOTO CREATE BACKUP
if %cho%==2 GOTO DELETE BACKUP
if %cho%==3 GOTO RESTORE BACKUP
if %cho%==4 GOTO INFO
if %cho%==W MENU.BAT
if %cho%==w MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:CREATE BACKUP
CLS
echo Uwaga! Wymagane jest przynajmiej 952 Mb
echo wolnego miejsca na partycji SYSTEMOWEJ.
PAUSE

CLS
echo Tworzenie katalogow kopi zapasowej...
echo.
MD "%SystemRoot%\Agent PenDrive"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE"
echo.
MD "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3"
echo.
PAUSE

CLS
echo Tworzenie kopi zapasowej...
echo.
XCOPY /H /Y /E "OTHER"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER"
echo.
XCOPY /H /Y /E "VIDEO"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO"
echo.
XCOPY /H /Y /E "MUSIC"    "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC"
echo.
XCOPY /H /Y /E "PICTURE"  "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE"
echo.
XCOPY /H /Y /E "PS3"      "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3"
echo.
CLS
echo Kopia zapasowa danych stworzona!
TIME /T
DATE /T
PAUSE
GOTO MENU

:DELETE BACKUP
CLS
echo Usuwanie plikow kopi zapasowej...
echo.
RMDIR /S /Q "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
CLS
echo Kopia zapasowa danych usunieta!
TIME /T
DATE /T
PAUSE
GOTO MENU

:RESTORE BACKUP
CLS
echo Przywracanie plikow kopi zapasowej...
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\OTHER" "OTHER"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\VIDEO" "VIDEO"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\MUSIC" "MUSIC"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PICTURE" "PICTURE"
echo.
XCOPY /H /Y /E "%SystemRoot%\Agent PenDrive\Backup\Files Backup\PS3" "PS3"
echo.
CLS
echo Kopia zapasowa danych przywrocona!
TIME /T
DATE /T
PAUSE
GOTO MENU



:INFO
CLS
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Backup" GOTO INFO NOT EXIST

IF EXIST "%SystemRoot%\Agent PenDrive\Backup\Files Backup" GOTO INFO EXIST
IF NOT EXIST "%SystemRoot%\Agent PenDrive\Backup\Files Backup" GOTO INFO NOT EXIST

:INFO EXIST
CLS
echo Kopia zapasowa danych stworzona.
TIME /T
DATE /T
TREE "%SystemRoot%\Agent PenDrive\Backup\Files Backup"
PAUSE
GOTO MENU

:INFO NOT EXIST
CLS
echo Kopia zapasowa danych nie istnieje.
TIME /T
DATE /T
PAUSE
GOTO MENU