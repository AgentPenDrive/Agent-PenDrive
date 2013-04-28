:PROPER
IF NOT EXIST "%RAM%\KERNEL\modules" MD "%RAM%\KERNEL\modules"

:: CHECKER ---------------------------------------------------------------------

:CHECK_OPTION
IF %1==/load GOTO LOAD
IF %1==/load_def GOTO LOAD_DEF
IF %1==/run GOTO RUN
GOTO END

:: OPTIONS ---------------------------------------------------------------------

:LOAD
CALL "%KERNEL_DIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %9
GOTO OK

:LOAD_DEF
CALL "%KERNEL_DIR%\includes\load_def.bat" %2 %3 %4 %5 %6 %7 %8 %9
GOTO OK

:RUN
CALL "%KERNEL_DIR%\includes\run.bat" %2 %3 %4 %5 %6 %7 %8 %9
GOTO OK


:: ERRORS ----------------------------------------------------------------------


    
:: -----------------------------------------------------------------------------

:OK
SET ERROR=0

:END
