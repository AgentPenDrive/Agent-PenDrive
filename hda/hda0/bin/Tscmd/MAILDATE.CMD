@echo off & setlocal enableextensions enabledelayedexpansion

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Should be run from the command line
if not [%cmdbox%]==[true] if not "%USERNAME%"=="ts" (
  echo.
  echo To be run only in Timo's customized command box
  echo If you get this message on the command line, do either of the following:
  echo  1^) Omit the source block "Should be run from the command line".
  echo  2^) Set cmdbox=true on the command line.
  echo     For more on 2 see TSCMD.ZIP item #3 in 1CMDFAQ.TXT
  echo.
  pause
  goto :EOF)

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ MAILDATE.CMD Build a message's "From" header    ³
echo ³ By Prof. Timo Salmi, http://lipas.uwasa.fi/~ts/ ³
echo ³ Last modified Tue 2-Feb-2010                    ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

:: Help
set wanthelp_=
if "%~1"=="?" set wanthelp_=true
if "%~1"=="/?" set wanthelp_=true
if /i "%~1"=="/help" set wanthelp_=true
if defined wanthelp_ (
  echo This script forms the beginning "From" line of an email message
  echo header. It is based on the "From: " and the "Date: " header fields.
  echo The information can be needed since sometimes the beginning "From"
  echo header is broken or missing altogether. The script is not perfect,
  echo but it should be able to handle the most common situations.
  echo The SED.EXE third party program is needed to use this script.
  echo.
  echo Usage: MAILDATE [EmailOrNewsFileName] [/S[UBJ]]
  echo        The primary default FileName is C:\_M\mail.txt
  echo        The secondary default is C:\_M\mail.eml
  echo.
  echo        The /S[UBJ] switch includes the subject with the date added.
  echo        Note: Subjects with the poison characters may cause errors
  goto _out)

:: Test for the availability of SED.EXE in the current folder or at path
set found_=
for %%f in ("SED.EXE") do set found_="%%~$PATH:f"
if exist SED.EXE set found_="SED.EXE"
if [%found_%]==[""] (
  echo SED.EXE needed by the script not found at path
  echo.
  echo If you do not have it, get it for example from
  echo   20368 Oct 1 1991 ftp://garbo.uwasa.fi/pc/unix/sed15x.zip
  echo   HHSED executable, E.Raymond+D.Kirschbaum+H.Helman
  echo  or
  echo   878915 Oct 25 2003 ftp://garbo.uwasa.fi/win95/unix/UnxUpdates.zip
  echo   UnxUpdates.zip Updates for UnxUtils GNU utilities for native Win32
  goto _out)

:: Parse the command line
set includeSubject_=
if /i "%~1"=="/subj" set includeSubject_=true
if /i "%~1"=="/s" set includeSubject_=true
if not defined includeSubject_ set par1_=%~1
if /i "%~2"=="/subj" (
  set par1_=%~1
  set includeSubject_=true
  )
if /i "%~2"=="/s" (
  set par1_=%~1
  set includeSubject_=true
  )

:: Get the source filename. You should customize the default to fit yours.
if "%par1_%"=="" (
  set source_=C:\_M\mail.txt
  ) else (
  set source_=%par1_%)

:: The secondary default. You should customize to fit yours.
if "%par1_%"=="" if not exist C:\_M\mail.txt set source_=C:\_M\mail.eml

:: For debugging
rem echo par1_=%par1_%
rem echo includeSubject=%includeSubject_%

:: Test for source existence
if "%par1_%"=="" if not exist "%source_%" (
  echo Exiting: Neither default source found
  echo C:\_M\mail.txt C:\_M\mail.eml
  echo.
  echo For usage: MAILDATE /?
  goto _out)
if not exist "%source_%" (
  echo Exiting: File "%source_%" not found
  echo.
  echo For usage: MAILDATE /?
  goto _out)

:: Get the first "Date: " line
set s_=
set count_=
for /f "tokens=* delims=" %%a in (
  'findstr /b /c:"Date: " "%source_%"') do (
  set s1_=%%a
  set /a count_+=1
  if !count_! EQU 1 set s_=!s1_!)

:: Was a "Date: " line found in the email?
if not defined s_ (
  echo No "Date: " line found in "%source_%"
  goto _out)

:: Display the fields
findstr /b /c:"From: " "%source_%"|sed -n 1p
echo %s_%
echo.

:: Parse the "Date: " line
for /f "tokens=1-6 delims=, " %%a in ('echo "%s_%"') do (
  set wd_=%%b
  set mm_=%%d
  set dd_=%%c
  set tt_=%%f
  set yy_=%%e
  )

:: Process the day number
if [%dd_:~0,1%]==[0] set dd_=%dd_:~1,1%
set d1_=%dd_:~1,1%
if not defined d1_ set dd_= %dd_%

:: Get the first "From: " line
set s_=
set count_=
for /f "tokens=* delims=" %%a in (
  'findstr /b /c:"From: " "%source_%"^|sed -e "s/</:/g" -e "s/>//g"') do (
  set s1_=%%a
  set /a count_+=1
  if !count_! EQU 1 set s_=!s1_!)

:: Test for parentheses
set parenth_=
echo %s_%|find "(">nul
if %errorlevel% EQU 0 set parenth_=true

:: Parse the "From: " line
set email_=
if defined parenth_ (
  for /f "tokens=1-3 delims=:() " %%a in ('echo "%s_%"') do (
    set email_=%%b)
    ) else (
  for /f "tokens=1-3 delims=:" %%a in ('echo "%s_%"') do (
    set email_=%%c
    if not defined email_ set email_=%%b
    )
  )

:: Remove potential quotes
if defined email_ set email_=%email_:"=%
if defined email_ set email_=%email_: =%
if defined wd_ set wd_=%wd_:"=%
if defined mm_ set mm_=%mm_:"=%
if defined dd_ set dd_=%dd_:"=%
if defined tt_ set tt_=%tt_:"=%
if defined yy_ set yy_=%yy_:"=%

:: Test for the weekday lest it is missing in the original message
set wdok_=
for %%w in (Mon Tue Wed Thu Fri Sat Sun) do (
  if /i [%wd_%]==[%%w] set wdok_=true
  )
if not defined wdok_ (
  echo Warning: The original message's Date: header is deficient.
  echo The format should be for example Date: Sun, 09 Oct 2005 09:28:29
  echo The weekday is missing, or %wd_% is otherwise faulty.
  echo The constructed From header below will be incorrect.
  echo.
  )

:: Test for the month, also get is number
set mmok_=
set count_=
for %%w in (Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) do (
  set /a count_+=1
  if /i [%mm_%]==[%%w] (
    set mmok_=true
    set mmnum_=!count_!
    )
  )
if defined wdok_ if not defined mmok_ (
  echo Warning: The original message's Date: header is deficient.
  echo The month field %mm_% is faulty or misplaced.
  echo The constructed From header below is likely to be incorrect.
  echo.
  )

:: Check for the email address
echo. %email_%|find "@">nul
if %errorlevel% GTR 0 (
  echo Warning: Was not able to extract a valid email address.
  echo The expected address formats for the original message are
  echo   Timo Salmi ^<ts@uwasa.fi^>
  echo   ts@uwasa.fi ^(Timo Salmi^)
  echo   ts@uwasa.fi
  echo.
)

:: Display the date result
echo From %email_%  %wd_% %mm_% %dd_% %tt_% %yy_%

::
:: Also process the subject line?
if not defined includeSubject_ goto _out

:: Get the (first) subject, if any
set s_=
set count_=
for /f "tokens=* delims=" %%a in (
  'findstr /b /c:"Subject: " "%source_%"') do (
  set s1_=%%a
  set /a count_+=1
  if !count_! EQU 1 set s_=!s1_!)

:: Was a "Subject: " line found in the email?
if not defined s_ (
  echo No "Subject: " line found in "%source_%"
  goto _out)

::
:: Remove the potential leading space
if defined dd_ set dd_=%dd_: =%

::
:: Display the subject by dropping "Subject: "
echo.
echo %s_%|sed -e ^"s/^^Subject: /Subject: [%yy_%] /^"

:: Display the subject result with date augmented
echo %s_% ^(%dd_%.%mmnum_%.%yy_%^)

:: Again display the subject with a third formulation
set mmnum0_=0%mmnum_%
set mmnum0_=%mmnum0_:~-2%
set dd0_=0%dd_%
set dd0_=%dd0_:~-2%
echo %s_%|sed -e ^"s/^^Subject: /Subject: %yy_%%mmnum0_%%dd0_% /^"

:_out
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
