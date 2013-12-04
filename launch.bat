@ECHO OFF
TITLE Agent PenDrive Launcher
CLS

:CLEAR_RAM =====================================================================
CLS
IF EXIST "RAM" RMDIR /Q /S "RAM"
IF NOT EXIST "RAM" MKDIR "RAM"

:SET_VAR =======================================================================
SET VME_DIR=%CD%

:BOOT ==========================================================================
CLS
7z x -oRAM -prfywYDhhU39wUxrQNNbNdzATzNct9CrYjpUHtCqM5YJqWAEbNgpsfpKfCn9bqYA9NUgFX7Ttw3hS3otg4g8J6hp85XJToJtA59GsF2kBu3TWPLChtasXSgwnDFFrPysk8zcdZWeUpygDKjnCTd2bTWWX34Nh2F3yEDb62QqQN7TXPF28jsHCN6ZgyeYZkrXqvzVVQLc4hwsxBT6mKeoYJNEHs48cUw2QwobLyNfgJ8eKrJvAojYww5EpydZT9s95 "hda\boot\fusion-0.1.2.8.ap_bin"
CALL "RAM\fusion-0.1.2.8\exec.bat"

:END ---------------------------------------------------------------------------
CLS