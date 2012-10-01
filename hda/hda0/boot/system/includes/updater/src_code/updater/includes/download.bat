:: CREATE_FTP_TEMP -------------------------------------------------------------
IF NOT EXIST "%AP_TMP%\SYSTEM\updater\download" MD "%AP_TMP%\SYSTEM\updater\download"    

:: GET_CURRENT_VERSION_NR ------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\ap_conf [MAIN] AP_VER AP_VER

:: CREATE_DOWNLOAD_FILE --------------------------------------------------------
FOR /F "eol=# tokens=1,2,3,4,5,6,7 delims==" %%a in (ver.ap_inf) do IF %%a==1.6 (
  IF "%%b" GTR "%AP_VER%" (
    SET HOST=%%c
    SET USER=%%d
    SET PASS=%%e
    SET UPD_PATH=%%f
    SET FILE=%%g
  )
)

:: CREATE_DOWNLOAD_FILE --------------------------------------------------------
ECHO OPEN %HOST%>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp"
ECHO %USER%>>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp" 
ECHO %PASS%>>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp"
ECHO GET "%UPD_PATH%/%FILE%">>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp"
ECHO CLOSE>>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp"
ECHO QUIT>>"%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp"

PAUSE

:: DOWNLOAD_UPDATE_FILE --------------------------------------------------------
FTP -s:%AP_TMP%\SYSTEM\updater\download\upd_dwn.ap_ftp>nul
PAUSE

:: MOVE_TO_TEMP_FTP_FILE -------------------------------------------------------
MOVE "%FILE%" "%AP_TMP%\SYSTEM\updater\download"     

ECHO RUN UPDATE
PAUSE
:: RUN_UPDATE ------------------------------------------------------------------
CALL "$run" %AP_TMP%\SYSTEM\updater\download\%FILE% -upd
IF %ERROR%=1 GOTO UPDATE_FALSE
IF %ERROR%=0 GOTO UPDATE_TRUE

:: ERRORS ----------------------------------------------------------------------

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
RMDIR /Q /S "%AP_TMP%\SYSTEM\updater\download"
SET HOST=
SET USER=
SET PASS=
SET UPD_PATH=
SET FILE=