@echo off & setlocal enableextensions disabledelayedexpansion

echo +----------------------------------------------------+
echo ^| CMD2DEMO.CMD Another selection of CMD syntax tips  ^|
echo ^| By Prof. Timo Salmi http://lipas.uwasa.fi/~ts/     ^|
echo ^| Last modified Tue 2-Feb-2010                       ^|
echo +----------------------------------------------------+
echo.
::
if "%~1"=="?" goto _help
if "%~1"=="/?" goto _help
::
:: Choose which demo you wish to run
goto _demo2
::
rem One frequent set of questions pertains to getting the first, rest,
rem and/or the last item in the arguments (replaceable parameters)
rem of a script call. Likewise, it is often asked how the parts of a
rem file path can be parsed. This generic demo does both (without
rem resorting to the special file-related FOR arguments handling).
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
:_demo1
:: Get the string to be parsed, or use the demo1 default
set MyArguments=%~1
if "%~1"=="" set MyArguments=d:\folder 1\folder 2\folder 3
echo MyArguments=%MyArguments%
echo.
::
:: Choose the delims
(set delims_= )
echo %MyArguments%|find "\">nul
if %errorlevel% EQU 0 set delims_=\
echo %MyArguments%|find ",">nul
if %errorlevel% EQU 0 set delims_=,%delims_%
echo %MyArguments%|find ";">nul
if %errorlevel% EQU 0 set delims_=;%delims_%
::
:: Get the first part and the rest of a variable
for /f "tokens=1,* delims=%delims_%" %%a in ("%MyArguments%") do (
  set first_=%%a
  set rest_=%%b
  )
echo first_=%first_%
echo rest_ =%rest_%
::
:: Get the last part of a variable
set rest_=%MyArguments%
:_loop
for /f "tokens=1,* delims=%delims_%" %%a in ("%rest_%") do (
  set rest_=%%b
  set last_=%%a
  if defined rest_ goto _loop
  )
echo last_=%last_%
::
echo.
echo For a trivial help use CMD2DEMO /?
endlocal & goto :EOF
::
:_demo2
:: An "ugly" way to parse the replaceable command line parameters
@echo off & setlocal enableextensions disabledelayedexpansion
set n=0
for %%a in (%*) do (set /a n+=1)&(call set p[%%n%%]=%%a)
::
echo n=%n%
for /L %%i in (1,1,9) do if defined p[%%i] call echo p[%%i]=%%p[%%i]%%
for /L %%i in (2,1,9) do if defined p[%%i] call set rest_=%%rest_%% %%p[%%i]%%
if defined rest_ set rest_=%rest_:~1%
echo rest_=%rest_%
endlocal & goto :EOF
::
:_help
echo Usage: CMD2DEMO [The script parameters or a path to be parsed]
echo.
echo Default demo path: d:\folder 1\folder 2\folder 3
echo.
echo Study the code in order to see examples of parsing the ^(replaceable^)
echo parameters of a script file. Plus see e.g. item #40 in 1CMDFAQ.TXT
echo.
echo Contains more than one demo.
echo To choose which demo you wish to run edit within the script the line:
echo goto _demo1
echo Change it to goto _demo2 and the try out e.g.
echo.
echo   CMD2DEMO 1 2 3 "Hello World" "a & b!"
echo.
echo See http://www.netikka.net/tsneti/info/tscmd.php
echo for an HTML version of Assorted NT/2000/XP/.. CMD.EXE Script Tricks

