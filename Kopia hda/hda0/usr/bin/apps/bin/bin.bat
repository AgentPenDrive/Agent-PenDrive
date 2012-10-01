@ECHO OFF
CLS

:MENU --------------------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO         * * * * * * * * * * * * * *
ECHO         * 1.Szyfrowanie Dane      *
ECHO         * 2.O Programie           *
ECHO         * W.Wyjscie               *
ECHO         * * * * * * * * * * * * * *
ECHO.
ECHO.
ECHO.
set /p "cho=Wybierz: "
IF %cho%==1 goto BIN_MENU
IF %cho%==2 GOTO ABAUT
IF %cho%==w GOTO EXIT
IF %cho%==W GOTO EXIT
GOTO MENU

:BIN_MENU ----------------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO         * * * * * * * * * * * * * *
ECHO         * 1.Szyfruj Dane          *
ECHO         * W.Wstecz                *
ECHO         * * * * * * * * * * * * * *
ECHO.
ECHO.
ECHO.
SET /P "cho=Wybierz: "
IF %cho%==1 goto BIN_LOCK
IF %cho%==w GOTO MENU
IF %cho%==W GOTO MENU
GOTO BIN_MENU

:BIN_LOCK ----------------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO Podaj sciezke pliku ktory chcesz zaszyfrowac:
SET /P "S1=Plik 1: "
CLS
ECHO Podaj sciezke pliku ktorym chcesz go zaszyfrowac. Np:
ECHO (Plik Graficzne *.bmp, *.jpeg / *.jpg, *.png, *.gif)
ECHO (Pliki tekstowe *.txt )
SET /P "S2=:Plik 2: "
CLS
ECHO Podaj sciezke zapisu pliku
SET /P "S3=Plik 3: "
ECHO Trwa szyfrowanie danych...
COPY /B "%S1%" + "%S2%" "%S3%"
PAUSE
GOTO BIN_MENU

:ABAUT -------------------------------------------------------------------------
CLS
ECHO.
ECHO.
ECHO         * * * * * * * * * * * * * *
ECHO         * 1.Dawid Wegrzynski      *
ECHO         * * * * * * * * * * * * * *
ECHO         *       W.Wstecz          *
ECHO         * * * * * * * * * * * * * *
ECHO.
ECHO.
ECHO.
SET /P "cho=(Wstecz-W): "
IF %cho%==W goto MENU
IF %cho%==w goto MENU
GOTO ABAUT

:EXIT --------------------------------------------------------------------------
