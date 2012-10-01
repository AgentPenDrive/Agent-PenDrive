:: %ZMIENNA:~1%                                                                 ; Wszystkie litery opr¢cz pierwszej
:: %ZMIENNA:~0,-1%                                                              ; Wszystkie litery opr¢cz ostatniej
:: %ZMIENNA:~0,1%                                                               ; Pierwsza litera
:: %ZMIENNA:~-1%                                                                ; Ostatnia litera

:CREATE_FILE -------------------------------------------------------------------
:: FILE ---------------
:: SET FILE=%2
:: SET FILE=%FILE:~1%
:: SET FILE=%FILE:~0,-1%
:: LABEL --------------
:: SET LABEL=%3
:: SET LABEL=%LABEL:~1%
:: SET LABEL=%LABEL:~0,-1%
:: KEY ----------------
:: SET KEY=%4
:: SET KEY=%KEY:~1%
:: SET KEY=%KEY:~0,-1%
:: VALUE --------------
:: SET VALUE=%5
:: SET VALUE=%VALUE:~1%
:: SET VALUE=%VALUE:~0,-1%
:: --------------------
SET FILE=ini.ini
SET LABEL=[Testowa Etykieta]
SET KEY=Testowy Klucz
SET VALUE=Testowa Wartosc
:: --------------------
ECHO %FILE%
ECHO %LABEL%
ECHO %KEY%
ECHO %VALUE%
PAUSE
:: --------------------
INIFILE "%FILE%" %LABEL% %KEY%=%VALUE%