IF %1==-encrypt GOTO ENCRYPT
IF %1==-decrypt GOTO DECRYPT
GOTO END

:ENCRYPT -----------------------------------------------------------------------
IF EXIST "ap.ap_crp" GOTO END
:: MADE_AP_FILES_FOLDER ----------------
IF NOT EXIST "AP_FILES" MD "AP_FILES"

:: GETTING_DATA ------------------------
CALL "$reg" -dir_list MODULES\security\list %RAM%\MODULES\security\list.xml
FOR /F "delims=" %%a in (%RAM%\MODULES\security\list.xml) do MOVE "%%a" "AP_FILES"

:: CRYPYING ----------------------------
"RAR" a -k -pqg5yPgmytLTBaEoxmMzAe5SHMrAKbwU2dqYs6KrYWJZwNNuz2uAEXSMbHMmkJEKnu9dZk5pFdPCs3wrtrsxNJKpSW9C6dMR8nvx6YncCAeu3bmU2cSen34EqBGUfTcNE8KaxwMzxruY2ektRC7C5zGUBNfg7RucqEMoBYoyPgXgVG9cJFeeFmyGzdp6vjHmpU8qjUpyBLfWSNy3UcGZXE8WjWteFAYuVxjDR7CThhfAwd4QQagdfPAXbuBgu2aPXTTfrWy9DeazRCQ8dxKSLLfoEh4zJDP7X8LNvKoypWyFZPdCLpUWzAJDjdCshRXEqaTkkFj94hetwRvHFQ6EQfJySLrA4NFTpYC96nGy5nsZDn8JCDNSjWRB9GBCVGVK7YjCKrAedtEgfdrhgDzY2R2AY3CmaXwFneHx6JcJChrhUgYBmY2MgsMETPrudnzZ2HWxSzFUgwBAc2CWq496UnbeB28eM8Deg2bzZgUGdVHPoKccdLHyxkdyKKdXjhCZHdY9UjfxEoMtxp5bAd9yWLx8WawFRy7Zcwywfeuk3FdZvHBvmatHnqgJZdQhcnGNjFKXkDHMJmcDtdzeNtnAj4KHF2qjNxxwCGToL2zVMcZEQYj5S66AygJEGzpUwmQytanEBmZNXqTePBH88e87Uhb2gZncKBbDcWHdG8s6XKKdLSKkxjQRZsjFR5j37T6HfdnoLdTao4MznXjjFyA7qjdGNV9kfDtUheHtS23EufEgCoYJnZgcHTjWfSFVVzgCdpwwQYAKDFrGtQRffxSoRBJxTQSePyhtndpCBqMFvCNpS55x2nmjovfFLxmZw3TjFHmHyxNuA3jTwMQXzBFnwntGke8fGsXMAHVyFasFBaYxofVng29dN3mxFScMKAZKHmHPUAUVakTWYeJFFhjTJ5RPou3xusGCcQRxQbSrVcNkQWrVDafNDw4rqvojnvnYKCV2eeSzQ6k6tasxK8KN4dDT9sCUopkyrFY5kh5AMP7EpXCyvMMYrRhYJkkw94uY9 "ap.ap_crp" "AP_FILES">nul
ATTRIB +H +S "ap.ap_crp"

:: DELETING ----------------------------
RMDIR /Q /S "AP_FILES"

GOTO END

:DECRYPT -----------------------------------------------------------------------
IF NOT EXIST "ap.ap_crp" GOTO END

:: DECRYPTING --------------------------
"UNRAR" x -pqg5yPgmytLTBaEoxmMzAe5SHMrAKbwU2dqYs6KrYWJZwNNuz2uAEXSMbHMmkJEKnu9dZk5pFdPCs3wrtrsxNJKpSW9C6dMR8nvx6YncCAeu3bmU2cSen34EqBGUfTcNE8KaxwMzxruY2ektRC7C5zGUBNfg7RucqEMoBYoyPgXgVG9cJFeeFmyGzdp6vjHmpU8qjUpyBLfWSNy3UcGZXE8WjWteFAYuVxjDR7CThhfAwd4QQagdfPAXbuBgu2aPXTTfrWy9DeazRCQ8dxKSLLfoEh4zJDP7X8LNvKoypWyFZPdCLpUWzAJDjdCshRXEqaTkkFj94hetwRvHFQ6EQfJySLrA4NFTpYC96nGy5nsZDn8JCDNSjWRB9GBCVGVK7YjCKrAedtEgfdrhgDzY2R2AY3CmaXwFneHx6JcJChrhUgYBmY2MgsMETPrudnzZ2HWxSzFUgwBAc2CWq496UnbeB28eM8Deg2bzZgUGdVHPoKccdLHyxkdyKKdXjhCZHdY9UjfxEoMtxp5bAd9yWLx8WawFRy7Zcwywfeuk3FdZvHBvmatHnqgJZdQhcnGNjFKXkDHMJmcDtdzeNtnAj4KHF2qjNxxwCGToL2zVMcZEQYj5S66AygJEGzpUwmQytanEBmZNXqTePBH88e87Uhb2gZncKBbDcWHdG8s6XKKdLSKkxjQRZsjFR5j37T6HfdnoLdTao4MznXjjFyA7qjdGNV9kfDtUheHtS23EufEgCoYJnZgcHTjWfSFVVzgCdpwwQYAKDFrGtQRffxSoRBJxTQSePyhtndpCBqMFvCNpS55x2nmjovfFLxmZw3TjFHmHyxNuA3jTwMQXzBFnwntGke8fGsXMAHVyFasFBaYxofVng29dN3mxFScMKAZKHmHPUAUVakTWYeJFFhjTJ5RPou3xusGCcQRxQbSrVcNkQWrVDafNDw4rqvojnvnYKCV2eeSzQ6k6tasxK8KN4dDT9sCUopkyrFY5kh5AMP7EpXCyvMMYrRhYJkkw94uY9 "ap.ap_crp">nul
DIR "AP_FILES" /B /AD >"%RAM%\MODULES\security\list.xml"
FOR /F "delims=" %%a in (%RAM%\MODULES\security\list.xml) do MOVE "AP_FILES\%%a"

:: DELETING ----------------------------
DEL "ap.ap_crp"
PAUSE
RMDIR /Q /S "AP_FILES"

GOTO END

:END ---------------------------------------------------------------------------
DEL "%RAM%\MODULES\security\list.xml"
