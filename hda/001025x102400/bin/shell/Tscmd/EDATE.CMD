@echo off & setlocal enableextensions enabledelayedexpansion
echo.+----------------------------------------------------+
echo ^| EDATE.CMD to display some alternative date formats ^|
echo ^| By Prof. Timo Salmi, Last modified Thu 27-Jan-2011 ^|
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
:: Requires G(nu)AWK
:: Test for its availability at path or in the current folder
for %%f in ("GAWK.EXE") do set found_="%%~$PATH:f"
if exist GAWK.EXE set found_="GAWK.EXE"
if "%~1"=="" if [%found_%]==[""] (
  echo GAWK.EXE needed by the script is not available
  echo Get e.g. ftp://garbo.uwasa.fi/pc/unix/gawk2156.zip
  echo or ftp://garbo.uwasa.fi/win95/unix/UnxUpdates.zip
  echo.
  echo Alternatively use: EDATE 0
  echo which will apply Visual Basic Script instead
  if not [%cmdbox%]==[true] if [%PauseIfFromDesktop%]==[true] pause
  goto :EOF)
::
:: Winter (normal) and summertime offsets, customize to fit your locale
set winter_=+0200
set summer_=+0300
::
:: Use codepage 850 to fix the date format
for /f "tokens=3 delims= " %%p in (
  'mode con: codepage /status ^| find "Code page"') do (
  set store_codepage_=%%p)
mode con: codepage select=850>nul
::
:: Usage help
set help_=
if "%~1"=="?" set help_=true
if "%~1"=="/?" set help_=true
if /i "%~1"=="/help" set help_=true
if defined help_ (
  echo Usage 1: EDATE
  echo    or 2: EDATE [AddDays]
  echo    or 3: EDATE [ /C1 ³ /C2 ³ /C3 ³ /C4 ³ /C5]
  echo.
  echo  /C1 = DD.MMM.YYYY HH:mm:ss      /C5 = MMDDHHMNYYYY.SS
  echo  /C2 = Wkd DD-MMM-YYYY HH:mm
  echo  /C3 = YYMMDD
  echo  /C4 = YYYYMMDD
  echo.
  echo The first usage, 1:, will use gawk, the others a Visual Basic Script.
  echo The output selection will differ between the alternative usages.
  echo The ^(/Cx^) alternatives will also send the output to the clipboard.
  echo.
  echo The first usage, 1:, will give the correct information only
  echo if the following date localization tallies:
  date /t
  echo DD.MM.YYYY
  echo Else customize the script to correspond to your locale's date format.
  goto _out
  )
::
:: To the "to the Clipboard" version
if /i "%~1"=="/c1" goto _clip
if /i "%~1"=="/c2" goto _clip
if /i "%~1"=="/c3" goto _clip
if /i "%~1"=="/c4" goto _clip
if /i "%~1"=="/c5" goto _clip
::
:: Test roughly that only valid characters are present in the parameter
set isNumeric=true
echo %~1|findstr "[^-0-9]">nul
if %errorlevel% EQU 0 set isNumeric=false
if "%~1"=="" set isNumeric=true
if "%isNumeric%"=="false" (
  echo The parameter given is invalid: %~1
  echo.
  echo For the usage enter EDATE /?
  goto :EOF
  )
::
:: Gawk or Visual Basic Script version
if not "%~1"=="" goto _visual
::
:: Display some alternative date/time presentations
if [%date:~8,1%]==[0] gawk 'BEGIN{printf"6%%s\n",substr(strftime("%%y%%m%%d"),2,5)}'
if [%date:~8,1%]==[1] gawk 'BEGIN{printf"7%%s\n",substr(strftime("%%y%%m%%d"),2,5)}'
gawk 'BEGIN{printf"%%s\n",strftime("%%y%%m%%d")}'
gawk 'BEGIN{printf"%%s\n",strftime("%%Y.%%m.%%d")}'
gawk 'BEGIN{printf"%%s\n",strftime("%%Y%%m%%d")}'
echo.
::
:: Replace the leading zero with a blank in a 01-09 day
gawk 'BEGIN{printf"%%s",strftime("%%a %%b ")}'
if [%date:~0,1%]==[0] gawk 'BEGIN{printf" %%s",substr(strftime("%%d"),2)}'
if not [%date:~0,1%]==[0] gawk 'BEGIN{printf"%%s",strftime("%%d")}'
gawk 'BEGIN{printf"%%s\n",strftime(" %%H:%%M:%%S %%Y")}'
::
gawk 'BEGIN{printf"%%s\n",strftime("%%a %%b %%d %%H:%%M:%%S %%Y")}'
gawk 'BEGIN{printf"%%s %winter_% (EET)\n",strftime("%%a, %%d %%b %%Y %%H:%%M:%%S")}'
gawk 'BEGIN{printf"%%s %summer_% (EEST)\n",strftime("%%a, %%d %%b %%Y %%H:%%M:%%S")}'
echo.
gawk 'BEGIN{printf"%%s\n",strftime("%%a %%b %%d %%H:%%M:%%S %%Y Week %%V Day %%j")}'
gawk 'BEGIN{printf"%%s\n",strftime("%%A %%d %%B %%Y %%H:%%M:%%S")}'
rem gawk 'BEGIN{printf"%%s\n",strftime("%%a %%d-%%b-%%Y %%H:%%M")}'
gawk 'BEGIN{printf"%%s\n",strftime("%%a %%d-%%b-%%Y %%H:%%M:%%S")}'
:: Drop the leading zero from a 01-09 day
if [%date:~0,1%]==[0] gawk 'BEGIN{printf"%%s %%s\n",strftime("%%a"),substr(strftime("%%d-%%b-%%Y %%H:%%M:%%S"),2)}'
echo.
::
:: Local date presentations (here in Finnish, customize as appropriate)
gawk 'BEGIN{printf"@set wdnum_=%%s\n",strftime("%%w")}'>"%temp%\edateTmp.cmd"
for %%c in (call del) do %%c "%temp%\edateTmp.cmd"
set WeekdayArray=SuMaTiKeToPeLa
set /a i_=2*%wdnum_%
set weekday_=!WeekdayArray:~%i_%,2!
echo %weekday_% %date:~0,2%.%date:~3,2%.%date:~6,4% %time:~0,8%
::
if "%wdnum_%"=="0" set weekday_=sunnuntai
if "%wdnum_%"=="1" set weekday_=maanantai
if "%wdnum_%"=="2" set weekday_=tiistai
if "%wdnum_%"=="3" set weekday_=keskiviikko
if "%wdnum_%"=="4" set weekday_=torstai
if "%wdnum_%"=="5" set weekday_=perjantai
if "%wdnum_%"=="6" set weekday_=lauantai
set monthNum=%date:~3,2%
if "%monthNum%"=="01" set month_=tammi
if "%monthNum%"=="02" set month_=helmi
if "%monthNum%"=="03" set month_=maalis
if "%monthNum%"=="04" set month_=huhti
if "%monthNum%"=="05" set month_=touko
if "%monthNum%"=="06" set month_=kes„
if "%monthNum%"=="07" set month_=hein„
if "%monthNum%"=="08" set month_=elo
if "%monthNum%"=="09" set month_=syys
if "%monthNum%"=="10" set month_=loka
if "%monthNum%"=="11" set month_=marras
if "%monthNum%"=="12" set month_=joulu
echo %weekday_% %date:~0,2%. %month_%kuuta %date:~6,4% %time:~0,8%
echo %weekday_%na %date:~0,2%. %month_%kuuta %date:~6,4% %time:~0,8%
goto _out
::
:: ========== Part 2 the Visual Basic Script alternative ==========
:_visual
set add_=%~1
::
:: Build a Visual Basic Script
set skip=
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
if not exist "%temp_%\" (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto _out
  )
findstr "'%skip%VBS" "%~f0" > "%temp_%\edateTmp.vbs"
::
:: Run it with Microsoft Windows Script Host Version 5.6
cscript //nologo "%temp_%\edateTmp.vbs" "%add_%">"%temp_%\edateTmp.cmd"
::
:: Call the command line script which the script host built
call "%temp_%\edateTmp.cmd"
::
:: Clean up
for %%f in ("%temp_%\edateTmp.vbs" "%temp_%\edateTmp.cmd") do if exist "%%f" del "%%f"
::
:: Drop leading zeros
for /f "tokens=* delims=0" %%a in ('echo %ddpad_%') do set dd_=%%a
for /f "tokens=* delims=0" %%a in ('echo %mmpad_%') do set mm_=%%a
::
:: Give the results in various formats
echo Today from %%date%%: %date%
echo Today + (%~1) days:
echo %wd_% %mon_% %ddpad_% %hh_%:%mi_%:%ss_% %yyyy_%
echo %wd_% %ddpad_%.%mmpad_%.%yyyy_%
echo %wd_% %ddpad_%-%month_:~0,3%-%yyyy_%
echo %wd_:~0,2% %dd_%.%mm_%.%yyyy_%
echo %yyyy_%.%mmpad_%.%ddpad_% %yyyy_%%mmpad_%%ddpad_% %yyyy_%%mmpad_%%ddpad_%%hh_%%mi_%%ss_%
echo %mmpad_%%ddpad_%%hh_%%mi_%%yyyy_%.%ss_%
set y6_=%yyyy_:~2,1%
set /a y6_=%y6_%+6
if "%y6_%"=="6" set ye_=E
if "%y6_%"=="7" set ye_=F
echo %y6_%%yyyy_:~3,1%%mmpad_%%ddpad_% %ye_%%yyyy_:~3,1%%mmpad_%%ddpad_%
echo ,,%ddpad_%.%mmpad_%.%yyyy_% %hh_%:%mi_%:%ss_%,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
::
goto _out
::
:: ========== Part 3 the Clipboard alternative ==========
:_clip
for %%f in ("CLIP.EXE") do set ClipProgram="%%~$PATH:f"
if exist "CLIP.EXE" set ClipProgram="CLIP.EXE"
if exist "C:\_F\FTOOLS\CLIP.EXE" set ClipProgram="C:\_F\FTOOLS\CLIP.EXE"
if [%ClipProgram%]==[""] (
  for %%f in ("CLIP98.EXE") do set ClipProgram="%%~$PATH:f"
  if exist "CLIP98.EXE" set ClipProgram="CLIP98.EXE"
  if exist "C:\_F\FTOOLS\CLIP98.EXE" set ClipProgram="C:\_F\FTOOLS\CLIP98.EXE"
  )
::
if not defined ClipProgram (
  echo The clipboard program required for the %~1 switch is not available.
  echo For more see http://www.netikka.net/tsneti/info/tscmd067.htm
  goto _out
  )
::
:: Build a Visual Basic Script
set skip=
set temp_=%temp%
if defined mytemp set temp_=%mytemp%
if not exist "%temp_%\" (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto _out
  )
findstr "'%skip%VBS" "%~f0" > "%temp_%\edateTmp.vbs"
::
:: Run it with Microsoft Windows Script Host Version 5.6
cscript //nologo "%temp_%\edateTmp.vbs" "0">"%temp_%\edateTmp.cmd"
::
:: Call the command line script which the script host built
call "%temp_%\edateTmp.cmd"
::
:: Clean up
for %%f in ("%temp_%\edateTmp.vbs" "%temp_%\edateTmp.cmd") do if exist "%%f" del "%%f"
::
:: Drop leading zeros
for /f "tokens=* delims=0" %%a in ('echo %ddpad_%') do set dd_=%%a
for /f "tokens=* delims=0" %%a in ('echo %mmpad_%') do set mm_=%%a
::
:: The various outputs
if /i "%~1"=="/c1" (
  echo %ddpad_%.%mmpad_%.%yyyy_% %hh_%:%mi_%:%ss_%
  <nul (set /p dummy=%ddpad_%.%mmpad_%.%yyyy_% %hh_%:%mi_%:%ss_%)|%ClipProgram%
  goto _out
  )
if /i "%~1"=="/c2" (
  echo %wd_% %dd_%-%month_:~0,3%-%yyyy_% %hh_%:%mi_%
  <nul (set /p dummy=%wd_% %dd_%-%month_:~0,3%-%yyyy_% %hh_%:%mi_%)|%ClipProgram%
  goto _out
  )
if /i "%~1"=="/c3" (
  echo %yyyy_:~2,2%%mmpad_%%ddpad_%
  <nul (set /p dummy=%yyyy_:~2,2%%mmpad_%%ddpad_%)|%ClipProgram%
  goto _out
  )
if /i "%~1"=="/c4" (
  echo %yyyy_%%mmpad_%%ddpad_%
  <nul (set /p dummy=%yyyy_%%mmpad_%%ddpad_%)|%ClipProgram%
  goto _out
  )
if /i "%~1"=="/c5" (
  echo %mmpad_%%ddpad_%%hh_%%mi_%%yyyy_%.%ss_%
  <nul (set /p dummy=%mmpad_%%ddpad_%%hh_%%mi_%%yyyy_%.%ss_%)|%ClipProgram%
  goto _out
  )
::
:: ================================================================
:: Common clean up
:_out
mode con: codepage select=%store_codepage_%>nul
if /i not "%~2"=="nopause" if not [%cmdbox%]==[true] if [%PauseIfFromDesktop%]==[true] pause
endlocal & goto :EOF
::
'
'The Visual Basic Script
AddDays=WScript.Arguments.Unnamed(0)                             'VBS
DateNow=Date                                                     'VBS
Datethen=CStr(Int(DateNow+AddDays))                              'VBS
'
Wscript.Echo "@set ddpad_=" & Right(0 & Day(DateThen), 2)        'VBS
Wscript.Echo "@set mmpad_=" & Right(0 & Month(DateThen), 2)      'VBS
Wscript.Echo "@set yyyy_="  & Year(DateThen)                     'VBS
'
Wd=WeekDayName(Weekday(DateThen),true)                           'VBS
Wscript.Echo "@set wd_=" & Wd                                    'VBS
'
Mon=MonthName(Month(DateThen),true)                              'VBS
Wscript.Echo "@set mon_=" & Mon                                  'VBS
Mon=MonthName(Month(DateThen),false)                             'VBS
Wscript.Echo "@set month_=" & Mon                                'VBS
'
TimeNow = Time                                                   'VBS
Wscript.Echo "@set hh_=" & Right(0 & DatePart("h", TimeNow), 2)  'VBS
Wscript.Echo "@set mi_=" & Right(0 & DatePart("n", TimeNow), 2)  'VBS
Wscript.Echo "@set ss_=" & Right(0 & DatePart("s", TimeNow), 2)  'VBS
