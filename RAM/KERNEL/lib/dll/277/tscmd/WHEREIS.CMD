@echo off & setlocal enableextensions disabledelayedexpansion
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ WHEREIS.CMD, A script to locate files ³
echo ³ By Prof. Timo Salmi Tue 2-Feb-2010    ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Is help needed
if not "%~1"=="" if not "%~1"=="/?" goto _testlfn
echo.
echo Usage: %~n0 [FileMask] [/a] [/m] [/s]
echo.
echo  /a show All files, including hidden
echo  /m pipe to More
echo  /s Sort by date
echo.
echo E.g. %~n0 *.XLS /s /m
if not defined cmdbox if defined PauseIfFromDesktop pause
goto :EOF

:_testlfn
:: Test for LFN peculiarities
if /i not [%2]==[/a] if /i not [%2]==[/m] if /i not [%2]==[/s] if not [%2]==[] (
  echo A file name with spaces in it should be enclosed in parentheses ""
  goto :EOF)

:: Allow an alternative temp folder
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
:: The path to temp in the short format
for /f "tokens=*" %%f in ("%temp_%") do set temp_=%%~sf
if not exist %temp_% (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto :EOF
  )

:: Avoid multiple calls of the script
if exist "%temp_%\whereisLockfile.tmp" (
  echo An instance of WHEREIS.CMD already is running
  echo If this is in error delete the lockfile
  echo "%temp_%\whereisLockfile.tmp"
  goto :EOF
  )
echo Lockfile "%temp_%\whereisLockfile.tmp" for WHEREIS.CMD>"%temp_%\whereisLockfile.tmp"

:: Don't automatically accept a *.* mask
:_temp
if not [%1]==[*.*] goto _browse
echo.
echo Using *.* as the FileMask will produce a HUGE AMOUNT of output!
echo.
:_ask
set ask_=
set /p ask_=Are you absolutely sure you want to do this [y/N]?
if "%ask_%"=="" goto _clean
if /i "%ask_%"=="n" goto _clean
if /i not "%ask_%"=="y" if /i not "%ask_%"=="yes" goto _ask

:: Next step
:_browse
:: Not a necessary, but a prudent habit
set ask_=

:: Allow for the possibility of including also the hidden files
for %%v in (hidden_ sort_ more_) do set %%v=
if /i [%2]==[/a] set hidden_=/a
if /i [%3]==[/a] set hidden_=/a
if /i [%4]==[/a] set hidden_=/a

:: Remove any old auxiliary output file
for %%f in (%temp_%\whereis.$$$) do if exist %%f del %%f

:: Go and find the files, call the subroutine for each of them
for /f "tokens=1 delims=" %%c in ('dir /s /b %hidden_% "C:\%~1"') do (
  call :ProcOnefile "%%c")

:: Choose display format
if not exist %temp_%\whereis.$$$ goto _clean
if /i [%2]==[/s] set sort_=true
if /i [%3]==[/s] set sort_=true
if /i [%4]==[/s] set sort_=true
if /i [%2]==[/m] set more_=true
if /i [%3]==[/m] set more_=true
if /i [%4]==[/m] set more_=true
if /i [%sort_%]==[true] (
  if /i [%more_%]==[true] (
    type %temp_%\whereis.$$$ | sort | more
    ) else (
    type %temp_%\whereis.$$$ | sort
    )
  ) else (
  if /i [%more_%]==[true] (
    type %temp_%\whereis.$$$ | more
    ) else (
    type %temp_%\whereis.$$$
    )
  )

:: Clean up
:_clean
for %%f in (%temp_%\whereis.$$$) do if exist %%f del %%f
for %%f in ("%temp_%\whereisLockfile.tmp") do if exist "%%f" del "%%f"
endlocal & goto :EOF

::==================================================================
:ProcOnefile arg1
setlocal enableextensions
  rem set fullname_=%~f1
  set date_=%~t1
  set time_=%date_:~11,5%
  set date_=%date_:~6,4%.%date_:~3,2%.%date_:~0,2%
  set attr_=%~a1
  set size_=%~z1
  call :FuncRightJustify %size_% rightJustifiedSize_
  echo %date_% %time_% %attr_% %rightJustifiedSize_% "%~f1" >>%temp_%\whereis.$$$
Goto :EOF

::==================================================================
:FuncRightJustify arg1 arg2
setlocal enableextensions
  set number_=            %1
  set number_=%number_:~-12%
endlocal & set "%2=%number_%" & Goto :EOF
