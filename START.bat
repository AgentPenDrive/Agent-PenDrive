@Echo OFF
TITLE Agent Pendrive - v1.4

:START
CLS
echo.
echo                                   JUBY
echo                                 PRESENTS
echo.
echo                              Agent PenDrive
echo                                   v1.4
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Wybierz opcje...
echo.
echo	1.Uruchom program	2.Panel Sterowania	3.Edytor	W.Wyjscie
set /p"cho=>"
if %cho%==0 HIDEN_FEATURES.BAT
if %cho%==1 1.PASSWORD.BAT
if %cho%==2 CONTROL_PANEL.BAT
if %cho%==3 edit.COM
if %cho%==w STOP.BAT
if %cho%==W STOP.BAT
CLS
echo Blad!
PAUSE
GOTO START