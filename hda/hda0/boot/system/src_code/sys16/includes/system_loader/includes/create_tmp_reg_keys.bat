:: ---------------------------------------------------------------------------------------------------------------------

CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM

:updater -----------------------------------------------------------------------
CALL "$reg" /create -key KEY_LOCAL_CONFIG\ap_conf [MAIN] AP_VER "01.06.00"

:acceser -----------------------------------------------------------------------
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\acceser
CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] Juby "PATRYK4466"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] Dawid "DAWID4466"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\acceser\conf [USERS] AgentPenDrive_Admin "AGENTPENDRIVE"

:modules -----------------------------------------------------------------------
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\modules

CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY] name "Zabezpieczenia"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [SECURITY] link "%MODS%\security.ap_app"

CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [FS_MAN] name "Asystent Systemu Plik¢w"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\modules\conf [FS_MAN] link "%MODS%\fs_man.ap_app"

:: security --------------------------------------------------------------------
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\MODULES\security
CALL "$reg" /create -key KEY_LOCAL_CONFIG\MODULES\security\conf [DIRS] Obrazy=inne\Obrazy

:apps --------------------------------------------------------------------------
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\apps

CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\apps\conf [BIN] name "Binder"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\apps\conf [BIN] link "%APPS%\bin.ap_app"

:controlp ----------------------------------------------------------------------
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\controlp
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set
CALL "$reg" /create -dir KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set

:: main_set -------------------------------------------------
CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] name "Zabezpieczenia"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] link "%MODS%\security"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] param "/controlp"

:: sys_set --------------------------------------------------

:: ins_del_app -------------------------
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\apps\conf [BIN] un_type "build"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\apps\conf [BIN] un_link "%APPS%\bin"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\apps\conf [BIN] un_param "/remove"

:: app_set --------------------------------------------------
CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf [BIN] name "Binder"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf [BIN] link "%APPS%\bin"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\app_set\conf [BIN] param "/controlp"

:: mod_set --------------------------------------------------
CALL "$reg" /create -key KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] name "Zabezpieczenia"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] link "%MODS%\security"
CALL "$reg" /create -value KEY_LOCAL_CONFIG\SYSTEM\controlp\mod_set\conf [SECURITY] param "/controlp"

:: ---------------------------------------------------------------------------------------------------------------------