@echo off & setlocal enableextensions enabledelayedexpansion
if /i "%~1"=="/b" goto _getname
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ TSCD.CMD Show a folder name both in short and long formats ³
echo ³ By prof. Timo Salmi, Last modified Tue 2-Feb-2010          ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem An Important warning: Do not associate with "File Folder", "Folder"
rem or "Drive" types! If you do and do not know how exactly to handle it,
rem clicking a folder will invoke "search" instead of the folder making
rem the Windows Explorer and thus your system practically non-usable.
rem
rem For more information on that warning see e.g.
rem  http://support.microsoft.com/default.aspx?scid=kb;en-us;Q321186
rem  http://www.tomshardware.co.uk/forum/85531-35-double-click-folder-search-opens
rem  http://www.kellys-korner-xp.com/xp_tweaks.htm
rem  http://www.pcworld.com/article/id,126116-page,1-c,maintenancemanagement/article.html
rem

:: Help
if not "%~1"=="?" if not "%~1"=="/?" goto _getname
echo.
echo Usage: TSCD [/B] ["FolderName"]
echo               À Bare, no caption
echo.
echo Utilizes ECHOC.EXE to print in colors, if available at path.
echo.
echo Assumes the current folder name if none is given.
goto _out

:: Get the name of the current or the given folder
:_getname
set name=%cd%
if not "%~1"=="" if /i not "%~1"=="/b" set name=%~1
if not "%~2"=="" if /i "%~1"=="/b" set name=%~2
if not exist "%name%" (
  echo.
  echo "%name%"
  echo Not found
  goto _out)

:: Parse the path elements
set count_=0
set rest_=%name%
:_loop
for /f "tokens=1* delims=\" %%a in ("%rest_%") do (
  set /a count_+=1
  set part[!count_!]=%%a
  set rest_=%%b
  if defined rest_ goto _loop
  )

:: Display the individual parts
if defined debug (
  for /l %%i in (1,1,%count_%) do (
    echo part[%%i]=!part[%%i]!
    )
  echo.
  )

:: Build up the path
for /l %%i in (1,1,%count_%) do (
  set longpath_=!longpath_!!part[%%i]!\
  if %%i GTR 1 (
    for /f "tokens=* delims=" %%f in (
      'attrib "!longpath_:~0,-1!"') do (
      set longpath_=%%f
      set longpath_=!longpath_:~11!\
      )
    if defined debug echo !longpath_!
    )
  )
set longpath_=%longpath_:~0,-1%

:: Test for the presence of the ECHOC.EXE program
set echoc_=ECHOC.EXE
for %%f in ("%echoc_%") do set prog_=%%~$PATH:f
if exist %echoc_% set prog_=%echoc_%

:: Display the result
echo.
for %%f in ("%longpath_%") do set shortpath_=%%~sf
if not defined prog_ (
  echo %shortpath_%
  echo %longpath_%
  ) else (
  echoc 0 14 %shortpath_%
  echo.
  echoc 0 14 %longpath_%
  echo.
  echo %name%|findstr /C:"  ">nul
  if !errorlevel! EQU 0 (
    echo Warning: ECHOC color output can't handle multiple spaces in long names
    )
  )
goto _out

:_out
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
