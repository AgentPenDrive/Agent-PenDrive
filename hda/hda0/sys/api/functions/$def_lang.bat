:CHECK_EXISTING_IN_LOCAL_LANG_DIR ----------------------------------------------
IF EXIST "langs\%AP_LANG%.*" SET def_lang=langs\%AP_LANG%
IF NOT EXIST "langs\%AP_LANG%.*" GOTO CHECK_EXISTING_IN_ADITIONAL_LANG_DIR

:CHECK_EXISTING_IN_ADITIONAL_LANG_DIR ------------------------------------------
IF EXIST "%MODS%\%1\langs\%AP_LANG%.*" SET def_lang=%BIN%\MODS\%1\langs\%AP_LANG%
IF NOT EXIST "%MODS%\%1\langs\%AP_LANG%.*" SET def_lang=ERRORLEVEL-101