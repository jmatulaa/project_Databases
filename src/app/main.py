from zapytania import *
from pomoc import *

print("\n")
# zalogowanie uzytkownika za pomoca funkcji zaiportowanej z pliku pomoc.py
wybor = log()

numer = 1

while numer != "0":

    wypisanie_mozliwych_opcji()
    numer = input("Wybierz numer zapytania które chcesz uruchomić: ")
    if numer == "0":
        break
    if numer == "-1":
        wybor = log()
        wypisanie_mozliwych_opcji()
        numer = int(input("Wybierz numer zapytania które chcesz uruchomić: "))
    else:
        wybor_zapytania(numer, wybor)
    #while int(numer) < -1 or int(numer) > 9:
    #    numer = input("Nie ma takiego zapytania. Spróbuj jeszcze raz: ")

