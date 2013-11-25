@ECHO OFF
TITLE Kalkulator
CLS

:MENU
CLS
SET /P nr1="Podaj liczbe nr.1: "
SET /P op0="Podaj operator: "
SET /P nr2="Podaj liczbe nr.2: "
GOTO GET_CHECK

:GET_CHECK
CLS
CALL "calc" %nr1% %op0% %nr2%

:SEE_CHECK
CLS
ECHO %return%
PAUSE
GOTO MENU
