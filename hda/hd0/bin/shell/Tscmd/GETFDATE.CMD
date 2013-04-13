@echo off & setlocal enableextensions
if not defined cmdbox color A0

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ GETFDATE Get a file's locale independent datestamp ³
echo ³ By Prof. Timo Salmi. Last modified Tue 2-Feb-2010  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

:: Just for the script development phase
set debug_=true
set debug_=

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

rem The intended main usage of this script is the following. In
rem  My Computer
rem   Tools
rem    File Types (choose one from the list)
rem     Advanced
rem      New
rem one can associate file types with additional programs and scripts.
rem Associate the current script and it will open a temporary dosbox to
rem display the date/time stamp of the target file from your desktop.
rem
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
rem What if you wish to associate this script with all the file types?
rem One option is to add it to the right-click SendTo list.
rem Right-click start
rem   explore
rem     Open the SendTo folder
rem       Right-click and choose New
rem         Make a shortcut to FULLNAME.CMD
rem Then, when you right-click any file, the option to send to FULLNAME.CMD
rem will be available.

:: Paths to temporary files
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
set vbs_=%temp_%\tmp$$$.vbs
set tmpcmd_=%temp_%\tmp$$$.cmd

:: Is help needed
if "%~1"=="" goto _help
if "%~1"=="/?" goto _help

:: No wildcards allowed
echo "%~1"|findstr "[*?]">nul
if %errorlevel% EQU 0 (
  echo Exiting: Wildcards not allowed in "%~1"
  goto _out)

:: Is it a folder, not allowed
if exist "%~1\" (
  echo Exiting: The target "%~1" is a folder
  goto _out)

:: Does the file exist
if not exist "%~1" (
  echo Exiting: File "%~1" not found
  goto _out)

:: Also send the results to the clipboard (customize as you prefer!)
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

:: Build a Visual Basic Script
:: to get locale independent date/time stamp information
set skip=
>"%vbs_%" findstr "'%skip%VBS" "%~f0"

:: Run the script with Microsoft Windows Script Host Version 5.6
if not defined debug_ cscript //nologo "%vbs_%" "%~1" ""
if defined debug_ (type "%vbs_%"&goto _out)

:: Was that all we wanted?
if defined cmdbox goto _out
if not defined ToClipboard goto _out
if not exist %ClipProgram% goto _out

:: Get the UNIX-type touch date/time stamp into an environment variable
cscript //nologo "%vbs_%" "%~1" "getenv2">"%tmpcmd_%"
call "%tmpcmd_%"
if defined ToClipboard if exist %ClipProgram% (
  <nul (set /p dummy="%getfdatestamp%")|%ClipProgram%
  )
goto _out

:_help
echo Usage: GETFDATE ["Filename"]
echo.
echo The date/time stamp is given in the ordinary Windows format
echo and the UNIX touch program format.
echo.
echo For more information see the rem comments within the script.
goto _out

:: Clean up
:_out
for %%f in ("%vbs_%" "%tmpcmd_%") do if exist %%f del %%f
rem Customization of the pause logic may be required
if not defined cmdbox if defined PauseIfFromDesktop (echo.&pause)
if not defined cmdbox color
endlocal & goto :EOF

'The Visual Basic Script
'
Set arg = WScript.Arguments 'VBS
Set fso = CreateObject("Scripting.FileSystemObject") 'VBS
Filename = arg(0) 'VBS
Set f = fso.GetFile(Filename) 'VBS
yyyy = DatePart("yyyy",f.DateLastModified) 'VBS
mm = Right(0 & DatePart("m",f.DateLastModified), 2) 'VBS
dd = Right(0 & DatePart("d",f.DateLastModified), 2) 'VBS
hh = Right(0 & DatePart("h",f.DateLastModified), 2) 'VBS
mn = Right(0 & DatePart("n",f.DateLastModified), 2) 'VBS
ss = Right(0 & DatePart("s",f.DateLastModified), 2) 'VBS
datetimeStampWin   = yyyy & "." & mm & "." & dd & " " & hh & ":" & mn & ":" & ss 'VBS
datetimeStampPhoto = yyyy & mm & dd 'VBS
datetimeStampTouch = mm & dd & hh & mn & yyyy & "." & ss 'VBS

If arg(1) = "" Then 'VBS
  WScript.Echo Filename 'VBS
  WScript.Echo 'VBS
  WScript.Echo "YYYY.MM.DD HH:MN:SS" 'VBS
  WScript.Echo datetimeStampWin 'VBS
  WScript.Echo 'VBS
  WScript.Echo "YYYYMMDD" 'VBS
  WScript.Echo datetimeStampPhoto 'VBS
  WScript.Echo 'VBS
  WScript.Echo "MMDDHHMNYYYY.SS"'VBS
  WScript.Echo datetimeStampTouch 'VBS
End If 'VBS

If arg(1) = "getenv1" Then 'VBS
  WScript.Echo "@set getfdatestamp=" & datetimeStampTouch 'VBS
  Else If arg(1) = "getenv2" Then 'VBS
    s = "@set getfdatestamp=" 'VBS
    s = s & "unxtouch -t" & datetimeStampTouch 'VBS
    WScript.Echo s & " " & Chr(34) & f & Chr(34) 'VBS
  End If 'VBS
End If 'VBS
