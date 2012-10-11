:PROPER ------------------------------------------------------------------------
FOR /F "eol=[ tokens=1,2 delims==" %%a in (%APDATA%\hd0\A\etc\conf\ufe\kernel.ap_conf) do IF %%a==KERNEL_LOAD_TYPE SET TYPE=%%b

:Loading_System... -------------------------------------------------------------
ECHO.
IF %TYPE%==1 (
  ECHOC 0 14 Loading System...
  GOTO Loading_Components...
)
  IF %TYPE%==2 (
  GOTO TYPE_2
)

:Creating_Registry... ----------------------------------------------------------
ECHO.
ECHOC 0 15 Creating Registry...
CALL "$reg" /reg -md_keyfile KEY_LOCAL_CONFIG
CALL "$reg" /reg -load KEY_LOCAL_CONFIG

IF EXIST "%REG_DIR%\KEY_LOCAL_CONFIG.ap_reg" (
ECHOC 0 10 OK
GOTO Creating_Keys...
)
IF NOT EXIST "%REG_DIR%\KEY_LOCAL_CONFIG.ap_reg" (
ECHOC 0 12 FAIL
GOTO ERROR_CANT_CREATE_REG
)

:Creating_Keys... --------------------------------------------------------------
ECHO.
ECHOC 0 15 Creating Keys...
CALL "includes\system_loader\includes\create_tmp_reg_keys.bat"
CALL "$reg" /reg -save_state KEY_LOCAL_CONFIG
CALL "$reg" /reg -kill KEY_LOCAL_CONFIG

IF EXIST "%RAM%\KERNEL\reg" (
ECHOC 0 10 OK
GOTO Loading_Registry...
)
IF NOT EXIST "%RAM%\KERNEL\reg" (
ECHOC 0 12 FAIL
GOTO ERROR_CANT_CREATE_KEYS
)

GOTO ERROR

:Loading_Registry... -----------------------------------------------------------
ECHO.
ECHOC 0 15 Loading Registry...
CALL "$reg" /reg -load_defaults

IF EXIST "%RAM%\KERNEL\reg" (
ECHOC 0 10 OK
GOTO OK
)
IF NOT EXIST "%RAM%\KERNEL\reg" (
ECHOC 0 12 FAIL
GOTO ERROR_CANT_LOAD_REG
)

GOTO ERROR

:: TYPE_2 ----------------------------------------------------------------------

:TYPE_2
CLS
COLOR 9F

:: -----------------------------------------------
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
ECHO                   ษออออออออออออออออออออออออออออออออออออป
ECHO                   บ                                    บ
ECHO                   บ  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛฒฒฒฒฒฒฒฒฒฒฒ  บ
ECHO                   บ                                    บ
ECHO                   ศออออออออออออออ ( 60%%) ออออออออออออออผ
:: -----------------------------------------------
:: CALL "$reg" /reg -rm_keyfile KEY_LOCAL_CONFIG
:: CALL "$reg" /reg -md_keyfile KEY_LOCAL_CONFIG
:: CALL "$reg" /reg -load KEY_LOCAL_CONFIG
:: IF NOT EXIST "%RAM%\KERNEL\reg" GOTO ERROR_CANT_CREATE_REG
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
ECHO                   ษออออออออออออออออออออออออออออออออออออป
ECHO                   บ                                    บ
ECHO                   บ  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛฒฒฒฒฒฒฒฒฒ  บ
ECHO                   บ                                    บ
ECHO                   ศออออออออออออออ ( 70%%) ออออออออออออออผ
:: -----------------------------------------------
:: CALL "includes\system_loader\includes\create_tmp_reg_keys.bat"
:: CALL "$reg" /reg -save_state KEY_LOCAL_CONFIG
:: CALL "$reg" /reg -kill KEY_LOCAL_CONFIG
:: IF NOT EXIST "%RAM%\KERNEL\reg" GOTO ERROR_CANT_CREATE_KEYS
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
ECHO                   ษออออออออออออออออออออออออออออออออออออป
ECHO                   บ                                    บ
ECHO                   บ  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛฒฒฒฒฒฒ  บ
ECHO                   บ                                    บ
ECHO                   ศออออออออออออออ ( 85%%) ออออออออออออออผ
:: -----------------------------------------------
:: CALL "$reg" /reg -load_defaults
:: IF NOT EXIST "%RAM%\KERNEL\reg" GOTO ERROR_CANT_LOAD_REG
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
ECHO                   ษออออออออออออออออออออออออออออออออออออป
ECHO                   บ                                    บ
ECHO                   บ  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛฒฒฒ  บ
ECHO                   บ                                    บ
ECHO                   ศออออออออออออออ ( 60%%) ออออออออออออออผ
:: -----------------------------------------------
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
ECHO                   ษออออออออออออออออออออออออออออออออออออป
ECHO                   บ                                    บ
ECHO                   บ  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ  บ
ECHO                   บ                                    บ
ECHO                   ศออออออออออออออ (100%%) ออออออออออออออผ
CLS
ECHO _
CLS
ECHO _
CLS
ECHO _
CLS
ECHO _
CLS
ECHO _
CLS
COLOR 07
GOTO OK
:: -----------------------------------------------

:: ERRORS ----------------------------------------------------------------------

:ERROR
ECHO.
SET ERROR=sys16, system_loader - 1
ECHO An unknown error has occured!
ECHO ERROR CODE - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_CREATE_REG
ECHO.
SET ERROR=sys16, system_loader - 101-02
ECHO An error has occured while trying to create reg!
ECHO ERROR CODE - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_CREATE_KEYS
ECHO.
SET ERROR=sys16, system_loader - 201-02
ECHO An error has occured while trying to create keys in registry!
ECHO ERROR CODE - %ERROR%
PAUSE
GOTO END

:ERROR_CANT_LOAD_REG
ECHO.
SET ERROR=sys16, system_loader - 301-02
ECHO An error has occured while trying to load keys!
ECHO ERROR CODE - %ERROR%
PAUSE
GOTO END

:: END -------------------------------------------------------------------------

:OK
SET ERROR=0

:END
