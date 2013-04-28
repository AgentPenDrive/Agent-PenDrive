:PROPER ------------------------------------------------------------------------
IF NOT EXIST "%RAM%\KERNEL\api\browser" MKDIR "%RAM%\KERNEL\api\browser"

:CHECK -------------------------------------------------------------------------
IF %1==/dir (
  IF %2==-n GOTO DIR
  IF %2==-y GOTO DIR_SUBDIR
)
IF %1==/file (
  IF %2==-n GOTO FILE
  IF %2==-y GOTO FILE_SUBDIR
)
GOTO END

:FILE --------------------------------------------------------------------------
DIR "%3\*.*" /B /AD >"%RAM%\KERNEL\api\browser\file_list"
CALL "W.BAT" LIST @%RAM%\KERNEL\api\browser\file_list
SET RESULT=%WBAT%
DEL "%RAM%\KERNEL\api\browser\file_list"
GOTO END

:FILE_SUBDIR -------------------------------------------------------------------
GOTO END

:DIR ---------------------------------------------------------------------------
DIR "%3" /B /AD >>"%RAM%\KERNEL\api\browser\dir_list"
CALL "W.BAT" LIST @%RAM%\KERNEL\api\browser\dir_list
SET RESULT=%WBAT%
DEL "%RAM%\KERNEL\api\browser\dir_list"
GOTO END

:DIR_SUBDIR --------------------------------------------------------------------
GOTO END

:END ---------------------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\api\browser" RMDIR /Q /S "%RAM%\KERNEL\api\browser"