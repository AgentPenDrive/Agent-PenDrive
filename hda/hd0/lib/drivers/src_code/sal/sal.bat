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
VER >"%RAM%\KERNEL\sal\sys_NT_ver.ap_ini"

:: SET_NT_VER ------------------------------------------------------------------
FOR /F "delims=" %%a in (%RAM%\KERNEL\sal\sys_NT_ver.ap_ini) do SET NT_VER=%%a
DEL "%RAM%\KERNEL\sal\sys_NT_ver.ap_ini"

SET NT_VER=%NT_VER:~-9%
SET NT_VER=%NT_VER:~0,-1%
SET NT_VER=NT_%NT_VER%

:: CHECK_EXISTING_DRIVER_AND_LOAD ----------------------------------------------
IF EXIST "%SYS%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys" CALL "$lib" /sys -load "%SYS%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys"
IF NOT EXIST "%SYS%\drivers\sal\%NT_VER%_%PROCESSOR_ARCHITECTURE%.ap_sys" (
  WBAT Agent PenDrive Cannot find proper SAL driver. Try to use Windows Compatibility Troubleshooter to fix that problem, or download seperate SAL driver form Official Suppoort, in download section.
  PAUSE
  SET ERROR=1
)

:: END -------------------------------------------------------------------------
RMDIR /Q /S "%RAM%\KERNEL\sal"