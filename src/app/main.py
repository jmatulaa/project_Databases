from zapytania import *
from pomoc import *

print("\n")
# zalogowanie uzytkownika za pomoca funkcji zaiportowanej z pliku pomoc.py
wybor = log()

numer = 1

while numer != "0":

    wypisanie_mozliwych_opcji()
    numer = input("Wybierz numer zapytania które chcesz uruchomić: ")
    while numer.isdigit() is False or int(numer) < 1 or int(numer) > 17:
        numer = input("Nie ma takiego zapytania. Spróbuj jeszcze raz: ")
    numer = int(numer)
    if numer == 17:
        exit(0)
    if numer == 16:
        wybor = log()
        wypisanie_mozliwych_opcji()
        numer = int(input("Wybierz numer zapytania które chcesz uruchomić: "))
    else:
        wybor_zapytania(numer, wybor)

