@Echo OFF
CLS
TITLE Agent Pendrive - Spawdzanie systemu plikow


:MENU
CLS
VER
TIME /T
DATE /T
echo ������������������������������������ͻ
echo � Agent Pendrive - Spawdzanie sys... �
echo ������������������������������������ͼ
echo.
echo ������������������������������������ͻ
echo � 1.* Skanuj dysk                    �
echo � 2.* Napraw bledy na dysku          �
echo � 3.* Odzyskaj utracone informacje   �
echo � 4.* BRAK OPCJI                     �
echo � W.* Wroc                           �
echo ������������������������������������ͼ
set /p"cho=>"
if %cho%==1 GOTO SCAN
if %cho%==2 GOTO REPAIR ERRORS
if %cho%==3 GOTO RECOVER INFORMATIONS
if %cho%==4 GOTO NO OPTION
if %cho%==w 3.MENU.BAT
if %cho%==W 3.MENU.BAT
CLS
echo Blad!
PAUSE
GOTO MENU

:NO OPTION
CLS
echo Ta opcja zosta�a wycofana poniewasz
echo powodowala bledy systemowe.
echo Pracujemy nad jej ulepszeniem
echo.
PAUSE
GOTO MENU

:SCAN
CLS
CHKDSK
echo.
PAUSE
GOTO MENU

:REPAIR ERRORS
CLS
CHKDSK /X /F
echo.
PAUSE
GOTO MENU

:RECOVER INFORMATIONS
CLS
CHKDSK /X /F /R
echo.
PAUSE
GOTO MENU
