@echo off & setlocal enableextensions enabledelayedexpansion

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ COMPFOLD.CMD Compare the contents of two folders   ³
echo ³ By Prof. Timo Salmi. Last modified Wed 10-Mar-2010 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.

rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
rem Also see http://www.netikka.net/tsneti/info/tscmd.php
rem for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

:: The location of the temporary folder
set temp_=%temp%
if defined mytemp if exist "%mytemp%\" set temp_=%mytemp%
:: The path to temp in the short format
for /f "tokens=*" %%f in ("%temp_%") do set temp_=%%~sf
if not exist %temp_%\ (
  echo Working folder %temp_% not found
  echo You may have to recreate it
  goto :EOF
  )

:: Avoid multiple calls of the script
if exist "%temp_%\compfoldLockfile.tmp" (
  echo An instance of COMPFOLD.CMD already is running
  echo If this is in error delete the lockfile
  echo "%temp_%\compfoldLockfile.tmp"
  goto :EOF
  )
echo Lockfile "%temp_%\compfoldLockfile.tmp" for COMPFOLD.CMD>"%temp_%\compfoldLockfile.tmp"

:: A temporary logfile
set logfile_="%temp_%\compfold.log"
for %%f in (%logfile_%) do if exist %%f del %%f

:: Get the folders from the command line
set folder1_=%~1
set folder2_=%~2

:: Any switches
set alsosub_=%~3
if "%alsosub_%"=="/s" (
  set alsosub_=true
  ) else (
  set alsosub_=
)

:: The author's personal defaults
if /i "%folder1_%"=="/1" (
  set folder1_=C:\_L\TODAY
  set folder2_=D:
)

if /i "%folder1_%"=="/2" (
  set folder1_=C:\_L\TODAY
  set folder2_=T:
)

if /i "%folder1_%"=="/3" (
  set folder1_=C:\_L\TODAY
  set folder2_=T:\ElsaTEMP
)

if /i "%folder1_%"=="/4" (
  set folder1_=C:\_M
  set folder2_=C:\_L\TODAY
)

if /i "%folder1_%"=="/5" (
  set folder1_=C:\_F\CHYDE
  set folder2_=C:\_L\TODAY
)

if /i "%folder1_%"=="/5" (
  set folder1_=D:\SCALED
  set folder2_=C:\_H\PHOTENNA\SCALED
)

if /i "%folder1_%"=="/7" (
  set folder1_=C:\_M
  set folder2_=C:\_L\ENNA\VPP\DAT
)

if /i "%folder1_%"=="/8" (
  set folder1_=C:\_L\TIMO\DESKTEMP
  set folder2_=C:\_L\TIMO\TLMADESK
)

if /i "%folder1_%"=="/9" (
  set folder1_=C:\_M
  set folder2_=D:\HUPU
)

if /i "%folder1_%"=="/a" (
  set folder1_=C:\_L\TODAY
  set folder2_=C:\_M\%pcid_%TEMP
)

:: Usage
if "%folder2_%"=="" (
  echo Usage COMPFOLD "Folder1" "Folder2" [/s]        Employs the bit by bit fc /b
  echo                  Include subfolders ÄÙ         comparison for accurate results
  echo.
  echo Alternative usage: The author's personal defaults
  echo  COMPFOLD [/1] for C:\_L\TODAY D:
  echo  COMPFOLD [/2] for C:\_L\TODAY T:
  echo  COMPFOLD [/3] for C:\_L\TODAY T:\ElsaTEMP
  echo  COMPFOLD [/4] for C:\_M C:\_L\TODAY
  echo  COMPFOLD [/5] for C:\_F\CHYDE C:\_L\TODAY
  echo  COMPFOLD [/6] for D:\SCALED C:\_H\PHOTENNA\SCALED
  echo  COMPFOLD [/7] for C:\_M C:\_L\ENNA\VPP\DAT
  echo  COMPFOLD [/8] for C:\_L\TIMO\DESKTEMP C:\_L\TIMO\TLMADESK
  echo  COMPFOLD [/9] for C:\_M D:\HUPU
  echo  COMPFOLD [/A] for C:\_L\TODAY C:\_M\%pcid_%TEMP
  if not defined cmdbox if defined PauseIfFromDesktop pause
  goto _out)

:: Do not allow trailing backslashes
echo %folder1_%| findstr "\\$">nul
if %errorlevel% EQU 0 (
  echo Trailing backslashes are not allowed at the end of the names
  goto _out)
echo %folder2_%| findstr "\\$">nul
if %errorlevel% EQU 0 (
  echo Trailing backslashes are not allowed at the end of the names
  goto _out)

:: Check for the folders' exsistence
if not exist "%folder1_%" (
  echo Folder "%folder1_%" not found
  goto _out)
if not exist "%folder2_%" (
  echo Folder "%folder2_%" not found
  goto _out)

:: Log which folders are being compared
>>%logfile_% echo %date% %time%
>>%logfile_% echo.
>>%logfile_% echo Comparing
>>%logfile_% echo  %folder1_%
>>%logfile_% echo  %folder2_%
>>%logfile_% echo.

:: Choose the procedure to perform
if defined alsosub_ goto _alsosub

:: Do the comparison without subfolders
set file1Count_=0
set file2notFoundCount_=0
set file2notSameCount_=0
for /f "delims=" %%f in ('dir /a:-d /b /o:-d "%folder1_%\*.*"') do (
  dir /-c "%folder1_%\%%f"|find /i "%%f">>%logfile_%
  set /a file1Count_+=1
  if exist "%folder2_%\%%f" (
    dir /-c "%folder2_%\%%f" |find /i "%%f">>%logfile_%
    fc /b "%folder1_%\%%f" "%folder2_%\%%f" > nul
    if !errorlevel! GTR 0 (
      echo The file contents differ .......................>>%logfile_%
      set /a file2notSameCount_+=1
      )
    echo.>>%logfile_%
    ) else (
    echo File not found in %folder2_%>>%logfile_%
    echo.>>%logfile_%
    set /a file2notFoundCount_+=1
    )
)

:: The count results
>>%logfile_% echo %file1Count_% files in folder %folder1_%
>>%logfile_% echo %file2notFoundCount_% files not found in folder %folder2_%
>>%logfile_% echo %file2notSameCount_% file contents differ

goto _output

:: Do the comparison with subfolders included of the first folder
:_alsosub
echo Sorry, the recursive /s part is not impremented yet
goto _out
echo Patience please, this might take awhile ...
echo.
for /f "delims=" %%f in ('dir /a:-d /s /b /o:-d "%folder1_%\*.*"') do (
  echo %%~dpf>>%logfile_%
  dir /-c "%%~ff"|find /i "%%~nxf">>%logfile_%
  if exist "%folder2_%\%%~nxf" (
    dir /-c "%folder2_%\%%~nxf" |find /i "%%~nxf">>%logfile_%
    fc /b "%%~ff" "%folder2_%\%%~nxf" > nul
    if !errorlevel! GTR 0 echo The file contents differ .......................>>%logfile_%
    echo.>>%logfile_%
  ) else (
    echo File not found in %folder2_%>>%logfile_%
    echo.>>%logfile_%
    )
)

goto _output

:: Display the results
:_output
set listprog=
if "%USERNAME%"=="tsadmin" set listprog=list
if "%USERNAME%"=="ts"      set listprog=list
if "%USERNAME%"=="es"      set listprog=list
if "%USERNAME%"=="x"       set listprog=list
if "%pcid_%"=="tscd"       set listprog=list91k
if defined listprog (
  type %logfile_%|%listprog% /s
  ) else (
  type %logfile_%|more)

:: Clean up, rem-comment away if you wish to retain the logfile
:_out
for %%f in ("%temp_%\compfoldLockfile.tmp"
             %logfile_%) do if exist %%f del %%f
endlocal & goto :EOF
