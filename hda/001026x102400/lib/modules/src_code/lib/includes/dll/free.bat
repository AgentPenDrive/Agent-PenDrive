:CHECK -------------------------------------------------------------------------
IF %1==-all RMDIR /Q /S "%RAM%\KERNEL\lib\dll"
IF NOT %1==-all RMDIR /Q /S "%RAM%\KERNEL\lib\dll\%1"