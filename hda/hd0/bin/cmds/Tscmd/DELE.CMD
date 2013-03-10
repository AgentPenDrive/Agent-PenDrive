@echo off & setlocal enableextensions enabledelayedexpansion
rem
rem   A safe delete. Move the file(s) you want to delete to a target
rem   folder, the default being C:\_L\TEMP which you can customize.
rem
rem   If the file already exists in the target folder, renames the file
rem   before moving. The base file name is appended with the date and time
rem   of the move. For example
rem     temp.tmp
rem     temp_2005050121131218.tmp
rem
rem   The date format is locale dependent. You may have to do some
rem   customizing for your own locale.
rem
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks
rem
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Recoverable command-line DELEte by Prof. Timo Salmi ³
echo ³ Last modified Tue 2-Feb-2010                        ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
::
:: Ensure also the correct handling of long file names
if not [%2]==[] (
  echo.
  echo Filenames with spaces must be encloses in parentheses ^"^"
  goto :EOF)
::
:: Your target trash folder, customize the path as appropriate
set targdir_=C:\_L\TEMP
if "%pcid_%"=="tscd" set targdir_=%mytemp%
if not exist "%targdir_%\" (
  echo.
  echo Target trash folder ^"%targdir_%^" does not exist
  echo Create it or customize the appropriate script line
  echo set targdir_=YourTargetTrashFolder
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Get the names of the files to be moved
set param1=%~1
set drive1=%~d1
set path1=%~p1
::
:: Usage help
set help_=
if "%~1"=="" set help_=true
if "%~1"=="/?" set help_=true
if defined help_ (
  echo.
  echo Usage: %~f0 [FileNameToBeMovedTo %targdir_%]
  echo.
  echo If a file with a same name already exists in your trash folder,
  echo renames the file before moving. The base file name is appended
  echo with the date and time of the new move.
  echo.
  echo The date appending in the script is locale dependent.
  echo If the following two lines do not tally, you should customize
  date /t
  echo DD.MM.YYYY
  echo.
  echo You can customize your target trash folder location by resetting
  echo the targdir_ environment variable in the script's code.
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Check the existence of the files to be moved
if not exist "%param1%" (
  echo File^(s^) %param1% not found
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)
::
:: Use codepage 850 to fix the date format. Customize, if necessary
for /f "tokens=3 delims= " %%p in (
  'mode con: codepage /status ^| find "Code page"') do (
  set store_codepage_=%%p)
mode con: codepage select=850>nul
::
:: Get the date/time information for file versions of file of the same name
set date_=%date%
set time_=%time%
set date_=%date_:~6,4%%date_:~3,2%%date_:~0,2%
set time_=%time_:~0,2%%time_:~3,2%%time_:~6,2%%time_:~9,2%
:: Take care of the potential leading space for the small hours
set time_=%time_: =0%
::
:: Move
set CountSourceFiles=0
for /f "tokens=* delims=" %%f in ('dir /b /a:-d-h-s "%param1%"') do (
  set fullSourceFileName=%drive1%%path1%%%f
  set SourceBaseFileName=%%~nf%%~xf
  set TargetBaseFileName=%%~nf_!date_!!time_!%%~xf
  set /a CountSourceFiles+=1
  echo.
  echo Move "!fullSourceFileName!" to "!targdir_!"
  Call :AreYouSure response_
  if not exist "!targdir_!\!SourceBaseFileName!" (
    if /i [!response_!]==[y] move /-y "!fullSourceFileName!" "!targdir_!\!SourceBaseFileName!"
      ) else (
    if /i [!response_!]==[y] move /-y "!fullSourceFileName!" "!targdir_!\!TargetBaseFileName!"
  )
)
::
:: Show the contents of the target trash folder
if %CountSourceFiles% EQU 0 (
  echo.
  echo File^(s^) %param1% not found
  ) else (
  dir /o:d %targdir_%
)
::
:: Clean up
mode con: codepage select=%store_codepage_%>nul
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF

:AreYouSure
setlocal enableextensions enabledelayedexpansion
:_askagain
set ask_=
set /p ask_="Are you sure [N/y]?"
if not [!ask_!]==[] if /i not [!ask_!]==[n] if /i not [!ask_!]==[y] goto _askagain
if /i [!ask_!]==[y] set return_=y
if /i [!ask_!]==[n] set return_=n
endlocal & set %1=%return_%& goto :EOF
