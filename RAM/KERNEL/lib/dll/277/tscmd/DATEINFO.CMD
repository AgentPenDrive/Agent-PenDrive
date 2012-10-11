@echo off & setlocal enableextensions
echo.+-------------------------------------------------------+
echo ^| DATEINFO.CMD to display some date related information ^|
echo ^| By Prof. Timo Salmi, Last modified Tue 2-Feb-2010     ^|
echo +-------------------------------------------------------+
echo.
::
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
::
rem Does not require any third-party programs unlike EDATE.CMD
rem
rem Assumes the date format DD.MM.YYYY - Else customize
rem To check, see if "DATEINFO 0" produces the current date.
rem Convention: Weeks start on Mondays
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks
::
:: The date separator in input
set separator_=.
::
:: The parameters
set p1=%~1
set p2=%~2
set p3=%~3
::
:: Is help asked for
set help_=
if "%p1%"=="?" set help_=true
if "%p1%"=="/?" set help_=true
if "%p1%"=="" set help_=true
if "%p3%"=="" if not "%p2%"=="" set help_=true
if defined help_ goto _help
::
:: Make a weak date compatibility check
for /f %%d in ('date /t') do set date_=%%d
echo %date_%|find "%separator_%">nul
if %errorlevel% GTR 0 goto _customize
echo %date_%|find /i "am">nul
if %errorlevel% EQU 0 goto _customize
echo %date_%|find /i "pm">nul
if %errorlevel% EQU 0 goto _customize
::
echo.%p1%|find "%separator_%">nul
if %errorlevel% GTR 0 goto _noparse
::
:: Parse
for /f "tokens=1-3 delims=%separator_%" %%p in ('echo.%~1') do (
  set p1=%%p
  set p2=%%q
  set p3=%%r
  )
::
:_help
if defined help_ (
  echo Usage: %~0 DD MM YYYY
  echo     or %~0 DD%separator_%MM%separator_%YYYY
  echo     or %~0 DaysBackwards
  echo.
  echo Check:
  date /t
  echo DD%separator_%MM%separator_%YYYY
  echo If the above does not tally, you'll have to customize the script
  echo to correspond to your own date localization.
  echo.
  echo A tip: For today's information use
  echo  %~0 0
  goto _out
  )
::
:: Check the format of the first parameter
:_noparse
if %p1% GEQ 0 (set param1=%p1%) else (set /a param1=-%p1%)
call :ParamCheck %param1% error_
if not "%p3%"=="" if %p1% LEQ 0 set error_=true
if defined error_ (
  echo Error in parameter %p1%
  echo.
  set help_=true
  goto _help
  )
if "%p3%"=="" goto _getoday
::
:: Check the format of the second parameter
call :ParamCheck %p2% error_
if %p2% LEQ 0 set error_=true
if defined error_ (
  echo Error in parameter %p2%
  echo.
  set help_=true
  goto _help
  )
::
:: Check the format of the third parameter
call :ParamCheck %p3% error_
if %p3% LEQ 0 set error_=true
if defined error_ (
  echo Error in parameter %p3%
  echo.
  set help_=true
  goto _help
  )
::
:: Get today's date elements
:_getoday
for /f "tokens=1-3 delims=./-" %%f in ('echo %date_%') do (
  set today_=%%h%%g%%f
  set dayNow=%%f
  set monthNow=%%g
  set yearNow=%%h)
:: Omit the leading zeros and trailing spaces
for /f "tokens=* delims=0" %%a in ('echo %dayNow%') do set dayNow=%%a
for /f "tokens=* delims=0" %%a in ('echo %monthNow%') do set monthNow=%%a
set yearNow=%yearNow:~0,4%
::
:: Case of three parameters: Get the target date
if "%p3%"=="" goto _oneParameter
set day=%p1%
set month=%p2%
set year=%p3%
for /f "tokens=* delims=0" %%a in ('echo %day%')   do set day=%%a
for /f "tokens=* delims=0" %%a in ('echo %month%') do set month=%%a
for /f "tokens=* delims=0" %%a in ('echo %year%')  do set year=%%a
goto _threeParameters
::
:: Case of one parameter: Get the number of days to go back
:_oneParameter
set DaysBackwards=%p1%
echo %DaysBackwards%|findstr "[123456789]">nul
if %errorlevel% EQU 0 (
  for /f "tokens=* delims=0" %%a in ('echo %DaysBackwards%') do (
    set DaysBackwards=%%a)
  ) else (set DaysBackwards=0)
::
:: Call subroutines to calculate the target date
call :JDNumber %dayNow% %monthNow% %yearNow% TodayJulianDayNumber
set /a JulianDayNumber=%TodayJulianDayNumber%-%DaysBackwards%
call :JDinverse %JulianDayNumber% day month year
::
:: Call the subroutines to get the information
:_threeParameters
call :JDdayNumber  %dayNow% %monthNow% %yearNow% TodayOrdinalNumber
call :JDdayNumber  %day%    %month%    %year%    DayOrdinalNumber
call :JDweekNumber %dayNow% %monthNow% %yearNow% TodayWeekNumber
call :JDweekNumber %day%    %month%    %year%    WeekNumber
call :JDdayName    %dayNow% %monthNow% %yearNow% TodayWeekDayName
call :JDdayName    %day%    %month%    %year%    WeekDayName
call :JDNumber     %dayNow% %monthNow% %yearNow% TodayJulianDayNumber
call :JDNumber     %day%    %month%    %year%    JulianDayNumber
call :IsValidDate  %day%    %month%    %year%    valid_
call :DaysInMonth  %monthNow% %yearNow% DaysNow
call :DaysInMonth  %month%    %year%    Days
::
set /a Difference=%TodayJulianDayNumber%-%JulianDayNumber%
::
:: Display the results
echo Today: %dayNow%%separator_%%monthNow%%separator_%%yearNow%
echo Julian day number : %TodayJulianDayNumber%
echo Weekday           : %TodayWeekDayName%
echo Day ordinal number: %TodayOrdinalNumber%
echo ISO Week number   : %TodayWeekNumber%
echo Days in month     : %DaysNow%
echo.
echo Date : %day%%separator_%%month%%separator_%%year%
echo Julian day number : %JulianDayNumber%
echo Weekday           : %WeekDayName%
echo Day ordinal number: %DayOrdinalNumber%
echo ISO Week number   : %WeekNumber%
echo Is valid date     : %valid_%
echo Days in month     : %Days%
echo.
echo Difference in days: %Difference%
goto _out
::
:: Customization needed
:_customize
echo Localization warning
echo You need to customize the %~0 script
echo Your Regional and Language Options differ from the script's default:
echo DATE /T is assumed produce dd%separator_%MM%separator_%yyyy
goto _out
::
:: Clean up
:_out
if not [%cmdbox%]==[true] if [%PauseIfFromDesktop%]==[true] pause
endlocal & goto :EOF
::
::
:: ============================================================
:: Subroutine: Calculate a day's ordinal number within the year
:JDdayNumber day month year return_
setlocal enableextensions enabledelayedexpansion
if %2 LEQ 2 (
  set /a f=%1-1+31*^(%2-1^)
  ) else (
  set /a a=%3
  set /a b=!a!/4-!a!/100+!a!/400
  set /a c=^(!a!-1^)/4-^(!a!-1^)/100+^(!a!-1^)/400
  set /a s=!b!-!c!
  set /a f=%1+^(153*^(%2-3^)+2^)/5+58+!s!
  )
set /a return_=%f%+1
endlocal & set "%4=%return_%" & goto :EOF
::
:: =====================================
:: Subroutine: Calculate the week number
:JDweekNumber day month year return_
setlocal enableextensions enabledelayedexpansion
if %2 LEQ 2 (
  set /a a=%3-1
  set /a b=!a!/4-!a!/100+!a!/400
  set /a c=^(!a!-1^)/4-^(!a!-1^)/100+^(!a!-1^)/400
  set /a s=!b!-!c!
  set /a e=0
  set /a f=%1-1+31*^(%2-1^)
  ) else (
  set /a a=%3
  set /a b=!a!/4-!a!/100+!a!/400
  set /a c=^(!a!-1^)/4-^(!a!-1^)/100+^(!a!-1^)/400
  set /a s=!b!-!c!
  set /a e=!s!+1
  set /a f=%1+^(153*^(%2-3^)+2^)/5+58+!s!
  )
set /a g=(%a%+%b%) %% 7
set /a d=(%f%+%g%-%e%) %% 7
set /a n=%f%+3-%d%
set return_=
if %n% LSS 0 set /a return_=53
if %n% GTR 364+%s% set /a return_=1
if not defined return_ set /a return_=%n%/7+1
endlocal & set "%4=%return_%" & goto :EOF
::
:: ===============================
:: Subroutine: Resolve the weekday
:JDdayName day month year wd_
setlocal enableextensions disabledelayedexpansion
set /a a=(14-%2)/12
set /a y=%3-%a%
set /a m=%2+12*%a%-2
set /a wdnum=1+(%1+%y%+%y%/4-%y%/100+%y%/400+(31*%m%)/12)%%7
for /f "tokens=%wdnum%" %%d in (
  'echo Sun Mon Tue Wed Thu Fri Sat Sun') do set wd_=%%d
endlocal & set "%4=%wd_%" & goto :EOF
::
:: =========================================================
:: Subroutine: Calculate the chronological Julian Day number
:JDnumber day month year return_
setlocal enableextensions
set /a a=(14-%2)/12
set /a y=%3+4800-%a%
set /a m=%2+12*%a%-3
set /a return_=%1+(153*%m%+2)/5+%y%*365+%y%/4-%y%/100+%y%/400-32045
endlocal & set "%4=%return_%" & goto :EOF
::
:: ===============================================
:: Subroutine: Get the date of a Julian Day number
:JDinverse dateNumber day month year
setlocal enableextensions
set /a a=%1+32044
set /a b=(4*%a%+3)/146097
set /a c=%a%-(%b%*146097)/4
set /a d=(4*%c%+3)/1461
set /a e=%c%-(1461*%d%)/4
set /a m=(5*%e%+2)/153
set /a day=%e%-(153*%m%+2)/5+1
set /a month=%m%+3-12*(%m%/10)
set /a year=%b%*100+%d%-4800+%m%/10
endlocal &set "%2=%day%" &set "%3=%month%" &set "%4=%year%" &goto :EOF
::
:: ====================================
:: Subroutine: Is a date valid
:IsValidDate day month year valid_
setlocal enableextensions
set valid_=False
call :JDnumber %1 %2 %3 JulianDayNumber
call :JDinverse %JulianDayNumber% dd_ mm_ yyyy_
if "%dd_%"=="%1" if "%mm_%"=="%2" if "%yyyy_%"=="%3" set valid_=True
endlocal & set "%4=%valid_%" & goto :EOF
::
:: ==============================================
:: Subroutine: How many days there are in a month
:DaysInMonth month year nrDays
setlocal enableextensions enabledelayedexpansion
for %%d in (28 29 30 31) do (
  call :IsValidDate %%d %1 %2 valid_
  if "!valid_!"=="True" set nrDays=%%d
  )
endlocal & set "%3=%nrDays%" & goto :EOF
::
:: ====================================
:: Subroutine: Check an input parameter
:ParamCheck arg return_
setlocal enableextensions
set return_=
echo %1|findstr "[^0-9]">nul
if %errorlevel% EQU 0 (
  set return_=error
  )
endlocal & set "%2=%return_%" & goto :EOF
