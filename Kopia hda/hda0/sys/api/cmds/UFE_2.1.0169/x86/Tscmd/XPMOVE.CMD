@echo off & setlocal enableextensions

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Test for the presence of the VBS script
for %%f in ("XPMOVE.VBS") do set prog_="%%~$PATH:f"
if exist XPMOVE.VBS set prog_="XPMOVE.VBS"
if [%prog_%]==[""] (
  echo.
  echo XPMOVE.VBS not found in the current folder or at path
  echo Exiting %~f0
  goto :EOF)

:: Usage information
set help=
if [%1]==[] set help=true
if [%1]==[?] set help=true
if [%1]==[/?] set help=true
if [%help%]==[true] (
  echo.
  echo ษอออออออออออออออออออออออออออออออออออป
  echo บ A CMD shell for XPMOVE.VBS        บ
  echo บ By Prof. Timo Salmi ^(c^) 2004-2009 บ
  echo บ Last modified Tue 2-Feb-2010      บ
  echo ศอออออออออออออออออออออออออออออออออออผ
  echo.
  echo Moves files from FromFolder to ToFolder if an older file with the
  echo same name is found in the ToFolder
  echo.
  echo Before usage, customize the paths in the cscript call as befits you.
  echo.
  echo Warning: Moving files always involves some danger.
  echo          All the risks are carried by the user alone!
  echo          DON'T USE UNLESS YOU KNOW WHAT YOU ARE DOING
  echo.
  echo          Actually, I recommend against using this script.
  echo          A much safer way is to use a sequence like
  echo           ATTRIB +a "SourceDir/*.*"
  echo           XCOPY /v /d /m /-y "SourceDir/*.*" "TargetDir/"
  echo           DEL /a:-a /p "SourceDir/*.*"
  echo.
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)

:: Selectively call the actual VBS script. Customize!
cscript //nologo %prog_% C:\_M C:\_M\TEMP
rem cscript //nologo %prog_% C:\_M C:\_D
rem cscript //nologo %prog_% C:\_M C:\_E /sub:no

endlocal & goto :EOF
