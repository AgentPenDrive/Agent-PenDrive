@ECHO OFF
TITLE Agent PenDrive Kernel Compiler
CLS

:DEL ---------------------------------------------------------------------------
CLS
IF EXIST "..\*.ap_bin" DEL "..\*.ap_bin"
IF EXIST "*.ap_bin" DEL "*.ap_bin"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
:COMPILER ----------------------------------------------------------------------
CLS
FOR /F %%a in ('DIR /b /ad /one') do (
  FOR /F "tokens=1 delims=-" %%b IN ("%%a") DO (
    IF %%b==fusion ECHO Compiling Bootstrap...
    IF %%b==ufe ECHO Compiling Kernel...
    IF NOT %%b==fusion IF NOT %%b==ufe ECHO Compiling other boot file...
  )
  7Z A -T7Z "%%a.ap_bin" "%%a" -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>nul
  FOR /F "tokens=1 delims=-" %%b IN ("%%a") DO (
    IF %%b==fusion ECHO Bootstrap compilation completed successfully!
    IF %%b==ufe ECHO Kernel compilation completed successfully!
    IF NOT %%b==fusion IF NOT %%b==ufe ECHO Compiling other boot file...
  )
  ECHO -------------------------------------------------------------------------------
)

:MOVE --------------------------------------------------------------------------
ECHO Installing Kernel and Bootstrap...
MOVE "*.ap_bin" "..\"
IF NOT EXIST "*.ap_bin" IF EXIST "..\*.ap_bin" ECHO Installation Completed!
IF EXIST "*.ap_bin" ECHO Error! Installation interrupted! Please check Your read-write privileges.
ECHO -------------------------------------------------------------------------------

:END ---------------------------------------------------------------------------
PAUSE