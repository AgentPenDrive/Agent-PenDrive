@echo off & setlocal enableextensions
::
:: The caption
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ WAKEUP.CMD a trivial reminder desktop alarm clock ³
echo ³ By Prof. Timo Salmi                               ³
echo ³ Last modified Tue 2-Feb-2010                      ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

::
:: Check the usage syntax + help
set usage_=
if "%~1"=="" set usage_=show
if "%~1"=="?" set usage_=show
if "%~1"=="/?" set usage_=show
::
echo.%~1|find ":">nul
if %errorlevel% GTR 0 set usage_=show
echo.%~1|findstr "[^0-9:]">nul
if %errorlevel% EQU 0 set usage_=show
echo.%~1|findstr "[0-9]$">nul
if %errorlevel% EQU 1 set usage_=show
::
if not "%~3"=="" set usage_=show
::
if defined usage_ (
  echo.
  echo Usage: %~f0 [HH:MM] ["Message in quotes"]
  echo Only cursory syntax error checking
  echo %~f0 utilizes the AT command scheduling
  echo For information on AT apply AT /?
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Build a Visual Basic Script
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
:: The path to temp in the short format
for /f "tokens=*" %%f in ("%temp_%") do set temp_=%%~sf
if not exist %temp_% (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto :EOF
  )
set rnd_=%RANDOM%
set vbs_=%temp_%\wakeup.%rnd_%.vbs
::
echo Dim WshShell, fso, MyMessage, hh, mm, s                                    >"%vbs_%"
if "%~2"=="" (
  echo MyMessage = "Time to wake up"                                           >>"%vbs_%"
  ) else (
  echo MyMessage = "%~2"                                                       >>"%vbs_%"
  )
echo Set WshShell = WScript.CreateObject("WScript.Shell")                      >>"%vbs_%"
echo Set fso = CreateObject("Scripting.FileSystemObject")                      >>"%vbs_%"
echo for i = 1 to 3                                                            >>"%vbs_%"
echo   WshShell.Run "sndrec32 /play /close C:\WINDOWS\Media\tada.wav", 2, true >>"%vbs_%"
echo Next                                                                      >>"%vbs_%"
echo MyTime = Now                                                              >>"%vbs_%"
echo hh = Hour(Mytime)                                                         >>"%vbs_%"
echo mm = Minute(MyTime)                                                       >>"%vbs_%"
echo If mm ^< 10 Then : mm = "0" ^& mm : End If                                >>"%vbs_%"
echo s = hh ^& ":" ^& mm ^& vbCrLf ^& vbCrLf                                   >>"%vbs_%"
echo s = s ^& MyMessage                                                        >>"%vbs_%"
echo WScript.Echo s                                                            >>"%vbs_%"
echo fso.DeleteFile("%vbs_%")                                                  >>"%vbs_%"

::
:: Run the built Visual Basic Script with scheduling
at %1 /interactive "%vbs_%"
at
endlocal & goto :EOF
