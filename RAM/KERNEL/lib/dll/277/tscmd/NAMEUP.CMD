@echo off & setlocal enableextensions

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.

echo ⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
echo ≥ NAMEUP.CMD Covert a filename to upper case ≥
echo ≥ By Prof. Timo Salmi                        ≥
echo ≥ Last modified Sat 4-Dec-2010               ≥
echo ¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
echo.

rem Converts also the Scandinavian characters
rem  Ü -- è  Ñ -- é  î -- ô
rem If you do not want that customize the ToUpcase subroutine

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
rem         Make a shortcut to NAMEUP.CMD
rem Then, when you right-click any file, the option to send to NAMEUP.CMD
rem will be available.

:: Usage
set help_=
if "%~1"=="" set help_=true
if "%~1"=="?" set help_=true
if "%~1"=="/?" set help_=true
if defined help_ (
  echo Usage: "%~f0" "FileName.Ext" [/Q]
  echo.
  echo For wildcards use e.g.
  echo. for %%f in ^("*.*"^) ^do nameup "%%f"
  echo. for %%f in ^("*.doc"^) ^do nameup "%%f"
  echo. for %%f in ^("*.htm"^) ^do nameup "%%f"
  echo. for %%f in ^("*.jpg"^) ^do nameup "%%f"
  echo. for %%f in ^("*.mai"^) ^do nameup "%%f"
  echo. for %%f in ^("*.pgp"^) ^do nameup "%%f"
  echo. for %%f in ^("*.rtf"^) ^do nameup "%%f"
  echo. for %%f in ^("*.txt"^) ^do nameup "%%f"
  echo. for %%f in ^("C:\_L\VALITYS\*.jpg"^) do call nameup "%%f" /q
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto :EOF)

:: Don't allow ampersands (&)
echo "%~1"|findstr "[&]">nul
if %errorlevel% EQU 0 (
  echo "%~1"
  echo Names with ampersands are not acceptable in this script
  echo exiting %~0
  goto _out)

:: Don't allow wildcards
echo "%~1"|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo Wildcards not allowed in %1
  echo.
  echo Apply e.g.
  echo. for %%f in ^("*.*"^) ^do nameup "%%f"
  echo. for %%f in ^("*.doc"^) ^do nameup "%%f"
  echo. for %%f in ^("*.htm"^) ^do nameup "%%f"
  echo. for %%f in ^("*.jpg"^) ^do nameup "%%f"
  echo. for %%f in ^("*.mai"^) ^do nameup "%%f"
  echo. for %%f in ^("*.pgp"^) ^do nameup "%%f"
  echo. for %%f in ^("*.rtf"^) ^do nameup "%%f"
  echo. for %%f in ^("*.txt"^) ^do nameup "%%f"
  echo. for %%f in ^("C:\_M\*.jpg"^) do call nameup "%%f" /q
  echo. for %%f in ^("C:\_L\VALITYS\*.jpg"^) do call nameup "%%f" /q
  goto :EOF)

:: Quiet mode?
set quiet_=
if /i "%~2"=="/q" set quiet_=true

:: Test for LFN peculiarities
set warn_=
if not [%2]==[] if not defined quiet_ set warn_=true
if not [%3]==[] set warn_=true
if defined warn_ (
  echo A file name with spaces in it should be enclosed in parentheses ""
  goto :EOF)

:: Test for other peculiarities
set warn_=
if "%~1"=="/" set warn_=true
if "%~1"=="\" set warn_=true
if "%~1"=="." set warn_=true
if "%~1"==".." set warn_=true
if defined warn_ (
  echo Unacceptable filename
  goto :EOF)

:: Check that the file exists
if exist "%~f1" goto _getname
echo File %~f1 not found
goto _out

:: Get the file's parts
:_getname
set fullname_=%~f1
set name_=%~n1
set ext_=%~x1

:: Covert to upper case
call :ToUpcase "%name_%" name_
call :ToUpcase "%ext_%" ext_

:: Ask for confirmation
if defined quiet_ goto _ren
:_ask
set ask_=
echo Convert "%fullname_%" to "%name_%%ext_%"
set /p ask_="are you sure [n/Y]?"
if /i [%ask_%]==[n] goto :EOF
if /i not [%ask_%]==[y] if not [%ask_%]==[] goto _ask
set ask_=

:: Do the conversion
:_ren
ren "%fullname_%" "%name_%%ext_%"
echo.
dir "%fullname_%"

:_out
if not defined cmdbox if defined PauseIfFromDesktop pause

endlocal & goto :EOF

:: ====================================================================
:ToUpcase
setlocal enableextensions
set var_=%1
set var_=%var_:a=A%
set var_=%var_:b=B%
set var_=%var_:c=C%
set var_=%var_:d=D%
set var_=%var_:e=E%
set var_=%var_:f=F%
set var_=%var_:g=G%
set var_=%var_:h=H%
set var_=%var_:i=I%
set var_=%var_:j=J%
set var_=%var_:k=K%
set var_=%var_:l=L%
set var_=%var_:m=M%
set var_=%var_:n=N%
set var_=%var_:o=O%
set var_=%var_:p=P%
set var_=%var_:q=Q%
set var_=%var_:r=R%
set var_=%var_:s=S%
set var_=%var_:t=T%
set var_=%var_:u=U%
set var_=%var_:v=V%
set var_=%var_:w=W%
set var_=%var_:x=X%
set var_=%var_:y=Y%
set var_=%var_:z=Z%
set var_=%var_:Ü=è%
set var_=%var_:Ñ=é%
set var_=%var_:î=ô%
set var_=%var_:"=%
endlocal & set %2=%var_%& goto :EOF
