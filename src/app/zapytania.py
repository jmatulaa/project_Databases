import pymysql
from pomoc import sprawdzenie_miejscowosci


def wybor_zapytania(numer, wybor):

    upr = wybor

    global usr
    if upr == "1": usr = 'gosc'
    if upr == "2": usr = 'rpn_admin'

    if numer == "1":
        wyswietlanie_rep_danego_kraju()
    if numer == "2":
        wyswietlenie_zawodnikow_klubow_na_danej_pozycji()
    if numer == "3":
        wyswietlenie_klubow_wygranych_ligi()
    if numer == "4":
        wybor_zliczania = input("Wybierz literkę (a, b lub c): ")
        while wybor_zliczania != "a" and wybor_zliczania != "b" and wybor_zliczania != "c":
            wybor_zliczania = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
        zliczenie_klubow(wybor_zliczania)
    if numer == "5":
        wyswietlenie_punktow_w_ligach()
    if numer == "6":
        wyswietlenie_rozgrywek_w_miastach()
    if numer == "7":
        wybor_sredniej = input("Wybierz literkę (a, b lub c): ")
        while wybor_sredniej != "a" and wybor_sredniej != "b" and wybor_sredniej != "c":
            wybor_sredniej = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
            liczenie_srednich(wybor_sredniej)
    if numer == "8" and upr == "2":
        dodawanie_zawodnika()
    if numer == "9" and upr == "2":
        dodanie_klubu()


def wyswietlanie_rep_danego_kraju():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql1 = "SELECT DISTINCT reprezentacja FROM zawodnik"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            tablica_panstw = ["", "", "", "", "", "", "", "", "", ""]
            i = 0
            print("Panstwa z których zawodnicy są w bazie danych: ")
            for row1 in result1:
                tablica_panstw[i] = row1[0]
                i = i + 1
                print("\t", i, ". ", row1[0])
            numer_panstwa = input("Podaj numer panstwa ktorego zawodnikow reprezentacji chcesz wyswietlic: ")
            while int(numer_panstwa) > i or int(numer_panstwa) < 1 :
                numer_panstwa = input("Nie ma takiego numeru państwa. Spróbuj ponownie: ")
            numer_panstwa = int(numer_panstwa) - 1
            sql = "SELECT id_zawodnik, imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga \
                    FROM zawodnik WHERE reprezentacja=(%s)"
            cursor.execute(sql, tablica_panstw[numer_panstwa])
            result = cursor.fetchall()

            nazwy = ("ID zawodnika", "Imie", "Nazwisko", "Pozycja", "Reprezentacja", "Wiek", "ID klubu", "Waga")
            s2 = "| {0:25} | {1:20}| {2:20}| {3:20}| {4:20}| {5:6} | {6:10} | {7:6} |"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6], nazwy[7]))
            print("{:->148}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))

    finally:
        connection.close()


def wyswietlenie_zawodnikow_klubow_na_danej_pozycji():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql1 = "SELECT DISTINCT pozycja FROM zawodnik"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            pozycja = input("Podaj pozycje zawodnikow, którą chcesz wyświetlić: ")
            i = 0
            while i == 0:
                for row1 in result1:
                    if pozycja == row1[0]:
                        i = 1
                if i != 1:
                    pozycja = input("Nie ma takiej pozycji, spróbuj ponownie: ")

            sql = "SELECT klub.nazwa_klubu, zawodnik.imie_zawodnika, zawodnik.nazwisko_zawodnika \
                    FROM klub, zawodnik WHERE zawodnik.id_klub=klub.id_klub AND zawodnik.pozycja=(%s)"
            cursor.execute(sql, pozycja)
            result = cursor.fetchall()

            nazwy = ("Nazwa klubu", "Imie", "Nazwisko")
            s2 = "| {0:25}| {1:20}| {2:20}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2]))
            print("{:->72}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2]))

    finally:
        connection.close()


def wyswietlenie_klubow_wygranych_ligi():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql = "SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu, liga.panstwo \
                    FROM liga, klub WHERE liga.id_klub_wygrany=klub.id_klub"
            cursor.execute(sql)
            result = cursor.fetchall()

            nazwy = ("Szczebel rozgrywkowy", "Klub wygrany", "Panstwo ")
            s2 = "| {0:30}| {1:20}| {2:20}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2]))
            print("{:->77}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2]))

    finally:
        connection.close()


def zliczenie_klubow(wybor_zliczania):
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            if wybor_zliczania == "a":
                sql = "SELECT COUNT(id_klub)as liczbaKlubow, siedziba FROM klub GROUP BY siedziba HAVING COUNT(id_klub) > 1"
                nazwy = ("Liczba klubów", "Siedziba")
            if wybor_zliczania == "b":
                sql = "SELECT COUNT(id_klub)as liczbaKlubow, data_zalozenia FROM klub GROUP BY data_zalozenia HAVING COUNT(id_klub) > 1"
                nazwy = ("Liczba klubów", "Rok założenia")
            if wybor_zliczania == "c":
                sql = "SELECT COUNT(id_klub)as liczbaKlubow, panstwo FROM klub GROUP BY panstwo"
                nazwy = ("Liczba klubów", "Państwo")

            cursor.execute(sql)
            result = cursor.fetchall()

            s2 = "| {0:15}| {1:20}|"
            print(s2.format(nazwy[0], nazwy[1]))
            print("{:->42}".format(""))

            for row in result:
                print(s2.format(row[0], row[1]))

    finally:
        connection.close()


def wyswietlenie_punktow_w_ligach():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql = "SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu,  wynik.punkty, wynik.rozegrane, wynik.wygrane, wynik.remisy, wynik.przegrane \
                    FROM wynik INNER JOIN liga ON wynik.id_liga=liga.id_liga \
                    INNER JOIN klub ON wynik.id_klub=klub.id_klub ORDER BY wynik.punkty DESC"
            cursor.execute(sql)
            result = cursor.fetchall()

            nazwy = ("Liga", "Klub", "Uzyskane punkty", "Ilość rozgrywek", "Ilość wygranych", "Remisy", "Przegrane")
            s2 = "| {0:25}| {1:25}| {2:17}| {3:17}| {4:17}| {5:10}| {6:10}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6]))
            print("{:->140}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2], row[3], row[4], row[5], row[6]))

    finally:
        connection.close()


def wyswietlenie_rozgrywek_w_miastach():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql1 = "SELECT DISTINCT miejscowosc FROM rozgrywka"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            i = 0
            print("Dostepne miejscowosci:")
            for row1 in result1:
                print("\t", row1[0])
                i = i + 1
            print("Podaj trzy miejscowości, w których rozgrywki chcesz wyświetlić: ")
            miejscowosc1 = input("\t1 : ")
            miejscowosc1 = sprawdzenie_miejscowosci(result1, miejscowosc1)
            miejscowosc2 = input("\t2 : ")
            miejscowosc2 = sprawdzenie_miejscowosci(result1, miejscowosc2)
            miejscowosc3 = input("\t3 : ")
            miejscowosc3 = sprawdzenie_miejscowosci(result1, miejscowosc3)

            sql = "SELECT rozgrywka.data_rozgrywki, rozgrywka.miejscowosc, k1.nazwa_klubu, rozgrywka.wynik_klub1, \
                    rozgrywka.wynik_klub2, k2.nazwa_klubu, liga.szczebel_rozgrywkowy \
                    FROM rozgrywka INNER JOIN klub k1 on rozgrywka.id_klub1=k1.id_klub \
                    INNER JOIN klub k2 on rozgrywka.id_klub2=k2.id_klub INNER JOIN \
                    liga on rozgrywka.id_liga=liga.id_liga \
                    WHERE rozgrywka.miejscowosc IN (%s, %s, %s)"
            cursor.execute(sql, (miejscowosc1, miejscowosc2, miejscowosc3))
            result = cursor.fetchall()

            nazwy = ("Data spotkania", "Miejscowość", "Klub", "Wynik", "Wynik", "Klub", "Liga")
            s2 = "| {0:21}| {1:15}| {2:22}| {3:7}| {4:7}| {5:22}| {6:25}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6]))
            print("{:->114}".format(""))

            for row in result:
                print(s2.format(str(row[0]), row[1], row[2], row[3], row[4], row[5], row[6]))

    finally:
        connection.close()


def liczenie_srednich(wybor_sredniej):
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            if wybor_sredniej == "a":
                sql = "SELECT AVG(wiek_zawodnika) FROM zawodnik"
                wypisanie = "Średni wiek wszystkich zawodnikow: "
            if wybor_sredniej == "b":
                sql = "SELECT AVG(liczba_druzyn) FROM liga"
                wypisanie = "Średnia liczba drużyn we wszystkich ligach: "
            if wybor_sredniej == "c":
                sql = "SELECT AVG(punkty) FROM wynik"
                wypisanie = "Średnia liczba punktów uzyskanych przez wszystkie drużyny:"

            cursor.execute(sql)
            result = cursor.fetchall()
            for x in result:
                print(wypisanie, x[0])

    finally:
        connection.close()


def dodawanie_zawodnika():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            print("W jakim klubie gra zawodnik?")
            sql1 = "SELECT id_klub, nazwa_klubu FROM klub"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            i = 0
            print("Dostepne kluby:")
            for row in result1:
                print("\t", row[0], ".", row[1])
                i = i + 1

            print("Jeśli zawodnik nie gra w żadnym klubie, wpisz 0")
            print("Jeśli klubu nie ma w bazie, wpisz -1 aby dodać klub do bazy")
            opcja = input("Wybierz klub lub opcję: ")
            while -1 > int(opcja) > cursor.rowcount() :
                opcja = input("Niepoprawny wybór, spróbuj ponownie: ")

            if opcja == "0":
                dodawanie_id_klub = 0
            elif opcja == "-1":
                dodanie_klubu()
                dodawanie_id_klub = i + 1
            else:
                dodawanie_id_klub = int(opcja)

            dodawanie_imie = input("Imie zawodnika:")
            dodawanie_nazwisko = input("Nazwisko zawodnika:")
            dodawanie_pozycja = input("Pozycja:")
            dodawanie_reprezentacja = input("Reprezentacja:")
            dodawanie_wiek = input("Wiek zawodnika:")
            dodawanie_waga = input("Waga zawodnika:")

            sql = "INSERT INTO zawodnik(imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga) VALUES (%s,%s,%s,%s,%s,%s,%s)"
            dodawane_wartosci = (dodawanie_imie, dodawanie_nazwisko, dodawanie_pozycja, dodawanie_reprezentacja, dodawanie_wiek, dodawanie_id_klub, dodawanie_waga)
            cursor.execute(sql, dodawane_wartosci)

    finally:
        connection.close()


def dodanie_klubu():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:

            sql1 = "SELECT id_klub FROM klub"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            i = 0
            for row in result1:
                    i = i + 1

            dodawanie_id_klubu = i + 1
            dodawanie_nazwa = input("Nazwa klubu: ")
            dodawanie_siedziba = input("Siedziba: ")
            dodawanie_trener_klubu = input("Trener: ")
            dodawanie_data_zalozenia = int(input("Rok założenia klubu: "))
            dodawanie_panstwo = input("Państwo w jakim klub się znajduje: ")

            sql = "INSERT INTO klub(id_klub, nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo) VALUES (%s, %s,%s,%s, %s, %s)"
            dodawane_wartosci = (dodawanie_id_klubu, dodawanie_nazwa, dodawanie_siedziba, dodawanie_trener_klubu, dodawanie_data_zalozenia, dodawanie_panstwo)
            cursor.execute(sql, dodawane_wartosci)

            print("\nDodano klub do bazy danych.\n")
            connection.commit()

    finally:
        connection.close()
