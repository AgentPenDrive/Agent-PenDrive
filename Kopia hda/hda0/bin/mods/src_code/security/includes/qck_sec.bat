IF %1==-lock GOTO LOCK
IF %1==-unlock GOTO UNLOCK
GOTO END

:LOCK --------------------------------------------------------------------------
IF EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" GOTO END
:: MADE_AP_FILES_FOLDER ----------------
IF NOT EXIST "AP_FILES" MD "AP_FILES"
:: -------------------------------------

:: MENU
CALL "$reg" -dir_list MODULES\security\list %RAM%\MODULES\security\list.xml
FOR /F "delims=" %%a in (%RAM%\MODULES\security\list.xml) do MOVE "%%a" "AP_FILES"
RENAME "AP_FILES" "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ATTRIB +H +S "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
GOTO END

:UNLOCK ------------------------------------------------------------------------
IF NOT EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" GOTO END
ATTRIB -H -S "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
DIR "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" /B /AD >%RAM%\MODULES\security\list.xml
FOR /F "delims=" %%a in (%RAM%\MODULES\security\list.xml) do MOVE "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}\%%a"
RMDIR /Q /S "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
GOTO END

:END ---------------------------------------------------------------------------
DEL "%RAM%\MODULES\security\list.xml"
