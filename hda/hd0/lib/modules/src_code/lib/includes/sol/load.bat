:CHECK -------------------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\lib\sol\%1" GOTO END
IF NOT EXIST "%RAM%\KERNEL\lib\sol\%1" GOTO LOAD_LIB

:LOAD_LIB ----------------------------------------------------------------------
FOR /F "tokens=1,2 delims==" %%a in (etc\mods\lib\lib.ap_conf) do IF %%a==SOL IF EXIST "%%b\%1" UNRAR x -pNkFFKV34p6e97KSDqBdSonJ2RthSaqnp9tvkNXMCtrbYAu3rvFHhsRJJKr3mgNaQG5zVsMXkCzJDtbuphC6aUfj57KQMYq46U4rMfPxhNFnGhfvYj2yCGg7dsorRdTnxndK2sGJFMvNubHTTaRVgytTrgJGT4uRQ72hY8r6mnjfXsyh2QDHPx3EdcLxEEPUcfCANu7zfPfDGdn9uqgHnHMZkYXq5cKFSMG7Fd6ntKrzpc8j2PrNWDeG3BwxeGCwTK3ZpyLhJBhydPgE57SrbwyDyuAcBD8UPAkCywkHy2FbgnfKTyBvvzytuy5vCBQRCATBwDJv6P6MBLXVKYQEYNxSM2NP45665q82ugVZwsdyCATNZaSpoQGAhVPLqmhTbPm6vFwsx9qA9JNzj7o7nv75QnfE8WYJbJe7QaXMJNNjX3hFy6dmZKPgwun5QKdsUSXatnoBzBkW4242xFMWQ2CMVpgczU4Ucsu5dh6cjQzLh4de9qBqRECctjPtDhMf9GJMqfq9wpmdSXSsNTg5XkGR4VK7DXLd6VrUAftw5danBtdPMUkaDss7NCCSZPwvanQa2J7vnGgpzUDMeonhfePuhRLG6GCEtSfU2MPNUwBUQF7uuTc9yr3fGendmqjeHYy9cNowKqRZvoUpFwXEoqku578QVRu4gtCSGrPRf6hbTBYZyo5mdNfGkNWF5R9KKc4R3h9HNQj7SHwQvZA8egeXuB4YSC94eCmGkTQy9y5rG2GBsHa6pPthQWF9YfCDhoL3F22fZw77Wd9NmHk9XdRezXNYCQ4mCeNJEep5aUBxxaLjjvSF89k8xxwzNYmQDzYHdNdN8fK6PWNxR7DqEoWBmSByhoPmnduZs8dYMpv2KJY3f3RmQeoAxqzecNZYsTpjs3HDQD62MuttWKdcp2dmQdZsrqRhJE2A79EocaNq5GhrRV4FnGrBkQubFKSQQkQoSUbvvqkYw2QNokT9rJbbZ6L7f5nwNCj7XU2SJKhEcxSZgby8maJLEVhmr4gE7ZbukCLuNtyqrRQ8tPFepPqub8e2BV78nH27KcZX6YNVf4t9hyM6NCZqaDRcZoJLvahEMH3j7gEMJxnswzXKBozcrQNRCX3yyKCLT6urLyCVwpMtoaCqWB3NSf6VDxTBHVM3sGSDEUZBJcuxMwoayPpQvTbyRuzZQMsHTJLY5bZdNTbZPXANcp48GE6Yz6pPjfXBp92SKrwXK7pZvpd8dGEmLbJKFxZpcor2WSj8HfwTLkjG9VeM4kxeUFq2DQQgDFGZYry76urhe9pNv4ZXMWC74sy8GNNKUUbjK9Qg3FXGeMU9fkxtGzYarWGybVJvfmdrTt7nyvtdGMMoxJfDHEez3nyCGHxntacM4Jy2DsELERyBZeE9jj9K68McfJX8kAkMKjePbjZfzYhZCozn78wBEJdkTBSCBCQMnv2WdsCdRmDU8CFDaCEfLhZ5kj8mmpy8jYvWRyz8jCsQFyUgAYVMGngr5PcQCbonAjHRgGqYKhfRfzxfYTt7EaXapAqsbddbVmtCth3DYGUDGRk7acCfL2PA2EsBj6dDR6GKM9Nbf9forYTZBWFNoUNNZFQHctMtYTCbsRM8qsVfReFTAL7o7kBwrRD3KQU99XK2eWz4PUJ7yPqz2VoxFpuwFyYRNkqoGzPmWNPc8XH7dx7ESTBYHwUPuk6H4VvbVJWhWbUvz33dYyhhSkFZf2faKKhe6cPsnbaJMuDMV7rk583nR8Mxys8JBPo8sBZddzortsCPXtzs22ejyrgwhNEk3tRTvgx8gkX9c2pzUosnN65LVKHCXNnrFDKBmH92txA5Yp4kbU6pqzALKJN8XAY5E96qhDRaBRDZE8Kgsf6he7tpfGWCGn7LVBBCFScH9g9eNjVFXroCXgsCpPFvAdGVeJXm2AtAg2fvJAA8spaP62STfXPgAVBf6ZZw2TwHmcCucD35sBjW4AgJYvqYRsDnS5hjpes9Ru4txvWqxFM2Fta5oZuDRyqa48TRMKr4DTWBPksLqDdwwM2jdVovTd5nLoDXx "%%b\%1" "%RAM%\KERNEL\lib\sol">nul

:FIND_WORK_DIR -----------------------------------------------------------------
IF EXIST "%RAM%\KERNEL\lib\sol\%1" DIR "%RAM%\KERNEL\lib\sol\%1\*.*" /b /ad /one>"%RAM%\KERNEL\lib\sol\$temp_name.ap_ini"

:SET_PATH_DIR ------------------------------------------------------------------
FOR /F "delims==" %%a in (%RAM%\KERNEL\lib\sol\$temp_name.ap_ini) do PATH %RAM%\KERNEL\lib\sol\%1\%%a;%PATH%

:DEL_TMP_NAME_FILE -------------------------------------------------------------
DEL "%RAM%\KERNEL\lib\sol\$temp_name.ap_ini"

:REGISTER_LIB ------------------------------------------------------------------
ECHO %1>>"%RAM%\KERNEL\lib\sol\$act_lib.ap_ini"

:END ---------------------------------------------------------------------------