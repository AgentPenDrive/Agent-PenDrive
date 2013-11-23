@ECHO OFF
TITLE Agent PenDrive Mods Compiller
CLS

:DEL ---------------------------------------------------------------------------
CLS
IF EXIST "*.ap_bin" (
  ECHO Removing cache...
  DEL "*.ap_bin"
)

:COMPILER ----------------------------------------------------------------------
CLS
FOR /F "delims=" %%a in ('DIR /b /ad /one') do (
  FOR /F "tokens=1 delims=-" %%1 IN ("%%a") DO IF %%1==fusion (
    7z a -t7z -m0=PPMd -mhe -prfywYDhhU39wUxrQNNbNdzATzNct9CrYjpUHtCqM5YJqWAEbNgpsfpKfCn9bqYA9NUgFX7Ttw3hS3otg4g8J6hp85XJToJtA59GsF2kBu3TWPLChtasXSgwnDFFrPysk8zcdZWeUpygDKjnCTd2bTWWX34Nh2F3yEDb62QqQN7TXPF28jsHCN6ZgyeYZkrXqvzVVQLc4hwsxBT6mKeoYJNEHs48cUw2QwobLyNfgJ8eKrJvAojYww5EpydZT9s95 "%%a.ap_bin" "%%a"
  )
  ECHO -------------------------------------------------------------------------------
  FOR /F "tokens=1 delims=-" %%1 IN ("%%a") DO IF %%1==ufe (
    7z a -t7z -m0=PPMd -mhe -prfywYDhhU39wUxrQNNbNdzATzNct9CrYjpUHtCqM5YJqWAEbNgpsfpKfCn9bqYA9NUgFX7Ttw3hS3otg4g8J6hp85XJToJtA59GsF2kBu3TWPLChtasXSgwnDFFrPysk8zcdZWeUpygDKjnCTd2bTWWX34Nh2F3yEDb62QqQN7TXPF28jsHCN6ZgyeYZkrXqvzVVQLc4hwsxBT6mKeoYJNEHs48cUw2QwobLyNfgJ8eKrJvAojYww5EpydZT9s95 "%%a.ap_bin" "%%a"
  )
)
PAUSE


:REMOVE ------------------------------------------------------------------------
CLS
ECHO Removing previous kernel...
ECHO Removing previous bootstrap...
IF EXIST "..\*.ap_bin" DEL "..\*.ap_bin"

:INSTALL -----------------------------------------------------------------------
CLS
ECHO Installing new kernel...
ECHO Installing new bootstrap...
MOVE "*.ap_bin" "..\"

:END ---------------------------------------------------------------------------
CLS