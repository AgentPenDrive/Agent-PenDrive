:CPU ---------------------------------------------------------------------------
CLS
IF NOT EXIST "devices\cpu\conf.vme_ini" CALL "includes\$procesdures\$error.bat"
FOR /F "tokens=1,2 eol=[ delims==" in (devices\cpu\conf.vme_conf) do (
  IF "%%a"=="DEV_FREQUENCY" IF %%b GTR 1 CALL "includes\$procesdures\$error.bat"
  IF "%%a"=="DEV_ARCHITECTURE" IF NOT "%%b"=="x86" OR "AMD64" CALL "includes\$procesdures\$error.bat"
)