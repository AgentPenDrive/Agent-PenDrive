:: ----------------------------------------------------------------------------+
:: Copyright (C) 2009, 2013 GitSoft                                         :
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
:: Ten plik jest cz©˜ci¥ Agent PenDrive.                                       :
::                                                                             :
:: Ten program jest wolnym oprogramowaniem; mo¾esz go rozprowadza† dalej       :
:: i/lub modyfikowa† na warunkach Powszechnej Licencji Publicznej GNU,         :
:: wydanej przez Fundacj© Wolnego Oprogramowania - wedˆug wersji 3 tej         :
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

:PROPER ========================================================================
CLS
TITLE Agent PenDrive - Rejestracja

:ENTER_NEW_LOGIN ===============================================================
CLS
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º    Agent PenDrive - Rejestracja    º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO Prosz© wprowadzi† nowy login do programu: (W - Wr¢†)
SET /P NEW_LOGIN=">"
IF "%NEW_LOGIN%"=="" (
  CLS
  ECHO Bˆ¥d! Nie wprowadzono loginu...
  PAUSE
  GOTO ENTER_NEW_LOGIN
)
IF NOT "%NEW_LOGIN%"=="" GOTO ENTER_NEW_PASSWORD
IF "%NEW_LOGIN%"=="w" GOTO END
IF "%NEW_LOGIN%"=="W" GOTO END
GOTO ENTER_NEW_LOGIN

:ENTER_NEW_PASSWORD ============================================================
CLS
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º    Agent PenDrive - Rejestracja    º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO Prosz© wprowadzi† nowe hasˆo do programu: (W - Wr¢†)
SET /P NEW_PASSWD=">"
IF "%NEW_PASSWD%"=="" (
  CLS
  ECHO Bˆ¥d! Nie wprowadzono hasˆa...
  PAUSE
  GOTO ENTER_NEW_PASSWORD
)
IF NOT "%NEW_PASSWD%"=="" GOTO SAVE_LOGIN_n_PASSWD
IF "%NEW_PASSWD%"=="w" GOTO END
IF "%NEW_PASSWD%"=="W" GOTO END
GOTO ENTER_NEW_PASSWORD

:SAVE_LOGIN_n_PASSWD ===========================================================
CLS
IF EXIST "apd_conf" RMDIR /Q /S "apd_conf"
IF NOT EXIST "apd_conf" MKDIR "apd_conf"

CLS
ECHO Zapisywanie.
PING LOCALHOST>NUL
ECHO [ACCES_MGR]>"apd_conf\conf.ap_ini"

CLS
ECHO Zapisywanie..
PING LOCALHOST>NUL
ECHO LOGIN=%NEW_LOGIN%>>"apd_conf\conf.ap_ini"

CLS
ECHO Zapisywanie...
PING LOCALHOST>NUL
ECHO PASSWD=%NEW_PASSWD%>>"apd_conf\conf.ap_ini"

GOTO END

:END ===========================================================================
CLS
SET NEW_LOGIN=
SET NEW_PASWD=