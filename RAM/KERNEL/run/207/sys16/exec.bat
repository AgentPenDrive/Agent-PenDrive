:CHECK -------------------------------------------------------------------------
IF %1==-system CALL "includes\sys16\sys16.bat" & GOTO END
IF %1==-system_loader CALL "includes\system_loader\system_loader.bat" & GOTO END
IF %1=="" CALL "sys16.bat" & GOTO END
GOTO END

:END ---------------------------------------------------------------------------
SET ERRORLEVEL=

:: KERNEL LAYER ----------------------------------------------------------------
SET APP_ID=207
SET APP_DIR=C:\APDv1.6\RAM\KERNEL\run\207\sys16
CHDIR "C:\APDv1.6\hda\hda0"
