:: FIND_KERNEL_VER -------------------------------------------------------------
:: VER | FIND "5.1" >nul
:: IF %ERRORLEVEL% EQU 0 SET KERNEL_TYPE=NT_5.1.2600
:: VER | FIND "6.0" >nul
:: IF %ERRORLEVEL% EQU 0 SET KERNEL_TYPE=NT_6.0.6002
:: VER | FIND "6.1" >nul
:: IF %ERRORLEVEL% EQU 0 SET KERNEL_TYPE=NT_6.1.7601
:: VER | FIND "6.2" >nul
:: IF %ERRORLEVEL% EQU 0 SET KERNEL_TYPE=NT_6.2.8156
:: SET COMMANDS_TYPE=%KERNEL_TYPE%\x86

:: PROPER ----------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\sal" MD "%RAM%\KERNEL\sal"

:: FIND_KERNEL_VER -------------------------------------------------------------
VER>"%RAM%\KERNEL\sal\sys_NT_ver.ap_ini"

:: SET_NT_VER ------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\sal\sys_NT_ver.ap_ini) do SET NT_VER=%%a
DEL "%RAM%\KERNEL\sal\sys_NT_ver.ap_ini"

SET NT_VER=%NT_VER:~-9%
SET NT_VER=%NT_VER:~0,-1%
SET NT_VER=NT_%NT_VER%

:: CHECK_EXISTING_DRIVER_AND_LOAD ----------------------------------------------
IF EXIST "%LIB%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys" CALL "$lib" /sys -load "%LIB%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys" & SET ERROR=0
IF NOT EXIST "%LIB%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys" (
  FOR /F "tokens=1,2 delims==" %%a in (%SHARE%\langs\lib\drivers\sal\%AP_LANG%.ap_lng) do IF %%a==ERROR_SAL_0A-0029 (
    IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
      IF EXIST "%BIN%\cmds\wbat250\WBAT.COM" CALL "%BIN%\cmds\wbat250\WBAT" BOX %%b OK
      IF NOT EXIST "%BIN%\cmds\wbat250\WBAT.COM" CLS & ECHO %%b & PAUSE
    )
    IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
  )
  SET ERROR=1
)

:: END -------------------------------------------------------------------------
RMDIR /Q /S "%RAM%\KERNEL\sal"