@echo off & setlocal enableextensions enabledelayedexpansion
rem
rem   Displays a color map for the ECHOC.EXE screen colors command.
rem   See the following FAQ item for more information:
rem   51) How can I echo lines in different colors in NT scripts?
rem   Requires ECHOC.EXE from
rem    ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem    http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks
::
::
set help_=
if "%~1"=="?" set help_=true
if "%~1"=="/?" set help_=true
if defined help_ (
  echo.
  echo Displays a color map for the ECHOC.EXE screen colors command.
  echo.
  echo See the following FAQ item for more information:
  echo 51^) How can I echo lines in different colors in NT scripts?
  echo http://www.netikka.net/tsneti/info/tscmd051.htm
  echo.
  echo Requires ECHOC.EXE from either
  echo  ftp://garbo.uwasa.fi/pc/link/tscmd.zip
  echo  http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Test for echoc availability at path or in the current directory
for %%f in ("ECHOC.EXE") do set found_="%%~$PATH:f"
if exist ECHOC.EXE set found_="ECHOC.EXE"
if [%found_%]==[""] (
  echo ECHOC.EXE needed by the %~f0 script not found
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Title
echoc 0 14 ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo.
echoc 0 14 ³
echoc 0 0
echoc 0 12 COLORMAP
echoc 0 0
echoc 0 14 for
echoc 0 0
echoc 0 13 ECHOC.EXE
echoc 0 0
echoc 0 14 screen colors ³
echo.
echoc 0 14 ³ By Prof. Timo Salmi Tue 2-Feb-2010
echoc 0 0
echoc 0 0
echoc 0 0
echoc 0 14 ³
echo.
echoc 0 14 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
::
:: Make the colormap, one background color at a time
for /L %%b in (0, 1, 7) do call :ColorBar %%b
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF

:: ===============================================================
:ColorBar
setlocal enableextensions enabledelayedexpansion
set bg=%1
for /L %%f in (0, 1, 15) do (
  echoc %bg% %%f %bg% %%f
  echoc 0 0)
echo.
endlocal & goto :EOF
