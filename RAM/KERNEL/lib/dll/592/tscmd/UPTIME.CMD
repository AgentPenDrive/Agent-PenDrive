@echo off & setlocal enableextensions

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

call :Title
for /f "tokens=2 delims=:" %%a in ('
  systeminfo^|find "System Up Time:"') do (
    set uptime_=%%a)
for /f "tokens=* delims= " %%a in ('
  echo %uptime_%') do set uptime_=%%a
echo. %uptime_%
::
for /f "tokens=3,4" %%d in (
  'net statistics workstation^|find "Statistics since"') do (
  set lastboot=%%d %%e
  )
echo.
echo Last booted %lastboot%
::
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF

:Title
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Show how long the system has been up since the last boot ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010        ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
endlocal & goto :EOF
