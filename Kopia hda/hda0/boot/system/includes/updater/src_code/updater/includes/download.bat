:: DOWNLOAD_UPDATE_INFO_FILE ---------------------------------------------------
FTP -s:%FTP%\updater\upd_dwn.ap_ftp

:: CREATE_DOWNLOAD_FILE --------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (ver.ap_ini) do (
  IF %%a==HOST SET HOST=%b
  IF %%a==USER SET USER=%b
  IF %%a==PASS SET PASS=%b
  IF %%a==FILE SET FILE=%b
)

:: CREATE_DOWNLOAD_FILE --------------------------------------------------------
ECHO OPEN %HOST%>"%TMP%\SYSTEM\updater\download\update.ap_ftp"
ECHO %USER%>"%TMP%\SYSTEM\updater\download\update.ap_ftp" 
ECHO %PASS%>"%TMP%\SYSTEM\updater\download\update.ap_ftp"
ECHO GET "%FILE%">"%TMP%\SYSTEM\updater\download\update.ap_ftp"
ECHO CLOSE>"%TMP%\SYSTEM\updater\download\update.ap_ftp"
ECHO QUIT>"%TMP%\SYSTEM\updater\download\update.ap_ftp"
GOTO CREATE_FTP_TEMP 

:: CREATE_FTP_TEMP -------------------------------------------------------------
IF NOT EXIST "%TMP%\SYSTEM\updater\download" MKDIR "%TMP%\SYSTEM\updater\download"    

:: DOWNLOAD_UPDATE_FILE --------------------------------------------------------
FTP -s:%TMP%\SYSTEM\updater\download\update.ap_ftp>nul

:: MOVE_TO_TEMP_FTP_FILE -------------------------------------------------------
MOVE "%FILE%" "%TMP%\SYSTEM\updater\download"     

:: RUN_UPDATE ------------------------------------------------------------------
CALL "$run" -upd %TMP%\SYSTEM\updater\download\%FILE%
IF %ERROR%=1 GOTO UPDATE_FALSE
IF %ERROR%=0 GOTO UPDATE_TRUE

:UPDATE_FALSE
ECHOC 0 10 An error has accured while trying to update!
SET UPDATE_download=0
SET ERROR=1
GOTO END                      

:UPDATE_TRUE
ECHOC 0 13 Update Succesfully!
SET UPDATE-download=1 
SET ERROR=0
GOTO END  
    
:: -----------------------------------------------------------------------------

:END      
RMDIR /Q /S "%TMP%\KERNEL\updater\download"