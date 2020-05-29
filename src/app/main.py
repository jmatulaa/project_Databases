from zapytania import *

haslo = ""

print("Wybierz, w jaki sposób chcesz korzystać z aplikacji: ")
print("\t1. Gość - tylko przeglądanie danych")
print("\t2. Admin - możliwość dodawania, usuwania, modyfikacji rekordów.")
wybor_logowania = input("Wybierz numer: ")
while wybor_logowania != "1" and wybor_logowania != "2":
    wybor_logowania = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")

if wybor_logowania == "2":
    haslo = input("Podaj haslo: ")
    # haslo dla admina: rpn_admin

    while haslo != "rpn_admin":
        print("Błędne hasło admina")
        haslo = input("Spróbuj jeszcze raz lub wpisz 'koniec' aby wyjść z aplikacji: ")
        if haslo == "koniec":
            exit(0)

#wyswietlanie_rep_danego_kraju(wybor_logowania)

# wyswietlenie_zawodnikow_klubow_na_danej_pozycji()

# wyswietlenie_klubow_wygranych_ligi()

# wyswietlenie_punktow_w_ligach()

print("7. Wybierz, z jakich wyników chcesz wyświetlić wartość średnią:")
print("\ta. Wiek zawodników")
print("\tb. Liczba drużyn w ligach")
print("\tc. Ilość punktów uzyskanych we wszystkich ligach")
wybor_sredniej = input("Wybierz literkę (a, b lub c): ")
while wybor_sredniej != "a" and wybor_sredniej != "b" and wybor_sredniej != "c":
    wybor_sredniej = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
liczenie_srednich(wybor_sredniej)

# numer_zapytania = input("Wprowadz numer zapytania: ")
