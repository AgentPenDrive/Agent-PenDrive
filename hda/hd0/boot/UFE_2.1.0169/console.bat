:PROPER
IF NOT EXIST "%RAM%\KERNEL\mod" MD "%RAM%\KERNEL\mod"

:: CHECKER ---------------------------------------------------------------------

:CHECK_OPTION
IF %1==/load GOTO LOAD
IF %1==/load_mods GOTO LOAD_MODS
IF %1==/run GOTO RUN
GOTO END

:: OPTIONS ---------------------------------------------------------------------

:LOAD
IF NOT EXIST "%2" WBAT BOX "ERROR! Module does not exist!" OK & GOTO END
CALL "%AP_DIR%\%KERNEL_DIR%\includes\load.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %ERROR%==mods-error_code-0 GOTO OK
IF NOT %ERROR%==mods-error_code-0 GOTO OK

:LOAD_MODS
CALL "%AP_DIR%\%KERNEL_DIR%\includes\load_mods.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %ERROR%==mods-error_code-0 GOTO OK
IF NOT %ERROR%==mods-error_code-0 GOTO OK

:RUN
CALL "%AP_DIR%\%KERNEL_DIR%\includes\run.bat" %2 %3 %4 %5 %6 %7 %8 %9
IF %ERROR%==mods-error_code-0 GOTO OK
IF NOT %ERROR%==mods-error_code-0 GOTO OK

:: ERRORS ----------------------------------------------------------------------

:ERROR_WITH_LABEL-CHECK_EXISTING
SET ERROR=kernel.bat - 101    
ECHO ERROR - %ERROR%
GOTO END

:ERROR_WITH_EXIST
SET ERROR=kernel.bat - 201    
ECHO ERROR - %ERROR%
GOTO END

:ERROR_MODULE_NOT_EXIST
SET ERROR=kernel.bat - 302  
ECHO ERROR - %ERROR%
GOTO END
    
:: -----------------------------------------------------------------------------

:OK
SET ERROR=0

:END
