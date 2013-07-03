@echo off & setlocal enableextensions disabledelayedexpansion

rem Converts quoted printable encoding to DOS encding

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: The help
set help_=
if "%~1"=="" set help_=true
if "%~1"=="?" set help_=true
if "%~1"=="/?" set help_=true
if defined help_ (
  call :TitleSubru
  echo Usage: QP2DOS ["InputFileName"] ["OutputFileName"]
  goto _out
  )

:: Test for the availability of SED.EXE in the current folder or at path
set found_=
for %%f in ("SED.EXE") do set found_="%%~$PATH:f"
if exist SED.EXE set found_="SED.EXE"
if [%found_%]==[""] (
  call :TitleSubru
  echo SED.EXE needed by the script not found at path
  echo.
  echo If you do not have it, get it for example from
  echo   20368 Oct 1 1991 ftp://garbo.uwasa.fi/pc/unix/sed15x.zip
  echo   HHSED executable, E.Raymond+D.Kirschbaum+H.Helman
  echo  or
  echo   878915 Oct 25 2003 ftp://garbo.uwasa.fi/win95/unix/UnxUpdates.zip
  echo   UnxUpdates.zip Updates for UnxUtils GNU utilities for native Win32
  goto _out)

:: Don't allow wildcards in the input filename
set filename_=%~1
echo %filename_%|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  call :TitleSubru
  echo Wildcards are not allowed in "%filename_%"
  goto _out
  )

:: Check that the input file exists
if not exist "%filename_%" (
  call :TitleSubru
  echo File "%filename_%" not found
  goto _out
  )

:: Avoid input and output file overlap
if /i "%filename_%"=="%~2" (
  call :TitleSubru
  echo Exiting: same input and output file
  echo "%filename_%"
  goto _out
  )

:: What to do if the output file already exists
if not exist "%~2" goto _set
set ask_=
call :TitleSubru
:_ask
set /p ask_="%~2 already exists, continue [N,y]?"
if "%ask_%"=="" goto _out
if /i "%ask_%"=="n" goto _out
if /i "%ask_%"=="y" goto _set
goto _ask

:: Set the path for the sed script files
:: Two cycles are needed to avoid too many simultaneous sed commands
:_set
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
set sedcmd1=%temp_%\sedcmd1.tmp
set sedcmd2=%temp_%\sedcmd2.tmp

:: Build the sed script file
echo s/=07//g >     "%sedcmd1%"
echo s/=09/	/g >>    "%sedcmd1%"
echo s/=0C//g >>    "%sedcmd1%"
echo s/=20/ /g >>    "%sedcmd1%"
echo s/=21/!/g >>    "%sedcmd1%"
echo s/=22/^"/g >>   "%sedcmd1%"
echo s/=23/#/g >>    "%sedcmd1%"
echo s/=24/$/g >>    "%sedcmd1%"
echo s/=25/%%/g >>   "%sedcmd1%"
echo s/=26/^&/g >>   "%sedcmd1%"
echo s/=27/'/g >>    "%sedcmd1%"
echo s/=28/(/g >>    "%sedcmd1%"
echo s/=29/)/g >>    "%sedcmd1%"
echo s/=2A/*/g >>    "%sedcmd1%"
echo s/=2B/+/g >>    "%sedcmd1%"
echo s/=2C/,/g >>    "%sedcmd1%"
echo s/=2D/-/g >>    "%sedcmd1%"
echo s/=2E/./g >>    "%sedcmd1%"
echo s#=2F#/#g >>    "%sedcmd1%"
echo s/=30/0/g >>    "%sedcmd1%"
echo s/=31/1/g >>    "%sedcmd1%"
echo s/=32/2/g >>    "%sedcmd1%"
echo s/=33/3/g >>    "%sedcmd1%"
echo s/=34/4/g >>    "%sedcmd1%"
echo s/=35/5/g >>    "%sedcmd1%"
echo s/=36/6/g >>    "%sedcmd1%"
echo s/=37/7/g >>    "%sedcmd1%"
echo s/=38/8/g >>    "%sedcmd1%"
echo s/=39/9/g >>    "%sedcmd1%"
echo s/=3A/:/g >>    "%sedcmd1%"
echo s/=3B/;/g >>    "%sedcmd1%"
echo s/=3C/^</g >>   "%sedcmd1%"
echo s/=3E/^>/g >>   "%sedcmd1%"
echo s/=3F/?/g >>    "%sedcmd1%"
echo s/=40/@/g >>    "%sedcmd1%"
echo s/=41/A/g >>    "%sedcmd1%"
echo s/=42/B/g >>    "%sedcmd1%"
echo s/=43/C/g >>    "%sedcmd1%"
echo s/=44/D/g >>    "%sedcmd1%"
echo s/=45/E/g >>    "%sedcmd1%"
echo s/=46/F/g >>    "%sedcmd1%"
echo s/=47/G/g >>    "%sedcmd1%"
echo s/=48/H/g >>    "%sedcmd1%"
echo s/=49/I/g >>    "%sedcmd1%"
echo s/=4A/J/g >>    "%sedcmd1%"
echo s/=4B/K/g >>    "%sedcmd1%"
echo s/=4C/L/g >>    "%sedcmd1%"
echo s/=4D/M/g >>    "%sedcmd1%"
echo s/=4E/N/g >>    "%sedcmd1%"
echo s/=4F/O/g >>    "%sedcmd1%"
echo s/=50/P/g >>    "%sedcmd1%"
echo s/=51/Q/g >>    "%sedcmd1%"
echo s/=52/R/g >>    "%sedcmd1%"
echo s/=53/S/g >>    "%sedcmd1%"
echo s/=54/T/g >>    "%sedcmd1%"
echo s/=55/U/g >>    "%sedcmd1%"
echo s/=56/V/g >>    "%sedcmd1%"
echo s/=57/W/g >>    "%sedcmd1%"
echo s/=58/X/g >>    "%sedcmd1%"
echo s/=59/Y/g >>    "%sedcmd1%"
echo s/=5A/Z/g >>    "%sedcmd1%"
echo s/=5B/[/g >>    "%sedcmd1%"
echo s/=5C/\\/g >>   "%sedcmd1%"
echo s/=5D/]/g >>    "%sedcmd1%"
echo s/=5E/^/g >>    "%sedcmd1%"
echo s/=5F/_/g >>    "%sedcmd1%"
echo s/=60/`/g >>    "%sedcmd1%"
echo s/=61/a/g >>    "%sedcmd1%"
echo s/=62/b/g >>    "%sedcmd1%"
echo s/=63/c/g >>    "%sedcmd1%"
echo s/=64/d/g >>    "%sedcmd1%"
echo s/=65/e/g >>    "%sedcmd1%"
echo s/=66/f/g >>    "%sedcmd1%"
echo s/=67/g/g >>    "%sedcmd1%"
echo s/=68/h/g >>    "%sedcmd1%"
echo s/=69/i/g >>    "%sedcmd1%"
echo s/=6A/j/g >>    "%sedcmd1%"
echo s/=6B/k/g >>    "%sedcmd1%"
echo s/=6C/l/g >>    "%sedcmd1%"
echo s/=6D/m/g >>    "%sedcmd1%"
echo s/=6E/n/g >>    "%sedcmd1%"
echo s/=6F/o/g >>    "%sedcmd1%"
echo s/=70/p/g >>    "%sedcmd1%"
echo s/=71/q/g >>    "%sedcmd1%"
echo s/=72/r/g >>    "%sedcmd1%"
echo s/=73/s/g >>    "%sedcmd1%"
echo s/=74/t/g >>    "%sedcmd1%"
echo s/=75/u/g >>    "%sedcmd1%"
echo s/=76/v/g >>    "%sedcmd1%"
echo s/=77/w/g >>    "%sedcmd1%"
echo s/=78/x/g >>    "%sedcmd1%"
echo s/=79/y/g >>    "%sedcmd1%"
echo s/=7A/z/g >>    "%sedcmd1%"
echo s/=7B/{/g >>    "%sedcmd1%"
echo s/=7C/^|/g >>   "%sedcmd1%"
echo s/=7D/}/g >>    "%sedcmd1%"
echo s/=7E/~/g >>    "%sedcmd1%"
echo s/=7F//g >>     "%sedcmd1%"
echo s/=A0//g >>     "%sedcmd1%"
echo s/=A1/­/g >>    "%sedcmd1%"
echo s/=A2/›/g >>    "%sedcmd1%"
echo s/=A3/œ/g >>    "%sedcmd1%"
echo s/=A4/o/g >>    "%sedcmd1%"
echo s/=A5/Y/g >>    "%sedcmd1%"
echo s/=A6/^|/g >>   "%sedcmd1%"
echo s/=A7//g >>    "%sedcmd1%"
echo s/=A8/úú/g >>   "%sedcmd1%"
echo s/=A9/(c)/g >>  "%sedcmd1%"
echo s/=AA/a/g >>    "%sedcmd1%"
echo s/=AB/®/g >>    "%sedcmd1%"
echo s/=AC/-/g >>    "%sedcmd1%"
echo s/=AD/-/g >>    "%sedcmd1%"
echo s/=AE/(R)/g >>  "%sedcmd1%"
echo s/=AF/-/g >>    "%sedcmd1%"
echo s/=B0/ø/g >>    "%sedcmd1%"
echo s/=B1/ñ/g >>    "%sedcmd1%"
echo s/=B2/^"/g >>   "%sedcmd1%"
echo s/=B3/^"/g >>   "%sedcmd1%"
echo s/=B4/'/g >>    "%sedcmd1%"
echo s/=B5/æ/g >>    "%sedcmd1%"
echo s/=B6/ã/g >>    "%sedcmd1%"
echo s/=B7/ú/g >>    "%sedcmd1%"
echo s/=B8/,/g >>    "%sedcmd1%"
echo s/=B9/1/g >>    "%sedcmd1%"
echo s/=BA/§/g >>    "%sedcmd1%"
echo s/=BB/¯/g >>    "%sedcmd1%"
echo s/=BC/¬/g >>    "%sedcmd1%"
echo s/=BD/«/g >>    "%sedcmd1%"
echo s/=BE/3/4/g >>  "%sedcmd1%"
echo s/=BF/¨/g >>    "%sedcmd1%"
echo s/=C0/A/g >>    "%sedcmd1%"
echo s/=C1/A/g >>    "%sedcmd1%"
echo s/=C2/A/g >>    "%sedcmd1%"
echo s/=C3/A/g >>    "%sedcmd1%"
echo s/=C4//g >>    "%sedcmd1%"
echo s/=C5//g >>    "%sedcmd1%"
echo s/=C6/’/g >>    "%sedcmd1%"
echo s/=C7/€/g >>    "%sedcmd1%"
echo s/=C8/E/g >>    "%sedcmd1%"
echo s/=C9//g >>    "%sedcmd1%"
echo s/=CA/E/g >>    "%sedcmd1%"
echo s/=CB/E/g >>    "%sedcmd1%"
echo s/=CC/I/g >>    "%sedcmd1%"
echo s/=CD/I/g >>    "%sedcmd1%"
echo s/=CE/I/g >>    "%sedcmd1%"
echo s/=CF/I/g >>    "%sedcmd1%"
echo s/=D0/D/g >>    "%sedcmd1%"
echo s/=D1/¥/g >>    "%sedcmd1%"
echo s/=D2/O/g >>    "%sedcmd1%"
echo s/=D3/O/g >>    "%sedcmd1%"
echo s/=D4/O/g >>    "%sedcmd1%"
echo s/=D5/O/g >>    "%sedcmd1%"
echo s/=D6/™/g >>    "%sedcmd1%"
echo s/=D7/x/g >>    "%sedcmd1%"
echo s/=D8/O/g >>    "%sedcmd1%"
echo s/=D9/U/g >>    "%sedcmd1%"
echo s/=DA/U/g >>    "%sedcmd1%"
echo s/=DB/U/g >>    "%sedcmd1%"
echo s/=DC/š/g >>    "%sedcmd1%"
echo s/=DD/Y/g >>    "%sedcmd1%"
echo s/=DE/è/g >>    "%sedcmd1%"
echo s/=DF/á/g >>    "%sedcmd1%"
echo s/=E0/…/g >>    "%sedcmd1%"
echo s/=E1/ /g >>    "%sedcmd1%"
echo s/=E2/ƒ/g >>    "%sedcmd1%"
echo s/=E3/a/g >>    "%sedcmd1%"
echo s/=E4/„/g >>    "%sedcmd1%"
echo s/=E5/†/g >>    "%sedcmd1%"
echo s/=E6/‘/g >>    "%sedcmd1%"
echo s/=E7/‡/g >>    "%sedcmd1%"
echo s/=E8/Š/g >>    "%sedcmd1%"
echo s/=E9/‚/g >>    "%sedcmd1%"
echo s/=EA/ˆ/g >>    "%sedcmd1%"
echo s/=EB/‰/g >>    "%sedcmd1%"
echo s/=EC//g >>    "%sedcmd1%"
echo s/=ED/¡/g >>    "%sedcmd1%"
echo s/=EE/Œ/g >>    "%sedcmd1%"
echo s/=EF/‹/g >>    "%sedcmd1%"
echo s/=F0/=F0/g >>  "%sedcmd1%"
echo s/=F1/¤/g >>    "%sedcmd1%"
echo s/=F2/•/g >>    "%sedcmd1%"
echo s/=F3/¢/g >>    "%sedcmd1%"
echo s/=F4/“/g >>    "%sedcmd1%"
echo s/=F5/o/g >>    "%sedcmd1%"
echo s/=F6/”/g >>    "%sedcmd1%"
echo s/=F7/ö/g >>    "%sedcmd1%"
echo s/=F8/o/g >>    "%sedcmd1%"
echo s/=F9/—/g >>    "%sedcmd1%"
echo s/=FA/£/g >>    "%sedcmd1%"
echo s/=FB/–/g >>    "%sedcmd1%"
echo s/=FC//g >>    "%sedcmd1%"
echo s/=FD/y/g >>    "%sedcmd1%"
echo s/=FE/è/g >>    "%sedcmd1%"
echo s/=FF/˜/g >>    "%sedcmd1%"
echo s/?=//g >>      "%sedcmd1%"
echo s/=3D/=/g >>    "%sedcmd1%"
::
echo s/=?iso-8859-1?Q?//g >>   "%sedcmd2%"
echo s/=?ISO-8859-1?Q?//g >>   "%sedcmd2%"
echo s/=?iso-8859-15?Q?//g >>  "%sedcmd2%"
echo s/=?ISO-8859-15?Q?//g >>  "%sedcmd2%"
echo s/=?Windows-1252?Q?//g >> "%sedcmd2%"
echo s/=?iso-8859-1?b?//g >>   "%sedcmd2%"

:: Call sed on the input file
:. taking the commands from the sed script file
sed -f"%sedcmd1%" "%filename_%" > "%temp_%\qp2dos1.tmp"
if "%~2"=="" (
  sed -f"%sedcmd2%" "%temp_%\qp2dos1.tmp"
  ) else (
  sed -f"%sedcmd2%" "%temp_%\qp2dos1.tmp" > "%~2"
  echo.
  dir "%~2"
  )

:: Clean up
for %%f in ("%sedcmd1%"
            "%sedcmd2%"
            "%temp_%\qp2dos1.tmp") do if exist "%%f" del "%%f"

:_out
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF

:: ===========================================================
:TitleSubru
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ QP2DOS.CMD Convert quoted printable encoding to DOS ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
goto :EOF
