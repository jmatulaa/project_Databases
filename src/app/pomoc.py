wybor = "1"


def log():
    haslo = ""

    global wybor

    while wybor != "0":
        # clear screen
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
                    print("Przekroczono limit prób")
                    #wait, bo wracamy do głównego interfejsu
                    break

            if haslo == "rpn_admin":
                break

        else:
            print("Błędny wybór, spróbuj ponowie.")
            # timer przed wyczyszczeniem ekranu, przed wyswieleniem głównego menu
    print("\n")

    # zapisujemy numer wyboru - jako zmienną globalną której używamy w zapytania.py
    # pozwala ona zalogować się do bazy albo jako gość: login: gość, haslo: gość,
    # albo admin: login: rpn_admin, hasło: rpn_admin
    # użytkownicy są trworzeni automatycznie podczas importu bazy danych z powyższymi danymi
    # rpn_admin ma wszystkie uprawnienia dla tej bazy danych, gość ma uprawnienia read only


def wypisanie_mozliwych_opcji():
    # wyświetlenie listy możliwych operacji, użytkownik wybiera numer z klawiatury, aby dokonać zapytania
    # jesli użytkownik jest zalogowany jako gość to może wybrać tylko 1-7, admin 8-w górę

    print("Lista możliwych operacji:")
    print("1. Wyswietlanie zawodników z  reprezentacji wybranego kraju")
    print("2. Wyświetlenie zawodników ze wszystkiech na danej pozycji, ze wszystkich klubów")
    print("3. Wyświetlenie zwycięzkich klubów podczas poszczególnych lig")
    print("4. Zliczenie ilości klubów dla tych samych parametrów: ")
    print("\ta. Siedziba (miasto, jeśli wyników jest więcej niż jeden)")
    print("\tb. Rok założenia (jeśli wyników jest więcej niż jeden)")
    print("\tc. Państwo w którym dany klub stacjonuje")
    print("5. Zestawienie punktów wszystkich klubów uzyskanych w ligach")
    print("6. Wyświetlenie rozgrywek które odbyły się w trzech danych miastach ")
    print("7. Wybierz, z jakich wyników chcesz wyświetlić wartość średnią:")
    print("\ta. Wiek zawodników")
    print("\tb. Liczba drużyn w ligach")
    print("\tc. Ilość punktów uzyskanych we wszystkich ligach")
    print("\n")