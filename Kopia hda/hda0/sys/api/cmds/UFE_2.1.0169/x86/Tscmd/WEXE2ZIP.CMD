@echo off & setlocal enableextensions

echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ WEXE2ZIP.CMD Convert a self-extracting exe into a zip file ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010          ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Use a customizable one-line Zip file comment
set comment_=FTP archives http://garbo.uwasa.fi/ University of Vaasa, Finland

:: Create a working folder for the files to be extracted
set work_=%cd%\wexe2zip
if not exist %work_% mkdir %work_%
if not exist %work_% (
  echo Working folder %work_% could not be created
  echo Are you on a read-only device?
  goto _out)

:: 1. Requires Winzip from http://www.winzip.com/
:: 2. Requires the WZZIP.EXE+WZUNZIP.EXE Command Line Support Add-On.
:: Alternatively, use pkzip or zip. But then you'll have to do
:: some customizing, since there are subtle syntax differences.
:: Also be aware that the alternatives are not as genric for XP as Winzip.
set wzzip_="C:\Program Files\WinZip\WZZIP.EXE"
set wzunzip_="C:\Program Files\WinZip\WZUNZIP.EXE"
if not exist %wzzip_% (
  echo Program %wzzip_% not found
  echo Requires Winzip and the Command Line Support Add-Ons
  goto _out)
if not exist %wzunzip_% (
  echo Program %wzunzip_% not found
  echo Requires Winzip and the Command Line Support Add-Ons
  goto _out)

:: Usage
if "%~1"=="" goto _help
if "%~1"=="?" goto _help
if "%~1"=="/?" goto _help

:: Check that the working folder is empty
set notempty_=
dir %work_% /a 2>&1 | find "File(s)" | find /v " 0 File(s)" > nul
if %errorlevel% EQU 0 set notempty_=true
dir %work_% /a 2>&1 | find "Dir(s)" | find /v " 2 Dir(s)" > nul
if %errorlevel% EQU 0 set notempty_=true
if defined notempty_ (
  dir /w %work_%
  echo.
  echo Working folder %work_% not empty
  goto _out)

:: Check for wildcards
echo %~1|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo No wildcards allowed in the file name "%~1"
  goto _out)

:: Check for an extension
if not "%~n1%~x1"=="%~n1%" (
  echo No extension allowed in the file name "%~1"
  goto _out)

:: Is the source file there
if not exist "%~n1.exe" (
  echo File "%~1.exe" not found in the current folder
  echo Also note, no paths allowed
  goto _out)

:: Is the target file already there
if exist "%~n1.zip" (
  echo File "%~1.zip" already found in the current folder
  goto _out)

:: Test the supposedly self-extracting .exe
%wzunzip_% -t "%~n1.exe"
if %errorlevel% GTR 0 goto _out

:: Unzip recreating the folder structure and then zip
%wzunzip_% -d "%~n1.exe" %work_%
%wzzip_% -mpro "%~n1" "%work_%\*.*"
echo %comment_%|%wzzip_% -zo "%~n1"
%wzzip_% -v "%~n1"
echo.
dir "%~n1.*" | find /i "%~n1"
goto _out

:_help
echo Usage: EXE2ZIP [FileBaseName]  ^(No path, no extension^)
goto _out

:_out
if defined work_ if exist %work_% rmdir %work_%
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
