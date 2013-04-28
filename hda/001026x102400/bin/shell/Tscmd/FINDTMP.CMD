@echo off & setlocal enableextensions enabledelayedexpansion

set ext_=TMP

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ FINDTMP.CMD Find and list all the *.%ext_% files      ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Avoid multiple calls of the script
if exist "%temp%\findtmpLockfile.tmp" (
  echo An instance of FINDTMP.CMD already is running
  echo If this is in error delete the lockfile
  echo "%temp%\findtmpLockfile.tmp"
  goto _out2
  )
echo Lockfile "%temp%\findtmpLockfile.tmp" for FINDTMP.CMD>"%temp%\findtmpLockfile.tmp"

:: Get help
if "%~1"=="?" goto _help
if "%~1"=="/?" goto _help

:: Switches
if /i "%~1"=="/d" set datesort_=true
if /i "%~1"=="/z" set sizesort_=true

:: Your action performed on the result list. Customize as needed.
:: Be careful about what you do. It is your own risk and your risk only.
set action_=echo Whatever

:: It is also possible to give e.g. size limits for the files
:: which are chosen as the targets of the actions. The same
:: could naturally be done with dates.
set minsize_=0
set maxsize_=999999999999

:: The targets. Customize as needed.
set base_=C:
set targfold_=C:\_M
if not exist "%targfold_%\" (
  echo The target folder "%targfold_% not found
  echo Customize the target folder line in the script
  echo set targfold_=Whatever
  goto _out)
set target1_=%targfold_%\findtmp1.dat
set target2_=%targfold_%\findtmp2.dat
set target3_=%targfold_%\myaction.cmd
for %%f in ("%target1_%" "%target2_%") do if exist %%f del %%f

:: Choice of the list program
set listprog=more
if defined pcid_ set listprog=C:\_F\TOOLS\LIST.COM
if "%pcid_%"=="tscd" set listprog=list91k

:: The process if the /B bare switch is on
if /i not "%~1"=="/b" goto _notb
echo Looking for your .%ext_% files
echo Please wait ... this might take awhile
echo.
set count_=0
echo @echo off>"%target3_%"
for /f "tokens=*" %%f in ('
  dir /s /b "%base_%\*.%ext_%"') do (
  set /a count_+=1
  set fname_=%%~ff
  set fsize_=%%~zf
  if !fsize_! GEQ %minsize_% if !fsize_! LEQ %maxsize_% (
    echo %action_% "!fname_!"
    )
  )>>"%target3_%"
dir "%target3_%"|find /i " Directory of "
dir "%target3_%"|find /i " myaction.cmd"
echo %count_% action lines
echo.
echo Think twice before you run the resultant CLI file.
echo You do it at your own discretion and risk.
goto _out

:: The process if the /B switch is not on
:: Locate the files and get their attributes
:: The file date/time stamp order is locale dependent
:_notb
echo Looking for your .%ext_% files
echo Please wait ... this might take awhile
echo.
set count_=0
for /f "tokens=*" %%f in ('
  dir /s /b "%base_%\*.%ext_%"') do (
  set /a count_+=1
  set fname_=%%~ff
  set fdate_=%%~tf
  set frevdate_=!fdate_:~6,4!.!fdate_:~3,2!.!fdate_:~0,2!
  set ftime_=!fdate_:~11,2!:!fdate_:~14,2!
  set fsize_=         %%~zf
  set fsize_=!fsize_:~-10!
  if !fsize_! GEQ %minsize_% if !fsize_! LEQ %maxsize_% (
    echo !fsize_! !frevdate_! !ftime_! !fname_!
    )
  )>>"%target1_%"

:: Process the results
if defined datesort_ sort /+11 "%target1_%">"%target2_%"
if defined sizesort_ sort "%target1_%">"%target2_%"
if not defined datesort_ if not defined sizesort_  type "%target1_%">"%target2_%"
if defined pcid_ (
  %listprog% %target2_%
  ) else (
  %listprog% "%target2_%"
  )
echo Found %count_% files
goto _out

:: The help
:_help
echo Usage: FINDTMP [/B³/D³/Z]
echo                  ³  ³  ÀÄ sort by siZe
echo                  ³  ÀÄ A list sorted by Date/time
echo                  ÀÄ Just a bare list ready to perform your action
echo.
echo Lists all the *.%ext_% files sorted by the files' date/time stamps.
echo A file date/time stamp default order DD.MM.YYYY HH:MI is required.
echo If your locale's default differs, you'll have to customize.
echo.
echo Consider this a demonstration you can build on to do your own bidding.
goto _out

:: Clean up
:_out
for %%f in ("%target1_%" "%target2_%") do if exist "%%f" del "%%f"
for %%f in ("%temp%\findtmpLockfile.tmp") do if exist "%%f" del "%%f"
:_out2
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
