@Echo OFF
CLS
TITLE Agent PenDrive - v1.5

:START
CLS
echo.
echo                                   JUBY
echo                                 PRESENTS
echo.
echo                              Agent PenDrive
echo                                   v1.5
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Wybierz opcje...
echo.
echo	1.Uruchom program	2.Edytor	W.Wyjscie
set /p"cho=>"
if %cho%==0 "HIDEN FEATURES.BAT"
if %cho%==1 "PASSWORD.BAT"
if %cho%==2 GOTO EDIT
if %cho%==w "STOP.BAT"
if %cho%==W "STOP.BAT"
CLS
echo Blad!
PAUSE
GOTO START

:EDIT
TITLE Agent Pendrive - Edytor
edit.COM