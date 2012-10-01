@echo off & setlocal enableextensions
echo +------------------------------------------------+
echo ^| CMD1DEMO.CMD A selection of CMD syntax tips    ^|
echo ^| By Prof. Timo Salmi http://lipas.uwasa.fi/~ts/ ^|
echo ^| Thu 3-Aug-2006 Last modified Tue 2-Feb-2010    ^|
echo +------------------------------------------------+
echo.
echo Also see http://www.netikka.net/tsneti/info/tscmd.php
echo for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks
echo.
::
rem This script file is part of the following collection:
rem   ftp://garbo.uwasa.fi/pc/link/tscmd.zip
rem   http://garbo.uwasa.fi/pub/pc/link/tscmd.zip
rem   Useful NT/2000/XP script tricks and tips, T.Salmi
rem Please do not distribute separately from that package.
rem
::
pause
set var_=abcdefghij
echo      1234567890
echo var_ %var_%
echo %%var_:~0,2%% %var_:~0,2%
echo %%var_:~3,2%% %var_:~3,2%
echo %%var_:~3%% %var_:~3%
echo %%var_:~-2%% %var_:~-2%
echo %%var_:~3,-2%% %var_:~3,-2%
echo.
set var_=1200
echo var_ %var_%
set LeadZero=0000%var_%
echo LeadZero=0000%%var_%% %LeadZero%
echo %%LeadZero:~-4%% %LeadZero:~-4%
echo.
set var_=800
echo var_ %var_%
set LeadZero=0000%var_%
echo LeadZero=0000%%var_%% %LeadZero%
echo %%LeadZero:~-4%% %LeadZero:~-4%
echo for /f "tokens=* delims=0" %%%%a in ('echo %%LeadZero%%') do echo %%%%a
for /f "tokens=* delims=0" %%a in ('echo %LeadZero%') do echo %%a (No lead zeros)
echo %%LeadZero:0=%% %LeadZero:0=% (No zeros at all)
::
echo.
echo %%~0 %~0
echo %%~f0 %~f0
echo %%~d0 %~d0 %%~p0 %~p0 %%~n0 %~n0 %%~x0 %~x0 %%~s0 %~s0
echo %%~a0 %~a0 %%~t0 %~t0 %%~z0 %~z0
echo.
::
pause
::
set var_=a1 a2 a3 a4 a5 a6
echo var_ %var_%
echo.
echo for /f "tokens=1-3 delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b;%%%%c
for /f "tokens=1-3 delims= " %%a in ('echo %var_%') do echo %%a;%%b;%%c
echo.
echo for /f "tokens=* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a
for /f "tokens=* delims= " %%a in ('echo %var_%') do echo %%a
echo.
echo for /f "tokens=1,* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b
for /f "tokens=1,* delims= " %%a in ('echo %var_%') do echo %%a;%%b
echo.
echo for /f "tokens=1* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b
for /f "tokens=1* delims= " %%a in ('echo %var_%') do echo %%a;%%b
echo.
echo for /f "tokens=4* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b
for /f "tokens=4* delims= " %%a in ('echo %var_%') do echo %%a;%%b
echo.
echo for /f "tokens=1,4,* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b;%%%%c
for /f "tokens=1,4,* delims= " %%a in ('echo %var_%') do echo %%a;%%b;%%c
echo.
echo for /f "tokens=2,4,* delims= " %%%%a in ('echo %%var_%%') do echo %%%%a;%%%%b;%%%%c
for /f "tokens=2,4,* delims= " %%a in ('echo %var_%') do echo %%a;%%b;%%c
::
echo.
::
pause
::
set var_=a1 a2 a3 a4 a5 a6
echo var_ %var_%
echo.
echo set rest_=%%var_%%
echo :_loop
echo for /f "tokens=1*" %%%%a in ("%%rest_%%") do (
echo   set rest_=%%%%b
echo   set last_=%%%%a
echo   if defined rest_ goto _loop)
set rest_=%var_%
:_loop
for /f "tokens=1*" %%a in ("%rest_%") do (
  set rest_=%%b
  set last_=%%a
  if defined rest_ goto _loop)
echo %%last_%% %last_%
::
pause
::
echo setlocal enableextensions enabledelayedexpansion
echo ::
echo :: Make a demo
echo mkdir C:\MYTEMP
echo echo abc.jpg^>C:\MYTEMP\abc.jpg
echo echo Me.jpg^>C:\MYTEMP\Me.jpg
echo echo Picture.jpg^>C:\MYTEMP\picture.jpg
echo ::
echo :: Rename the files sequentially
echo for /f %%%%f in ('dir /s/b C:\MYTEMP\*.jpg') do (
echo   set /a count_+=1
echo   set nro_=00000!count_!
echo   set nro_=!nro_:~-4!
echo   echo ren %%%%~ff IMG_!nro_!.JPG)
echo ::
echo :: Clean up
echo del C:\MYTEMP\*.jpg
echo rmdir C:\MYTEMP
echo.
::
setlocal enableextensions enabledelayedexpansion
mkdir C:\MYTEMP
echo abc.jpg>C:\MYTEMP\abc.jpg
echo Me.jpg>C:\MYTEMP\Me.jpg
echo Picture.jpg>C:\MYTEMP\picture.jpg
for /f %%f in ('dir /s/b C:\MYTEMP\*.jpg') do (
  set /a count_+=1
  set nro_=00000!count_!
  set nro_=!nro_:~-4!
  echo ren %%~ff IMG_!nro_!.JPG)
del C:\MYTEMP\*.jpg
rmdir C:\MYTEMP
::
pause
::
echo.
echo for %%%%a in ("<this>|<is>|<only>|<a>|<TEST>") do echo %%%%~a
for %%a in ("<this>|<is>|<only>|<a>|<TEST>") do echo %%~a
echo.
echo echo "<this>|<is>|<only>|<a>|<TEST>"
echo "<this>|<is>|<only>|<a>|<TEST>"
echo.
echo ^<nul (set /p z="Testline 1 ")
echo ^<nul (set /p z="Testline 2 ")
<nul (set /p z="Testline 1 ")
<nul (set /p z="Testline 2 ")
endlocal & goto :EOF
