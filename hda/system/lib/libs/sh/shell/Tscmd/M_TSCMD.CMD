@echo off & setlocal enableextensions
rem enabledelayedexpansion

cls
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ M_TSCMD.CMD Create a TSCMD package, both in .arc and .zip formats ³
echo ³ By Prof. Timo Salmi. Last modified Mon 31-Jan-2011                ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem
rem   This file is included to show how one builds a zip and an arc
rem   package with command line scripting. It is not needed by the user.
rem   Only by the author.
rem
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.htm
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: Preliminaries
set pkpak=C:\_F\TOOLS\PKPAK.EXE
set pkzip=C:\Program Files\WinZip\WZZIP.EXE
set pkunzip=C:\Program Files\WinZip\WZUNZIP.EXE
set pkzip=C:\_F\TOOLS\PKZIP.EXE
set pkunzip=C:\_F\TOOLS\PKUNZIP.EXE
set targdir_=C:\_M
set targname_=TSCMD53

copy c:\_f\inf\tscmd.diz c:\_m\file_id.diz

for %%f in (%targdir_%\%targname_%.???) do del /p %%f

:: Make the (temporary) ARC version for documentation reasons
echo NT/w2k/XP script tricks and tips|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\1cmdfaq.txt
echo Ask questions in script files   |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\ftools\choose.exe
echo A CMD syntax selection demo     |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\cmd1demo.cmd
echo A 2nd CMD syntax selection demo |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\cmd2demo.cmd
echo Display ECHOC.EXE color map     |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\colormap.cmd
echo Compare contents of two folders |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\compfold.cmd
echo Date into a Julian date number  |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\tools\date2num.exe
echo Display date related information|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\dateinfo.cmd
echo Put date parts into environment |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\dateg.cmd
echo Put date parts into environment |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\datet.cmd
echo Recoverable command-line delete |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\dele.cmd
echo Display alternative date formats|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\gdate.cmd
echo Echo in colors                  |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\ftools\echoc.exe
echo Some alternative date formats   |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\edate.cmd
echo Find out how old a file is      |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\fileage.cmd
echo CMD shell for FILEINFO.VBS      |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\fileinfo.cmd
echo FileInfo Visual Basic Script    |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\fileinfo.vbs
echo Brief characterization of TSCMD |"%pkpak%" -ac %targdir_%\%targname_% c:\_m\file_id.diz
echo Find and list all the .TMP files|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\findtmp.cmd
echo Display the full name of a file |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\fullname.cmd
echo Get a file's date/time stamp    |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\getfdate.cmd
echo Build a message's "From" header |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\maildate.cmd
echo Make a randomized password      |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\makepass.cmd
echo Makefile that built this package|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\m_tscmd.cmd
echo Covert a filename to lower case |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\namedown.cmd
echo Covert a filename to upper case |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\nameup.cmd
echo A Julian date number into a date|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\tools\num2date.exe
echo Encode quoted printable into DOS|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\qp2dos.cmd
echo CMD shell for RECENT.VBS        |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\recent.cmd
echo Search folders for recent files |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\recent.vbs
echo Pinpoint screen columns and rows|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\tools\ruler.bat
echo Find same name files in folders |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\samename.cmd
echo Current folder in long and short|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\tscd.cmd
echo The questions index separately  |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\inf\tscmdidx.txt
echo Document ^(a readme^) for TSCMD |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\inf\tscmdinf.txt
echo News about the TSCMD package    |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\inf\tscmdnws.txt
echo List of programs from Timo Salmi|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\inf\tsprog.txt
echo Uptime since the last boot      |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\uptime.cmd
echo A reminder desktop alarm clock  |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\wakeup.cmd
echo Conv self-extracting exe to zip |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\wexe2zip.cmd
echo Find a file anywhere on a drive |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\whereis.cmd
echo Get IP and user information     |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\xtools\whoisme.cmd
echo CMD shell for XPMOVE.VBS        |"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\xpmove.cmd
echo Move newer files between folders|"%pkpak%" -ac %targdir_%\%targname_% c:\_f\cmd\xpmove.vbs
echo Script file collection, T.Salmi>"%temp%\m_tscmd.$$$"
"%pkpak%" -x %targdir_%\%targname_%<"%temp%\m_tscmd.$$$"
del "%temp%\m_tscmd.$$$"
"%pkpak%" -vc %targdir_%\%targname_%
"%pkpak%" -vc %targdir_%\%targname_%|gawk '{printf"%%s\n",$0}'>c:\_m\temp74.prn
"%pkpak%" -vc %targdir_%\%targname_%|gawk '{printf"%%s\n",substr($0,1,68)}'>c:\_m\temp68.prn
"%pkpak%" -vc %targdir_%\%targname_%|gawk '{printf"%%s\n",substr($0,1,48)}'>c:\_m\temp48.prn
pause

:: Make the actual ZIP package
:_pkzip
echo NT/2000/XP script tricks and tips by Prof. Timo Salmi|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\1cmdfaq.txt
echo Ask questions in script files   |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\ftools\choose.exe
echo A CMD syntax selection demo     |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\cmd1demo.cmd
echo A 2nd CMD syntax selection demo |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\cmd2demo.cmd
echo Display ECHOC.EXE color map     |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\colormap.cmd
echo Compare contents of two folders |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\compfold.cmd
echo Date into a Julian date number  |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\tools\date2num.exe
echo Display date related information|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\dateinfo.cmd
echo Put date parts into environment |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\datet.cmd
echo Recoverable command-line delete |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\dele.cmd
echo Echo in colors                  |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\ftools\echoc.exe
echo Some alternative date formats   |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\edate.cmd
echo Find out how old a file is      |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\fileage.cmd
echo CMD shell for FILEINFO.VBS      |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\fileinfo.cmd
echo FileInfo Visual Basic Script    |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\fileinfo.vbs
echo Get a file's date/time stamp    |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\getfdate.cmd
echo Brief characterization of TSCMD |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_m\file_id.diz
echo Find and list all the .TMP files|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\findtmp.cmd
echo Display the full name of a file |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\fullname.cmd
echo Build a message's "From" header |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\maildate.cmd
echo Make a randomized password      |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\makepass.cmd
echo Makefile that built this package|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\m_tscmd.cmd
echo Covert a filename to lower case |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\namedown.cmd
echo Covert a filename to upper case |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\nameup.cmd
echo A Julian date number into a date|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\tools\num2date.exe
echo Encode quoted printable into DOS|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\qp2dos.cmd
echo CMD shell for RECENT.VBS        |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\recent.cmd
echo Search folders for recent files |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\recent.vbs
echo Pinpoint screen columns and rows|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\tools\ruler.bat
echo Find same name files in folders |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\samename.cmd
echo Current folder in long and short|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\tscd.cmd
echo The questions index separately  |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\inf\tscmdidx.txt
echo Document ^(a readme^) for TSCMD |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\inf\tscmdinf.txt
echo News about the TSCMD package    |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\inf\tscmdnws.txt
echo List of programs and other material from Prof. Timo Salmi|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\inf\tsprog.txt
echo Uptime since the last boot      |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\uptime.cmd
echo A reminder desktop alarm clock  |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\wakeup.cmd
echo Conv self-extracting exe to zip |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\wexe2zip.cmd
echo Find a file anywhere on a drive |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\whereis.cmd
echo Get IP and user information     |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\xtools\whoisme.cmd
echo CMD shell for XPMOVE.VBS        |"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\xpmove.cmd
echo Move newer files between folders|"%pkzip%" -aco %targdir_%\%targname_%.ZIP c:\_f\cmd\xpmove.vbs
echo FTP archives http://garbo.uwasa.fi/ University of Vaasa, Finland|"%pkzip%" -zo %targdir_%\%targname_%.ZIP
"%pkzip%" -vc %targdir_%\%targname_%.ZIP
pause

:: Test the built zip-package integrity
"%pkunzip%" -t %targdir_%\%targname_%.ZIP>c:\_m\temp\test$$$.log
set el_=%errorlevel%
type "c:\_m\temp\test$$$.log"
if %el_% EQU 0 (
  echo No errors detected in the compressed data of %targdir_%\%targname_%.ZIP
  ) else (
  echo Warning: Errors detected in the compressed data of %targdir_%\%targname_%.ZIP)

:: Clean up
for %%f in ("c:\_m\file_id.diz" "c:\_m\temp\test$$$.log") do if exist %%f del %%f
if not defined cmdbox if defined PauseIfFromDesktop pause
endlocal & goto :EOF
