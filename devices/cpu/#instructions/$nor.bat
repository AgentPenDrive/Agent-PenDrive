:INSTRUCTION -------------------------------------------------------------------
IF "%1"=="0" (
  IF "%2"=="0" (
    SET $out=1
    GOTO END
  )
  IF "%2"=="1" (
    SET $out=0
    GOTO END
  )
)
IF "%1"=="1" (
  IF "%2"=="0" (
    SET $out=0
    GOTO END
  )
  IF "%2"=="1" (
    SET $out=0
    GOTO END
  )
)

:END ---------------------------------------------------------------------------