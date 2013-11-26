:PARAM_CHECK -------------------------------------------------------------------
IF "%1"=="/procedure" GOTO PROCEDURE
IF "%1"=="/function" GOTO FUNCTION
IF "%1"=="" GOTO ERROR_LIB-DLL_0A-0004

:CHECK -------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\dll\procedures\%1" IF NOT EXIST "%RAM%\KERNEL\lib\dll\functions\%1" GOTO ERROR_LIB-DLL_0A-0004
IF EXIST "%RAM%\KERNEL\lib\dll\%1" GOTO EXECUTE
IF EXIST "%RAM%\KERNEL\lib\dll\%1" GOTO ERROR_LIB-DLL_0A-0003
IF NOT EXIST "%ROOT%\%2" GOTO END
IF "%3"=="/global" IF NOT EXIST "%2" GOTO END


:EXECUTE -----------------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\lib\dll\procedures\%1" (
  CALL "%RAM%\KERNEL\lib\dll\procedures\%1" %2 %3 %4 %5 %6 %7 %8 %9 
  GOTO END
)
IF EXIST "%RAM%\KERNEL\lib\dll\functions\%1" (
  CALL "%RAM%\KERNEL\lib\dll\functions\%1" %2 %3 %4 %5 %6 %7 %8 %9  (
  GOTO END
)
GOTO ERROR_LIB-DLL_0B-0004

:REGISTER_LIB ------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\lib\dll\$act_lib.ap_ini" ECHO [ACTIVE_DLL_LIBS]>"%RAM%\KERNEL\lib\dll\$act_libs.ap_ini"
ECHO %RANDOM:~0,3%=%1>>"%RAM%\KERNEL\lib\dll\$act_libs.ap_ini"

:: ERRORS ----------------------------------------------------------------------

:ERROR_LIB-DLL_0A-0004
CLS
FOR /F "tokens=1,2 delims==" %%a in (%SHARE%\langs\lib\modules\lib\%AP_LANG%.ap_lng) do IF %%a==ERROR_FUSION_0B-0007-001 (
  IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
    IF EXIST "WBAT.COM" CALL "WBAT" BOX %%b OK
    IF NOT EXIST "WBAT.COM" CLS & ECHO %%b & PAUSE
  )
  IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" CLS & ECHO %%b & PAUSE
)
GOTO END

:: -----------------------------------------------------------------------------

:END ---------------------------------------------------------------------------