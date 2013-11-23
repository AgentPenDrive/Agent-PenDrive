@Echo OFF
CLS
TITLE Agent Pendrive - Zmiena chasla

:CHANGE
attrib -h -s "1.PASSWORD.BAT"
echo Aby zmienic haslo zedytuj plik "1.PASSWORD" ktory pojawil sie przed chwila.
echo W 12 wersie pliku, znajdziesz zdanie "if %cho%==TWOJE HASLO 2.CHECK".
echo Zamiast "TWOJE HASLO" wpisz nowe.
PAUSE
attrib +h +s "1.PASSWORD.BAT"
3.MENU.BAT