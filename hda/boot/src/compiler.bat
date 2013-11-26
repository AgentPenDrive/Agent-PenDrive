@ECHO OFF
TITLE Agent PenDrive Boot Compiler
CLS

:CACHE =========================================================================
CLS
IF EXIST "*.ap_bin" (
  ECHO Removing cache...
  DEL "*.ap_bin"
)

:COMPILER ======================================================================
CLS
DIR /b /ad /one  >"$tmp_list_dir.ap_ini"
FOR /F %%a in ($tmp_list_dir.ap_ini) do CLS & 7z a -t7z -m0=PPMd -mhe -prfywYDhhU39wUxrQNNbNdzATzNct9CrYjpUHtCqM5YJqWAEbNgpsfpKfCn9bqYA9NUgFX7Ttw3hS3otg4g8J6hp85XJToJtA59GsF2kBu3TWPLChtasXSgwnDFFrPysk8zcdZWeUpygDKjnCTd2bTWWX34Nh2F3yEDb62QqQN7TXPF28jsHCN6ZgyeYZkrXqvzVVQLc4hwsxBT6mKeoYJNEHs48cUw2QwobLyNfgJ8eKrJvAojYww5EpydZT9s95 "%%a.ap_bin" "%%a"
DEL "$tmp_list_dir.ap_ini"

:REMOVE ========================================================================
CLS
ECHO.
ECHO Removing previous kernel...
ECHO Removing previous bootstrap...
IF EXIST "..\*.ap_bin" DEL "..\*.ap_bin"

:MOVE ==========================================================================
ECHO.
ECHO Installing new kernel...
ECHO Installing new bootstrap...
IF EXIST "*.ap_bin" MOVE "*.ap_bin" "..\"

:END ---------------------------------------------------------------------------
CLS