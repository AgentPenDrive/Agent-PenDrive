@echo off & setlocal enableextensions
echo.+----------------------------------------------------+
echo ^| FILEAGE.CMD script to find out how old a file is   ^|
echo ^| By Prof. Timo Salmi, Last modified Tue 2-Feb-2010  ^|
echo +----------------------------------------------------+
echo.
::
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks
::
:: Requires DATE2NUM.EXE from ftp://garbo.uwasa.fi/pc/link/tscmd.zip
:: Test for its availability in the current folder or at path
for %%f in ("DATE2NUM.EXE") do set found_="%%~$PATH:f"
if exist DATE2NUM.EXE set found_="DATE2NUM.EXE"
if [%found_%]==[""] (
  echo DATE2NUM.EXE needed by the script not found
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Usage
if [%1]==[] (
  echo Usage: %0 FileName
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Get the file name but don't allow wildcards
set filename_=%1
echo %filename_%|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo Wildcards not allowed in %filename_%
  goto :EOF)
::
:: Test for LFN peculiarities
if not [%2]==[] (
  echo A file name with spaces in it should be enclosed in parentheses ""
  goto :EOF)
::
:: Test for the file's existence
if not exist %filename_% (
  echo File %filename_% not found
  goto :EOF)
::
:: Use codepage 850 to fix the date format
for /f "tokens=3 delims= " %%p in (
  'mode con: codepage /status ^| find "Code page"') do (
  set store_codepage_=%%p)
mode con: codepage select=850>nul
::
:: Get today's day numer
DATE2NUM /set > "%temp%\FileageTmp.cmd"
for %%c in (call del) do %%c "%temp%\FileageTmp.cmd"
set datenumNow=%datenum_%
::
:: Get the file's information
for %%f in (%filename_%) do (
  set fullname_=%%~ff
  set filedate_=%%~tf
  set filesize_=%%~zf)
echo %filedate_% %filesize_% %fullname_%
::
:: Covert the file's date into a day number
DATE2NUM %filedate_:~0,2% %filedate_:~3,2% %filedate_:~6,4% /set > "%temp%\FileageTmp.cmd"
for %%c in (call del) do %%c "%temp%\FileageTmp.cmd"
set datenumFile=%datenum_%
::
:: Calculate and display the age of the file
set /a fileage_=%datenumNow%-%datenumFile%
echo The file is %fileage_% days old
::
:: Clean up
mode con: codepage select=%store_codepage_%>nul
endlocal & goto :EOF
