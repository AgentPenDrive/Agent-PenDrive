@ECHO OFF
TITLE Agent PenDrive Libs Compiller
CLS

:INITIAL_SETUP
CLS

:COMPILER
CLS         
CLS  
CALL "RAR" a -k -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 "hal.ap_sys" "hal"

CLS

:DEL ---------------------------------------------------------------------------
ECHO.
ECHO -------------------------------------------------------------------------------
ECHO Erasing previous Libs...
DEL "..\hal.ap_sys"
ECHO Erasing Finished!
ECHO -------------------------------------------------------------------------------

:MOVE --------------------------------------------------------------------------
ECHO.
ECHO -------------------------------------------------------------------------------
ECHO Adding new Libs...
MOVE "*.ap_sys" "..\"
ECHO Adding Finished!
ECHO -------------------------------------------------------------------------------

:FINISH ------------------------------------------------------------------------
ECHO.
ECHO Compilation Finished!
PAUSE

:END
ECHO.