@echo off & setlocal enableextensions enabledelayedexpansion

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ SAMENAME.CMD Scan folders for files with the same name ³
echo ³ By Prof. Timo Salmi. Last modified Tue 2-Feb-2010      ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
rem  Includes subfolders, if any, in the search

:: Usage
if "%~2"=="" (
  echo Usage %~0 "Folder1" "Folder2"
  echo.
  echo For example:
  echo  SAMENAME C:\_D\BAS D:
  echo  Note: no trailing backslash for the root
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)

:: Temporary files
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
:: The path to temp in the short format
for /f "tokens=*" %%f in ("%temp_%") do set temp_=%%~sf

:: Avoid multiple calls of the script
if exist "%temp_%\samenameLockfile.tmp" (
  echo An instance of SAMENAME.CMD already is running
  echo If this is in error delete the lockfile
  echo "%temp_%\samenameLockfile.tmp"
  goto :EOF
  )
echo Lockfile "%temp_%\samenameLockfile.tmp" for SAMENAME.CMD>"%temp_%\samenameLockfile.tmp"

:: More temporary files
if not exist %temp_% (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto _out
  )
set tempfil1_="%temp_%\samefil1.$$$"
set tempfil2_="%temp_%\samefil2.$$$"
for %%f in (%tempfil1_% %tempfil2_%) do if exist %%f del %%f

:: Get the folders from the command line
set folder1_=%~1
set folder2_=%~2
if not exist "%folder1_%" (
  echo Folder "%folder1_%" not found
  goto _out)
if not exist "%folder2_%" (
  echo Folder "%folder2_%" not found
  goto _out)

:: Make directory listings for both the folders and their subfolders
for /f "delims=" %%f in ('dir /a:-d /b /o:n /s "%folder1_%\*.*"') do (
   echo %%~nf%%~xf,%%~tf,%%~zf,%%~dpf>>%tempfil1_%
   )
for /f "delims=" %%f in ('dir /a:-d /b /o:n /s "%folder2_%\*.*"') do (
   echo %%~nf%%~xf,%%~tf,%%~zf,%%~dpf>>%tempfil1_%
   )

:: Sort in order to merge the results
sort %tempfil1_%>%tempfil2_%

:: Display only if the filename repeats, i.e. skip the "lonely" files
for /f "tokens=1-4 delims=," %%a in ('type %tempfil2_%') do (
  if "!preva_!"=="%%a" (
    set same_=true
    if not "!prevb_!"=="%%b" set same_=false
    if not "!prevc_!"=="%%c" set same_=false
    if "!same_!"=="true" (
      echo !preva_! !prevb_! !prevc_! !prevd_!
      ) else (
      echo * !preva_! !prevb_! !prevc_! !prevd_! ^(differs^))
    echo %%a %%b %%c %%d
    )
  set preva_=%%a
  set prevb_=%%b
  set prevc_=%%c
  set prevd_=%%d
)

:: Clean up
:_out
for %%f in (%tempfil1_% %tempfil2_%) do if exist %%f del %%f
for %%f in ("%temp_%\samenameLockfile.tmp") do if exist %%f del %%f
endlocal & goto :EOF
