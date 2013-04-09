:CHECK -------------------------------------------------------------------------
IF %1==-all RMDIR /Q /S "%RAM%\KERNEL\lib\sol"
IF NOT %1==-all RMDIR /Q /S "%RAM%\KERNEL\lib\sol\%1"