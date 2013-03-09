@echo off

rem This batch file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem This simple batch helps to pinpoint the columns of the screen by
rem displaying a ruler. The batch uses ansi escape sequences to avoid
rem excessive scrolling in the case of MS-DOS+Win../95/98/Me.

if "%1"=="?" goto _help
if "%1"=="/?" goto _help

if [%OS%]==[Windows_NT] goto _xp

:_dos
if not "%1"=="/r" if not "%1"=="/R" goto _doscol
for %%i in (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24) do echo %%i
:_doscol
echo [2A
echo 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
echo [2A
goto _out

:_help
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ RULER.BAT Pinpoint screen columns and rows        ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
if [%OS%]==[Windows_NT] goto _xphelp
echo Usage: RULER [/R]
echo                ÀÄ include Rows
echo.
echo This simple batch helps to pinpoint the columns of the screen by
echo displaying a ruler. The batch uses ansi escape sequences to avoid
echo excessive scrolling in the case of MS-DOS+Win../95/98/Me.
goto _out
:_xphelp
echo Usage: RULER [/C]
echo                ÀÄ Columns, i.e. horizontally only
echo.
echo This simple batch helps to pinpoint the rowns and the columns of the
echo screen by displaying a ruler in colors. Requires ECHOC.EXE
echo.
goto _out

:_xp
:: Augment the path if necessary. Customize.
if not "%USERNAME%"=="tsadmin" if not "%USERNAME%"=="ts" if not "%USERNAME%"=="es" if not "%USERNAME%"=="x" goto _test
echo %path%|find /i "c:\_f\xtools;c:\_f\tools;c:\_f\ftools;c:\_e\arczip;">nul
if errorlevel 1 path c:\_f\xtools;c:\_f\tools;c:\_f\ftools;c:\_e\arczip;%path%

:: Test for the presence of the ECHOC.EXE program
:_test
  set echoc_=ECHOC.EXE
  for %%f in ("%echoc_%") do set prog_=%%~$PATH:f
  if exist "%echoc_%" set prog_=%echoc_%
  if "%prog_%"=="" (
    echo.
    echo "%echoc_%" not found in the current directory or at path.
    echo It is available in ftp://garbo.uwasa.fi/pc/link/tscmd.zip
    echo Exiting %~f0
    goto _out
  )

:: The display
if /i "%~1"=="/c" goto _col
for /L %%i in (1,1,23) do (echoc 0 13 %%i & echo.)
:_col
echoc 0 14 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
echo.
goto _out

:_out
for %%v in (echoc_ prog_) do set %%v=
if not "%dosbox%"=="true" if not "%cmdbox%"=="true" pause
