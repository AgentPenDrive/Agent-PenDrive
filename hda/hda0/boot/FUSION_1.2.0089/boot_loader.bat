:Loading_Variables...
ECHO.
"%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 15 Loading Variables...
CALL "%APDATA%\A\BOOT\boot.bat" var -load_vars
IF %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 10 OK & GOTO Loading_Libraries...
IF NOT %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 12 FAIL & GOTO ERROR_CANT_LOAD_VARS
GOTO ERROR
 
REM ----------------------------------------------------------------------------

:Loading_Libraries...
ECHO. 
"%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 15 Loading Libraries...
CALL "%APDATA%\A\BOOT\boot.bat" lib -load_libs
IF %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 10 OK & GOTO Loading_Environment...
IF NOT %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 12 FAIL & GOTO ERROR_CANT_LOAD_LIBS
GOTO ERROR

REM ----------------------------------------------------------------------------

:Loading_Environment...
ECHO. 
"%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 15 Loading Environment...
CALL "%APDATA%\A\BOOT\boot.bat" env -load_envs
IF %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 10 OK & GOTO OK
IF NOT %ERROR%==0 "%APDATA%\A\KERNEL\includes\coms\Tscmd\ECHOC" 0 12 FAIL & GOTO ERROR_CANT_LOAD_ENVS
GOTO ERROR
 
REM ERRORS ---------------------------------------------------------------------

:ERROR
SET ERROR=boot_loader.bat - 1  
ECHO ERROR - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_LOAD_VARS 
SET ERROR=boot_loader.bat - 101-02
ECHO ERROR - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_LOAD_LIBS
SET ERROR=boot_loader.bat - 201-02
ECHO ERROR - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_LOAD_ENVS 
SET ERROR=boot_loader.bat - 301-02
ECHO ERROR - %ERROR%
PAUSE
GOTO END

REM END ------------------------------------------------------------------------

:OK   
SET ERROR=0

:END
