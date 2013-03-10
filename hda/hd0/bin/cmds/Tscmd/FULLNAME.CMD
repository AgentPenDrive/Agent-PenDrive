@echo off & setlocal enableextensions disabledelayedexpansion
rem                         Light Green on Black
if not defined cmdbox color A0
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Display the full name of a file ³
echo ³ By Prof. Timo Salmi             ³
echo ³ Last modified Tue 2-Feb-2010    ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.

rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem An important warning: Do not associate with "File Folder", "Folder"
rem or "Drive" types! If you do and do not know how exactly to handle it,
rem clicking a folder will invoke "search" instead of the folder making
rem the Windows Explorer and thus your system practically non-usable.
rem
rem For more information on that warning see e.g.
rem  http://support.microsoft.com/default.aspx?scid=kb;en-us;Q321186
rem  http://www.tomshardware.co.uk/forum/85531-35-double-click-folder-search-opens
rem  http://www.kellys-korner-xp.com/xp_tweaks.htm
rem  http://www.pcworld.com/article/id,126116-page,1-c,maintenancemanagement/article.html
rem
rem The intended main usage of this script is the following. In
rem  My Computer
rem   Tools
rem    File Types (choose one from the list)
rem     Advanced
rem      New
rem one can associate file types with additional programs and scripts.
rem Associate the current script and it will open a temporary dosbox to
rem display the path to the target file from your desktop.
rem
rem Some customization of the pause logic at the end may be required
rem since it is specific to my (Timo's) own configuration.
rem
rem Likewise, if you do not turn the FullInfo option off, you'll have
rem to customize the script for your own locale since the date/time
rem formats are locale dependent. The default date/time format assumed
rem in this script is exactly DD.MM.YYYY HH:mm
rem
rem What if you wish to associate this script with all the file types?
rem One option is to add it to the right-click SendTo list.
rem Right-click start
rem   explore
rem     Open the SendTo folder
rem       Right-click and choose New
rem         Make a shortcut to FULLNAME.CMD
rem Then, when you right-click any file, the option to send to FULLNAME.CMD
rem will be available.

:: Full or brief info (customize as you prefer)
set FullInfo=
set FullInfo=true

:: Also send the name to the clipboard (customize as you prefer!)
:: Requires a suitable command-line clip utility from Microsoft.
:: For more, see FAQ item #67. Skipped, if not available.
set ToClipboard=
set ToClipboard=true
for %%f in ("CLIP.EXE") do set ClipProgram="%%~$PATH:f"
if exist "CLIP.EXE" set ClipProgram="CLIP.EXE"
if exist "C:\_F\FTOOLS\CLIP.EXE" set ClipProgram="C:\_F\FTOOLS\CLIP.EXE"
if [%ClipProgram%]==[""] (
  for %%f in ("CLIP98.EXE") do set ClipProgram="%%~$PATH:f"
  if exist "CLIP98.EXE" set ClipProgram="CLIP98.EXE"
  if exist "C:\_F\FTOOLS\CLIP98.EXE" set ClipProgram="C:\_F\FTOOLS\CLIP98.EXE"
  )

:: Show usage
if "%~1"=="" (
  echo Usage: %~f0 [FileName]
  echo.
  echo An Important warning: Do not associate the script with "File Folder",
  echo "Folder" or "Drive" types! For more see the "rem" comments in the script.
  goto _out
)

:: No wildcards allowed
echo "%~1"|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo Wildcards not allowed in %1
  goto _out)

:: From CLI
:: I automatically have cmdbox set as true whenever I use CLI
if not defined cmdbox goto _desktop
if not exist "%~f1" (
  echo File "%~f1" not found
  goto _out)
echo "%~f1"
if not defined FullInfo goto _out
:: Ampersands (&) prevent processing for more details
echo "%~1"|findstr "[&]">nul
if %errorlevel% EQU 0 (
  echo.
  echo Exiting: Names with ampersands cannot be processed for more details
  goto _out)
:: More details
echo.
echo %~dps1
echo %~nxs1
dir /-c /x "%~f1"|findstr /c:" %~nx1"
dir /-c /q "%~f1"|findstr /c:" %~nx1"
::
echo.
echo %~a1
echo %~z1
echo %~t1
:: This part is locale specific
set datetime_=%~t1
echo %datetime_:~6,4%%datetime_:~3,2%%datetime_:~0,2%%datetime_:~11,2%%datetime_:~14,2%
goto _out

:: From desktop
:_desktop
echo %1
echo.
if not defined FullInfo goto _out
if defined ToClipboard if exist %ClipProgram% (
  <nul (set /p dummy="%~1")|%ClipProgram%
  )

:: Ampersands (&) prevent processing for more details
echo "%~1"|findstr "[&]">nul
if %errorlevel% EQU 0 (
  echo Exiting: Names with ampersands cannot be processed for more details
  goto _out)

:: Display more information
echo %~dps1
echo %~nxs1
dir /-c /x %1|findstr /c:" %~nx1"
dir /-c /q %1|findstr /c:" %~nx1"
echo.
echo %~a1
echo %~z1
echo %~t1
:: This part is locale specific
set datetime_=%~t1
ECHO YYYYMMDDHHMN
echo %datetime_:~6,4%%datetime_:~3,2%%datetime_:~0,2%%datetime_:~11,2%%datetime_:~14,2%
:: UNIX touch formulated date
echo mmddhhmnyyyy
echo %datetime_:~3,2%%datetime_:~0,2%%datetime_:~11,2%%datetime_:~14,2%%datetime_:~6,4%
goto _out
echo.

:_out
rem Customization of the pause logic may be required
if not defined cmdbox if defined PauseIfFromDesktop pause
if not defined cmdbox color
endlocal & goto :EOF
