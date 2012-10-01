:PROPER
FOR /F "eol=[ tokens=1,2 delims==" %%a in (etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL_LOAD_TYPE SET TYPE=%%b

:Loading_Kernel... -------------------------------------------------------------
ECHO.
IF %TYPE%==1 (
  ECHOC 0 14 Loading Kernel...
  GOTO Loading_Components...
)
  IF %TYPE%==2 (
  GOTO TYPE_2
)

:: TYPE_1 ----------------------------------------------------------------------

:Loading_Components... ---------------------------------------------------------
ECHO.
ECHOC 0 15 Loading Components...
CALL "$coms" /load_coms

IF EXIST "%RAM%\KERNEL\com" (
  ECHOC 0 10 OK
  GOTO Loading_HAL...
)
IF NOT EXIST "%RAM%\KERNEL\com" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_COMS
)

GOTO ERROR

:Loading_HAL... ----------------------------------------------------------------
ECHO.
ECHOC 0 15 Loading HAL...
CALL "hal.bat"

IF %ERROR%==0 (
  ECHOC 0 10 OK
  GOTO Loading_Variables...
)
IF %ERROR%==1 (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_HAL
)

GOTO ERROR

:Loading_Variables... ----------------------------------------------------------
ECHO.
ECHOC 0 15 Loading Variables...
CALL "$var" -load_defaults

IF EXIST "%RAM%\KERNEL\var" (
  ECHOC 0 10 OK
  GOTO Loading_Libraries...
)
IF NOT EXIST "%RAM%\KERNEL\var" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_VARS
)

GOTO ERROR

:Loading_Libraries... ----------------------------------------------------------
ECHO. 
ECHOC 0 15 Loading Libraries...
CALL "$lib" /dll -load_defaults

IF EXIST "%RAM%\KERNEL\lib" (
  ECHOC 0 10 OK
  GOTO Loading_Environment_Files...
)
IF NOT EXIST "%RAM%\KERNEL\lib" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_LIBS
)

GOTO ERROR

:Loading_Environment_Files... --------------------------------------------------
ECHO.
ECHOC 0 15 Loading Environment Files...
CALL "$env" -load_defaults

IF EXIST "%RAM%\KERNEL\lib" (
  ECHOC 10 OK
  GOTO OK
)
IF NOT EXIST "%RAM%\KERNEL\lib" (
  ECHOC 0 12 FAIL
  GOTO ERROR_CANT_LOAD_ENVS
)
GOTO ERROR

:: TYPE_2 ----------------------------------------------------------------------

:TYPE_2
CLS
COLOR 9F

:: ---------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  臆臆臆臆臆臆臆臆臆臆臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� (  0%%) 様様様様様様様�
:: ---------------------------------------------
CALL "$coms" /load_coms
IF NOT EXIST "%RAM%\KERNEL\com" GOTO ERROR_CANT_LOAD_COMS
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩臆臆臆臆臆臆臆臆臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 12%%) 様様様様様様様�
:: ---------------------------------------------
CALL "hal.bat"
IF %ERROR%==1 GOTO ERROR_CANT_LOAD_HAL
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩栩朮臆臆臆臆臆臆臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 23%%) 様様様様様様様�
:: ---------------------------------------------
CALL "$var" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\var" GOTO ERROR_CANT_LOAD_VARS
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩栩栩栩臆臆臆臆臆臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 32%%) 様様様様様様様�
:: ---------------------------------------------
CALL "$lib" /dll -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_LIBS
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩栩栩栩栩栩臆臆臆臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 45%%) 様様様様様様様�
:: ---------------------------------------------
CALL "$env" -load_defaults
IF NOT EXIST "%RAM%\KERNEL\lib" GOTO ERROR_CANT_LOAD_ENVS
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩栩栩栩栩栩栩栩朮臆臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 57%%) 様様様様様様様�
:: ---------------------------------------------
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                                   LOADING
ECHO                   浜様様様様様様様様様様様様様様様様様融
ECHO                   �                                    �
ECHO                   �  栩栩栩栩栩栩栩栩栩栩朮臆臆臆臆臆  �
ECHO                   �                                    �
ECHO                   藩様様様様様様� ( 60%%) 様様様様様様様�
CLS
CLS
CLS
CLS
COLOR 07
GOTO OK
:: --------------------------------------------- 

:: ERRORS ----------------------------------------------------------------------

:ERROR
ECHO.
SET ERROR=kernel_loader.bat - 1
ECHO ERROR - %ERROR%
GOTO END

:ERROR_CANT_LOAD_COMS
ECHO.
SET ERROR=kernel_loader.bat - 101-02
ECHO ERROR - %ERROR%
GOTO END

:ERROR_CANT_LOAD_HAL
ECHO.
SET ERROR=kernel_loader.bat - 201-02
ECHO ERROR - %ERROR%
GOTO END

:ERROR_CANT_LOAD_VARS
ECHO.
SET ERROR=kernel_loader.bat - 301-02
ECHO ERROR - %ERROR%
GOTO END

:ERROR_CANT_LOAD_LIBS
ECHO.
SET ERROR=kernel_loader.bat - 401-02
ECHO ERROR - %ERROR%
GOTO END

:ERROR_CANT_LOAD_ENVS
ECHO.
SET ERROR=kernel_loader.bat - 501-02
ECHO ERROR - %ERROR%
GOTO END

:: END -------------------------------------------------------------------------

:OK
SET ERROR=0

:END
