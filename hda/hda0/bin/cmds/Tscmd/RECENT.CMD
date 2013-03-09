@echo off & setlocal enableextensions

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem Search your folders for recent files. The default is today.
rem For more information see TSCMDINF.TXT
rem Be patient. The method is not fast.

:: Usage information
set help=
if [%1]==[?] set help=true
if [%1]==[/?] set help=true
if [%help%]==[true] (
  echo.
  echo ษอออออออออออออออออออออออออออออออออออป
  echo บ A CMD shell for RECENT.VBS        บ
  echo บ By Prof. Timo Salmi ^(c^) 2004-2010 บ
  echo บ Last modified Sat 2-Oct-2010      บ
  echo ศอออออออออออออออออออออออออออออออออออผ
  echo.
  echo Usage:
  echo   %~f0 [DaysBack] [FromTime] [Exact]
  echo   E.g. %~f0 1 150000
  echo   For more usage information see TSCMDINF.TXT
  echo   First customize the directory paths after the label:
  echo    "Call the actual VBS script"
  goto :EOF)

:: Avoid multiple calls of the script
if exist "%temp%\recentLockfile.tmp" (
  echo An instance of RECENT.CMD already is running
  echo If this is in error delete the lockfile
  echo "%temp%\recentLockfile.tmp"
  goto _out2
  )
echo Lockfile "%temp%\recentLockfile.tmp" for RECENT.CMD>"%temp%\recentLockfile.tmp"

:: Test for the presence of the VBS script
set vbs_=RECENT.VBS
for %%f in ("%vbs_%") do set prog_="%%~$PATH:f"
if exist %vbs_% set prog_="%vbs_%"
if [%prog_%]==[""] (
  echo.
  echo %vbs_% not found in the current folder or at path
  echo Exiting %~f0
  goto _out)

:: Ask for permission to run
:_ask
set ask_=
set /p ask_="This may take time. Are you sure [Y/n]?"
if /i "%ask_%"=="n" goto _out
if not "%ask_%"=="" if /i not "%ask_%"=="y" goto _ask

:_set
if [%1]==[] (
  set DaysBack=0
  ) else (
  set DaysBack=%1)

if [%2]==[] (
  set FromTime=000000
  ) else (
  set FromTime=%2)

if /i [%3]==[Exact] set Exact=Exact

:: Call the actual VBS script
cscript //nologo %prog_% "C:\_D" %DaysBack% %FromTime% %Exact% > "%temp%\recent.tmp"
cscript //nologo %prog_% "C:\_E" %DaysBack% %FromTime% %Exact% >>"%temp%\recent.tmp"
cscript //nologo %prog_% "C:\_F" %DaysBack% %FromTime% %Exact% >>"%temp%\recent.tmp"
cscript //nologo %prog_% "C:\_G" %DaysBack% %FromTime% %Exact% >>"%temp%\recent.tmp"
cscript //nologo %prog_% "C:\_H" %DaysBack% %FromTime% %Exact% >>"%temp%\recent.tmp"
cscript //nologo %prog_% "C:\_L\TIMO" %DaysBack% %FromTime% %Exact% >>"%temp%\recent.tmp"

:_sort
sort "%temp%\recent.tmp" | more

:_out
for %%f in ("%temp%\recent.tmp" "%temp%\recentLockfile.tmp") do if exist "%%f" del "%%f"

:_out2
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
