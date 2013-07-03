@echo off & setlocal enableextensions

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem A CMD shell for FILEINFO.VBS
rem By Prof. Timo Salmi
rem Last modified Tue 2-Feb-2010

rem   Gets information about a file's properties. For example
rem    C:\_D\TEST\CMDFAQ.CMD
rem    Size:          215
rem    Attributes:    A
rem    Created:       03.12.2004 20:59:50    150 days ago
rem    Last modified: 01.05.2005 08:08:06      1 days ago
rem    Last accessed: 01.05.2005 11:16:18      1 days ago

:: Test for the presence of the VBS script at path for current folder
:: or at a customizable special location
set vbs_=FILEINFO.VBS
for %%f in ("%vbs_%") do set prog_="%%~$PATH:f"
if exist %vbs_% set prog_="%vbs_%"
if [%prog_%]==[""] if exist C:\_F\XTOOLS\FILEINFO.VBS set prog_="C:\_F\XTOOLS\FILEINFO.VBS"
if [%prog_%]==[""] (
  echo.
  echo %vbs_% not found in the current folder or at path
  echo Exiting %~f0
  goto _out)

:: Usage
if "%~1"=="" (
  echo.
  echo Usage: %~f0 FileName
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto _out)

:: Don't allow ampersands (&)
echo "%~1"|findstr "[&]">nul
if %errorlevel% EQU 0 (
  echo "%~1"
  echo Names with ampersands are not acceptable in this script
  echo exiting %~0
  goto _out)

:: Don't allow wildcards
echo "%1"|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo Wildcards are not allowed in the filename %1
  goto _out)

:: Test for LFN peculiarities
if not [%2]==[] (
  echo A file name with spaces in it should be enclosed in parentheses ""
  goto _out)

:: Call the actual VBS script
cscript //nologo %prog_% %1

:: Also get the file owner information
if exist "%~1" dir /q /-c %1|findstr /i /c:"%~nx1" ^
  |findstr /v /c:" Directory of"|findstr /v /c:" File(s) "|findstr /v /c:" Dir(s) "

:_out
if not defined cmdbox if defined PauseIfFromDesktop (echo. & pause)
endlocal & goto :EOF
