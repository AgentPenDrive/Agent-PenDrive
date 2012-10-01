@echo off & setlocal enableextensions enabledelayedexpansion

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ MAKEPASS.CMD Make a randomized password           ³
echo ³ By Prof. Timo Salmi, Last modified Tue 2-Feb-2010 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

:: Is help asked for
if "%~1"=="?" goto _help
if "%~1"=="/?" goto _help

:: Set your desired password length
set PasswordLength=10

:: The character set to be drawn from
set chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#/()=+-,.;:_*'
rem       0123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456
rem echo %chars%
rem echo 0123456789 123456789 123456789 123456789 123456789 123456789 123456789 1234567

:: Requirements on the password
if "%~1"=="" set MaxChar=76
if "%~1"=="/1" set MaxChar=25
if "%~1"=="/2" set MaxChar=51
if "%~1"=="/3" (
  set MaxChar=61
  set RequireNumber=true
  )
if "%~1"=="/4" (
  set MaxChar=76
  set RequireNumber=true
  set RequireSpecial=true
  )

:: Build the password
:_again
set result_=
for /L %%i in (1,1,%passwordLength%) do (
  call :GetOneRandomChar %MaxChar% rndchr_
  set result_=!result_!!rndchr_!
  )

:: Are the requirements met?
echo %result_%|findstr "[0123456789]">nul
if %errorlevel% EQU 0 set FoundNumber=true
echo %result_%|findstr "[@#/()=+-,.;:_*']">nul
if %errorlevel% EQU 0 set FoundSpecial=true
if defined RequireNumber if not defined FoundNumber goto _again
if defined RequireSpecial if not defined FoundSpecial goto _again

:: Display the resulting random password
echo %result_%
goto _out

:_help
echo Usage: MAKEPASS [/Choice³/?]
echo.
echo /1 only lower-case letters
echo /2 only letters
echo /3 require at least one number
echo /4 require at least one number and one special character
echo None: No preference
goto _out

:_out
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF

:: ============================================================
: GetOneRandomChar MaxChar
setlocal enableextensions enabledelayedexpansion
set /a div_=32767 / %1
set /a rand_=%random% / %div_%
set return_=!chars:~%rand_%,1!
endlocal & set "%2=%return_%" & goto :EOF
