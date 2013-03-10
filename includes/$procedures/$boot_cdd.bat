:CDD ---------------------------------------------------------------------------

:: CHECK_CD_EXISTING -----------------------------------------------------------
CLS
IF EXIST "%1.vme_cdd" "includes\cmds\WinRAR\UNRAR" x -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 "%1.vme_cdd">nul
IF NOT EXIST "%1.vme_cdd" GOTO HDD

:: BOOT_CD ---------------------------------------------------------------------
CLS
IF EXIST "%1\$mbr.vme_mbr" FOR /F "eol=[ tokens=1,2 delims==" %%a in (%1\$mbr.vme_mbr) do IF %%a==PRIMARY CALL "%1\%%b"
IF NOT EXIST "%1\$mbr.vme_mbr" (
  ECHO Error! This CD does not support MBR record, or isn't correct!
  ECHO Cannot be booted!
  CALL "includes\cmds\Timeout\timeout" 5
  GOTO HDD
)