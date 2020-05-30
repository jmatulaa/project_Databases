from zapytania import *
from pomoc import *

print("\n")
# zalogowanie uzytkownika za pomoca funkcji zaiportowanej z pliku pomoc.py
log()

numer = 1

while numer != "0":
    # jesli chcesz wyjsc to daj 9 a jak nie to powtarza ci sie wszysko

    wypisanie_mozliwych_opcji()

    numer = input("Wybierz numer zapytania które chcesz uruchomić: ")
    wybor_zapytania(numer)
    if numer == "9":
        log()
    # jak chcesz zakonczyc cala apke 9
    # jak chcesz wylogowa 8

# wybor_sredniej = input("Wybierz literkę (a, b lub c): ")
# while wybor_sredniej != "a" and wybor_sredniej != "b" and wybor_sredniej != "c":
#    wybor_sredniej = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
# liczenie_srednich(wybor_sredniej)

# numer_zapytania = input("Wprowadz numer zapytania: ")