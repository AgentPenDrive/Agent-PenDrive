:PROPER
SET CALC="%1 %2 %3 %4 %5 %6 %7 %8 %9"
GOTO CALCULETTE

:CALCULETTE
SET /A return="%CALC%"
GOTO END

:END
SET CALC=
