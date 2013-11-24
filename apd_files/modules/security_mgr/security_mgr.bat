:: ----------------------------------------------------------------------------+
:: Copyright (C) 2009, 2013 GitSoft                                            :
::                                                                             :
:: This file is part of Agent PenDrive.                                        :
::                                                                             :
:: This program is free software: you can redistribute it and/or modIFy        :
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
:: along with this program; IF not, see <http://www.gnu.org/licenses/>.        :
:: ----------------------------------------------------------------------------+
:: Prawa autorskie (C) 2009, 2013 GitSoft                                      :
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

:PROPER ========================================================================
CLS
TITLE Agent PenDrive - Zabezpieczanie 

:CHECK_ACCES ===================================================================
CLS
IF "%LOGGED_IN"=="true" GOTO MENU
IF NOT "%LOGGED_IN"=="true" (
  @ECHO OFF
  CLS
  ECHO Nieautoryzowana pr¢ba dost©pu!
  PAUSE
  EXIT
)

:CHECK_SECIRITY_STATE ==========================================================
CLS
FOR /F "eol=# tokens=1,2 delims==" IN (apd_files\conf.ap_ini) DO (
  IF "%%a"=="SEC_STATE" (
    IF "%%b"=="true" SET SEC_STATE==Wˆ¥czone     
    IF "%%b"=="false" SET SEC_STATE==Wyˆ¥czone    
  )
)

:MENU ==========================================================================
CLS
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º  Agent PenDrive - Zabezpieczanie   º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º Stan zabezpieczeä: º %SEC_STATE% º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO ÉÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º 1.º Odbezpiecz dane                º
ECHO º 2.º Zabezpiecz dane                º
ECHO º W.º Wr¢†                           º
ECHO ÈÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
SET /P OPT=">"
IF "%OPT%"=="1" GOTO UNLOCK
IF "%OPT%"=="2" GOTO LOCK
IF "%OPT%"=="w" GOTO END
IF "%OPT%"=="W" GOTO END
GOTO MENU

:UNLOCK ========================================================================
CLS
ATTRIB -S -H "OTHER"
ATTRIB -S -H "MUSIC"
ATTRIB -S -H "PICTURE"
ATTRIB -S -H "VIDEO"
ATTRIB -S -H "PS3"
CLS
ECHO Dane odbezpieczone!
PAUSE
GOTO MENU

:LOCK ==========================================================================
CLS
ATTRIB +H +S "OTHER"
ATTRIB +H +S "MUSIC"
ATTRIB +H +S "PICTURE"
ATTRIB +H +S "VIDEO"
ATTRIB +H +S "PS3"
CLS
ECHO Dane zabezpieczone!
PAUSE
GOTO MENU

:END ===========================================================================