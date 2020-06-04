import time

def log():

    global wybor
    wybor = "1"

    while wybor != "0":

        print("Wybierz, w jaki sposób chcesz korzystać z aplikacji: ")
        print("\t1. Gość - tylko przeglądanie danych")
        print("\t2. Admin - możliwość dodawania, usuwania, modyfikacji rekordów.")
        print("\t0. Koniec.")

        wybor = input("Wybierz numer: ")

        if wybor == "0":
            print("Konczymy program")
            exit(0)

        if wybor == "1":
            break
        elif wybor == "2":
            haslo = input("Podaj haslo: ")
            # haslo dla admina: rpn_admin

            licznikproblogowan = 0

            while haslo != "rpn_admin":
                print("")
                licznikproblogowan = licznikproblogowan + 1
                if licznikproblogowan < 3:
                    haslo = input("Błędne hasło admina, spróbuj jeszcze raz: ")
                else:
                    print("Przekroczono limit prób\n")
                    time.sleep(0.25)
                    break

            if haslo == "rpn_admin":
                time.sleep(0.25)
                break

        else:
            print("Błędny wybór, spróbuj ponowie.")
    print("\n")
    return wybor

    # zapisujemy numer wyboru - jako zmienną globalną której używamy w zapytania.py
    # pozwala ona zalogować się do bazy albo jako gość: login: gość, haslo: gość,
    # albo admin: login: rpn_admin, hasło: rpn_admin
    # użytkownicy są trworzeni automatycznie podczas importu bazy danych z powyższymi danymi
    # rpn_admin ma wszystkie uprawnienia dla tej bazy danych, gość ma uprawnienia read only


def wypisanie_mozliwych_opcji():
    # wyświetlenie listy możliwych operacji, użytkownik wybiera numer z klawiatury, aby dokonać zapytania
    # jesli użytkownik jest zalogowany jako gość to może wybrać tylko 1-7, admin 8-w górę
    time.sleep(0.25)
    print("Lista możliwych operacji:")
    time.sleep(0.25)
    print("1. Wyswietlanie zawodników z  reprezentacji wybranego kraju")
    time.sleep(0.15)
    print("2. Wyświetlenie wszystkich zawodników na danej pozycji, ze wszystkich klubów")
    time.sleep(0.15)
    print("3. Wyświetlenie zwycięzkich klubów podczas poszczególnych lig")
    time.sleep(0.15)
    print("4. Zliczenie ilości klubów dla tych samych parametrów: ")
    print("\ta. Siedziba (miasto, jeśli wyników jest więcej niż jeden)")
    print("\tb. Rok założenia (jeśli wyników jest więcej niż jeden)")
    print("\tc. Państwo w którym dany klub stacjonuje")
    time.sleep(0.15)
    print("5. Zestawienie punktów wszystkich klubów uzyskanych w ligach")
    time.sleep(0.15)
    print("6. Wyświetlenie rozgrywek które odbyły się w trzech danych miastach ")
    time.sleep(0.15)
    print("7. Wybierz, z jakich wyników chcesz wyświetlić wartość średnią:")
    print("\ta. Wiek zawodników")
    print("\tb. Liczba drużyn w ligach")
    print("\tc. Ilość punktów uzyskanych we wszystkich ligach")
    time.sleep(0.15)
    print("8. Wyświetlenie informacji o ligach")
    time.sleep(0.15)
    print("9. Zestawienie wszystkich remisów jakie miały miejsce do tej pory w rozgrywkach")
    time.sleep(0.15)
    if wybor == "2":
        print("10. Dodanie zawodnika")
        time.sleep(0.15)
        print("11. Dodanie klubu do bazy danych")
        time.sleep(0.15)
        print("12. Zmiana klubu danego zawodnika")
        time.sleep(0.15)
        print("13. Usunięcie klubu z bazy danych")
        time.sleep(0.15)
        print("14. Zmiana klubu zwycięskiego w danej lidze")
        time.sleep(0.15)
        print("15. Dodanie rozgrywki")

    print("16. Wylogowanie")
    time.sleep(0.15)
    print("17. Zakończenie aplikacji")
    print("\n")


def sprawdzenie_miejscowosci(wynik, nazwa_miejscowosci):
    i = 0
    while i == 0:
        for wiersz in wynik:
            if nazwa_miejscowosci == wiersz[0]:
                i = 1
        if i != 1:
            nazwa_miejscowosci = input("Nie ma takiej pozycji, spróbuj ponownie: ")
    return nazwa_miejscowosci


def pauza():
    input("\nNaciśnij dowolny klawisz aby kontynuować dalsze korzystanie z aplikacji\n")


def sprawdzenie_indeksu_klubu(zakres, tablica):
    numer_klubu = input("Wybierz numer klubu: ")
    trafienia = 0
    while trafienia == 0:
        if numer_klubu.isdigit() is True:
            if int(numer_klubu) == 0:
                break
            for i in range(zakres):
                if int(numer_klubu) == tablica[i]:
                    trafienia = 1
                    break
        if numer_klubu.isdigit() is False or trafienia == 0:
            numer_klubu = input("Nie ma takiego klubu, spróbuj ponownie: ")
    numer_klubu = int(numer_klubu)
    return numer_klubu
