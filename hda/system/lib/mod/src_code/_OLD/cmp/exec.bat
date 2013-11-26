IF %1==/bin (
IF %2==-plg CALL "%COMDIR%\includes\bin\ap_plg.bat"
IF %2==-mod CALL "%COMDIR%\includes\bin\ap_mod.bat"
IF %2==-upd CALL "%COMDIR%\includes\bin\ap_upd.bat"
)
IF %1==/lib (
IF %2==-dll CALL "%COMDIR%\includes\lib\ap_dll.bat"
)
