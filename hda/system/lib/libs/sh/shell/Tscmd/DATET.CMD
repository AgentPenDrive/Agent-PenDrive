@echo off

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Usage help
set help_=
if "%~1"=="?" set help_=true
if "%~1"=="/?" set help_=true
if /i "%~1"=="/help" set help_=true
if defined help_ goto _help

:: Get switches, if any
set DTpar1=%~1
set DTpar2=%~2

for %%p in (%DTpar1% %DTpar2%) do if /i "%%p"=="/c" set clearDatet_=true
for %%p in (%DTpar1% %DTpar2%) do if /i "%%p"=="/q" set quietDatet_=true

if defined clearDatet_ goto _clear

:: Build a Visual Basic Script to get the date and time
:_build
set skip=
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
if not exist "%temp_%\" (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto :EOF
  )
findstr "'%skip%VBS" "%~f0" > "%temp_%\datet$$$.vbs"

:: Run it with Microsoft Windows Script Host Version 5.6
cscript //nologo "%temp_%\datet$$$.vbs" >"%temp_%\datet$$$.cmd"

:: Call the command line script which the script host built
call "%temp_%\datet$$$.cmd"
goto _show

:: Clear the variables
:_clear
for %%v in (DD MM YY YYYY WkD Mon HH MI SS) do set Datet%%v=

:: Show the results
:_show
setlocal enableextensions enabledelayedexpansion
if not defined quietDatet_ (
  call :DatetTitle
  echo.
  for %%v in (DD MM YY YYYY WkD Mon HH MI SS) do (
    echo Datet%%v=!Datet%%v!)
  )
endlocal
goto _clean

:_help
call :DatetTitle
echo.
echo Usage: DATET [/C] [/Q]
echo                ³    ÀÄ Quiet
echo                ÀÄ Clear the Datet environment variables
echo.
echo The questions "How do I rename my file with the date?" or "How do I
echo get the elements of the date into environment variables?" are asked
echo time and again e.g. on the Usenet news. Run this script before yours
echo to have all the needed elements already available.
echo.
echo The day and the month will include a leading zero for one digit results.
echo If you need to drop the leading zero see 1CMDFAQ.TXT for how it is done.
echo Or http://www.netikka.net/tsneti/info/tscmd079.htm
echo    http://www.netikka.net/tsneti/info/tscmd119.htm
echo    http://www.netikka.net/tsneti/info/tscmd154.htm
echo.
echo The script builds a temporary Visual Basic Script to get locale
echo independent date information. The problem with the ordinary DATE /T
echo is that its output depends on the localization configuration.
goto _clean

:: Clean up
:_clean
for %%f in ("%temp_%\datet$$$.vbs" "%temp_%\datet$$$.cmd") do if exist "%%f" del "%%f"
for %%v in (DTpar1 DTpar2 temp_ help_ clearDatet_ quietDatet_ show_) do set %%v=
if not defined cmdbox if defined PauseIfFromDesktop pause
goto :EOF

:: =======================================================================
:DatetTitle
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ DATET Put the current date and time elements into the environment ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010                 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
goto :EOF


'........................................................................
'A Visual Basic Script to get the date and time
'
DateTimeNow=Now                                                         'VBS
'
Wscript.Echo "@set DatetDD=" & Right(0 & Day(DateTimeNow), 2)           'VBS
Wscript.Echo "@set DatetMM=" & Right(0 & Month(DateTimeNow), 2)         'VBS
Wscript.Echo "@set DatetYY=" & Right(Year(DateTimeNow), 2)              'VBS
Wscript.Echo "@set DatetYYYY=" & Year(DateTimeNow)                      'VBS
'
Wd=WeekDayName(Weekday(DateTimeNow),true)                               'VBS
Wscript.Echo "@set DatetWkD=" & Wd                                      'VBS
Mon=MonthName(Month(DateTimeNow),true)                                  'VBS
Wscript.Echo "@set DatetMon=" & Mon                                     'VBS
'
Wscript.Echo "@set DatetHH=" & Right(0 & DatePart("h", DateTimeNow), 2) 'VBS
Wscript.Echo "@set DatetMI=" & Right(0 & DatePart("n", DateTimeNow), 2) 'VBS
Wscript.Echo "@set DatetSS=" & Right(0 & DatePart("s", DateTimeNow), 2) 'VBS
