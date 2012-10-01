:: CHECKER ---------------------------------------------------------------------

:CHECK_OPTION
IF %1==/load GOTO LOAD
IF %1==/load_coms GOTO LOAD_COMS
IF %1==/run GOTO RUN
GOTO END

:: OPTIONS ---------------------------------------------------------------------

:LOAD
CALL "%KERNEL_DIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %8 %9
IF %ERROR%==coms-error_code-0 GOTO OK
IF NOT %ERROR%==coms-error_code-0 GOTO OK

:LOAD_COMS
CALL "%KERNEL_DIR%\includes\load_coms.bat" %2 %3 %4 %5 %6 %7 %8 %8 %9
IF %ERROR%==coms-error_code-0 GOTO OK
IF NOT %ERROR%==coms-error_code-0 GOTO OK

:RUN
CALL "%KERNEL_DIR%\includes\run.bat" %2 %3 %4 %5 %6 %7 %8 %8 %9
IF %ERROR%==coms-error_code-0 GOTO OK
IF NOT %ERROR%==coms-error_code-0 GOTO OK

:: ERRORS ----------------------------------------------------------------------

:ERROR_WITH_LABEL-CHECK_EXISTING
SET ERROR=kernel.bat - 101    
ECHO ERROR - %ERROR%
GOTO END

:ERROR_WITH_EXIST
SET ERROR=kernel.bat - 201    
ECHO ERROR - %ERROR%
GOTO END

:ERROR_COMPONENT_NOT_EXIST
SET ERROR=kernel.bat - 302  
ECHO ERROR - %ERROR%
GOTO END
    
:: -----------------------------------------------------------------------------

:OK
SET ERROR=0

:END
