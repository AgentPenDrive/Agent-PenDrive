:: DOWNLOAD_UPDATE_FILE --------------------------------------------------------
FTP -s:%FTP%\updater\upd_chk.ap_ftp>nul
IF NOT EXIST "ver.ap_ini" (
  CLS
  CALL "W.BAT" BOX @%SYSTEM_DIR%\langs\updater\%AP_LANG%.xml:ERROR_NO_CONNECTION
  GOTO UPDATE_FALSE
)

:: GET_CURRENT_VERSION_NR ------------------------------------------------------
CALL "$reg" /load KEY_LOCAL_CONFIG\ap_conf [MAIN] AP_VER AP_VER

:: CHECK_UPDATE ----------------------------------------------------------------
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (ver.ap_ini) do IF %%a==VER (
  IF %%b==1.6 (
    IF "%%c" LEQ "%AP_VER%" GOTO UPDATE_FALSE
  )
)
FOR /F "eol=# tokens=1,2,3 delims==" %%a in (ver.ap_ini) do IF %%a==VER (
  IF %%b==1.6 (
    IF "%%c" GTR "%AP_VER%" GOTO UPDATE_TRUE
  )
)

:UPDATE_FALSE ------------------------------------------------------------------
SET RESULT=false
GOTO END

:UPDATE_TRUE -------------------------------------------------------------------
SET RESULT=true
GOTO END

:END ---------------------------------------------------------------------------
SET AP_VER=