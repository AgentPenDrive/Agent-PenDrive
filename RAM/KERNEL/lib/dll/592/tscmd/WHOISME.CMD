@echo off & setlocal enableextensions
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ WHOISME.CMD Get IP and some user information     ³
echo ³ By Prof Timo Salmi, Last modified Tue 2-Feb-2010 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem  I was originally going to call this WHOAMI.CMD but then it came
rem  to light that Vista cmd.exe command set includes a whoami
rem  so I renamed this small script to WHOISME.CMD

:: Display the computer's name
echo.%COMPUTERNAME%

:: Get full computer name from the list of configurable services
for /f "tokens=4*" %%a in ('
  net config Workstation^|find /i "Full Computer name"') do (
    echo %%a)

:: Display the username
echo.%USERNAME%

:: Get the current IP from the TCP/IP network configuration values
for /f "tokens=2 delims=:" %%i in (
  'ipconfig /all^|find "IP Address"'
  ) do set ip=%%i
if "%ip%"=="" (
  echo IP Address not found
  goto _out)
set ip=%ip: =%
echo.%ip%

:: Look up the IP address on the name server
for /f "tokens=2 delims=:" %%n in (
  'nslookup %ip%^|find "Name:"'
  ) do set name=%%n
set name=%name: =%
echo.%name%

:: Author's special ending for desktop usage
:_out
if not defined cmdbox if defined PauseIfFromDesktop pause

endlocal & goto :EOF
