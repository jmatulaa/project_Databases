import pymysql
from pomoc import sprawdzenie_miejscowosci
from pomoc import pauza
import array as arr
import time


def wybor_zapytania(numer, wybor):

    upr = wybor

    global usr
    if upr == "1": usr = 'gosc'
    if upr == "2": usr = 'rpn_admin'

    if numer == 1:
        wyswietlanie_rep_danego_kraju()
        pauza()
    if numer == 2:
        wyswietlenie_zawodnikow_klubow_na_danej_pozycji()
        pauza()
    if numer == 3:
        wyswietlenie_klubow_wygranych_ligi()
        pauza()
    if numer == 4:
        wybor_zliczania = input("Wybierz literkę (a, b lub c): ")
        while wybor_zliczania != "a" and wybor_zliczania != "b" and wybor_zliczania != "c":
            wybor_zliczania = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
        zliczenie_klubow(wybor_zliczania)
        pauza()
    if numer == 5:
        wyswietlenie_punktow_w_ligach()
        pauza()
    if numer == 6:
        wyswietlenie_rozgrywek_w_miastach()
        pauza()
    if numer == 7:
        wybor_sredniej = input("Wybierz literkę (a, b lub c): ")
        while wybor_sredniej != "a" and wybor_sredniej != "b" and wybor_sredniej != "c":
            wybor_sredniej = input("Taki wybór nie istnieje, spróbuj jeszcze raz: ")
        liczenie_srednich(wybor_sredniej)
        pauza()
    if numer == 8:
        informacje_o_ligach()
        pauza()
    if numer == 9:
        zestawienie_remisow()
        pauza()
    if numer == 10 and upr == "2":
        dodawanie_zawodnika()
        pauza()
    if numer == 11 and upr == "2":
        dodanie_klubu()
        pauza()
    if numer == 12 and upr == "2":
        zmiana_klubu_danego_zawodnika()
        pauza()
    if numer == 13 and upr == "2":
        usuniecie_klubu()
        pauza()
    if numer == 14 and upr == "2":
        zmiana_klubu_zwycieskiego_ligi()
        pauza()
    if numer == 15 and upr == "2":
        dodanie_rozgrywki()
        pauza()
    elif 9 < numer < 16 and upr == "1":
        print("\nNie masz uprawnien do wykonania tej operacji. Zaloguj się jako admin aby mieć dostęp.")
        pauza()


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
                time.sleep(0.1)
                print("\t", i, ". ", row1[0])
            numer_panstwa = input("Podaj numer panstwa ktorego zawodnikow reprezentacji chcesz wyswietlic: ")

            while numer_panstwa.isdigit() is False or int(numer_panstwa) > i or int(numer_panstwa) < 1:
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
                time.sleep(0.15)
                print(s2.format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))

            print("\n")
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
            pozycja = input("Podaj pozycję zawodnikow, którą chcesz wyświetlić: ")
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
                time.sleep(0.15)
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
            print("{:->40}".format(""))

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
            s2 = "| {0:25}| {1:25}| {2:17} | {3:17} | {4:17} | {5:10} | {6:10} |"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6]))
            print("{:->141}".format(""))

            for row in result:
                time.sleep(0.15)
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
                time.sleep(0.1)
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
                time.sleep(0.15)
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
                print(wypisanie, int(x[0]))

    finally:
        connection.close()


def informacje_o_ligach():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql = "SELECT liga.szczebel_rozgrywkowy, liga.liczba_druzyn, liga.panstwo, klub.nazwa_klubu, klub.siedziba \
            FROM liga INNER JOIN klub ON liga.id_klub_wygrany=klub.id_klub ORDER BY liga.liczba_druzyn DESC;"

            cursor.execute(sql)
            result = cursor.fetchall()

            nazwy = ("Szczebel rozgrywkowy", "Liczba drużyn", "Państwo", "Klub wygrywający", "Siedziba klubu")
            s2 = "| {0:30}| {1:15} | {2:20}| {3:25}| {4:25}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4]))
            print("{:->127}".format(""))

            for row in result:
                time.sleep(0.15)
                print(s2.format(row[0], row[1], row[2], row[3], row[4]))

    finally:
        connection.close()


def zestawienie_remisow():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql = "SELECT rozgrywka.data_rozgrywki, rozgrywka.miejscowosc, k1.nazwa_klubu, rozgrywka.wynik_klub1, \
                rozgrywka.wynik_klub2, k2.nazwa_klubu, liga.szczebel_rozgrywkowy FROM rozgrywka \
                INNER JOIN klub k1 on rozgrywka.id_klub1=k1.id_klub \
                INNER JOIN klub k2 on rozgrywka.id_klub2=k2.id_klub \
                INNER JOIN liga on rozgrywka.id_liga=liga.id_liga \
                WHERE rozgrywka.wynik_klub1 = rozgrywka.wynik_klub2;"

            cursor.execute(sql)
            result = cursor.fetchall()

            nazwy = ("Data spotkania", "Miejscowość", "Klub", "Wynik", "Wynik", "Klub", "Liga")
            s2 = "| {0:20}| {1:15}| {2:22}| {3:7} | {4:7} | {5:22}| {6:25}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6]))
            print("{:->135}".format(""))

            for row in result:
                time.sleep(0.15)
                print(s2.format(str(row[0]), row[1], row[2], row[3], row[4], row[5], row[6]))

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
            input("Nciśnij dowolny klawisz aby wyświetlić dostepne kluby:")
            for row in result1:
                time.sleep(0.1)
                print("\t", row[0], ".", row[1])
                i = i + 1

            print("Jeśli klubu nie ma w bazie, wpisz 0 aby dodać klub do bazy")
            opcja = input("Wybierz klub lub opcję: ")
            while (opcja.isdigit() is False) or int(opcja) < 0 or int(opcja) > i:
                opcja = input("Niepoprawny wybór, spróbuj ponownie: ")

            opcja = int(opcja)
            if opcja == 0:
                dodanie_klubu()
                dodawanie_id_klub = i + 1
            else:
                dodawanie_id_klub = int(opcja)

            sql2 = "SELECT id_zawodnik FROM zawodnik"
            cursor.execute(sql2)
            id_zawodnika = cursor.rowcount + 2
            dodawanie_imie = input("Imie zawodnika:")
            dodawanie_nazwisko = input("Nazwisko zawodnika:")
            dodawanie_pozycja = input("Pozycja:")
            dodawanie_reprezentacja = input("Reprezentacja:")
            dodawanie_wiek = input("Wiek zawodnika:")
            while dodawanie_wiek.isdigit() is False:
                dodawanie_wiek = input("Wiek może być tylko liczbą całkowitą. Spróbuj ponownie: ")
            dodawanie_wiek = int(dodawanie_wiek)
            dodawanie_waga = input("Waga zawodnika:")
            while dodawanie_waga.isdigit() is False:
                dodawanie_waga = input("Waga może być tylko liczbą całkowitą. Spróbuj ponownie: ")
            dodawanie_waga = int(dodawanie_waga)

            sql = "INSERT INTO zawodnik(id_zawodnik, imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
            dodawane_wartosci = (id_zawodnika, dodawanie_imie, dodawanie_nazwisko, dodawanie_pozycja, dodawanie_reprezentacja, dodawanie_wiek, dodawanie_id_klub, dodawanie_waga)
            cursor.execute(sql, dodawane_wartosci)
            connection.commit()

            print("Dodano zawodnika do bazy zawodników.")

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
            dodawanie_data_zalozenia = input("Rok założenia klubu: ")
            while dodawanie_data_zalozenia.isdigit() is False:
                dodawanie_data_zalozenia = input("Data założenia może być tylko liczbą całkowitą. Spróbuj ponownie: ")
            dodawanie_data_zalozenia = int(dodawanie_data_zalozenia)
            dodawanie_panstwo = input("Państwo w jakim klub się znajduje: ")

            sql = "INSERT INTO klub(id_klub, nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo) VALUES (%s, %s,%s,%s, %s, %s)"
            dodawane_wartosci = (dodawanie_id_klubu, dodawanie_nazwa, dodawanie_siedziba, dodawanie_trener_klubu, dodawanie_data_zalozenia, dodawanie_panstwo)
            cursor.execute(sql, dodawane_wartosci)

            print("\nDodano klub do bazy danych.\n")
            connection.commit()

    finally:
        connection.close()


def zmiana_klubu_danego_zawodnika():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            sql1 = "SELECT DISTINCT panstwo FROM klub"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            panstwo = input("Wybierz państwo pochodzenia zawodnika który zmienił klub: ")
            i = 0
            while i == 0:
                for row1 in result1:
                    if panstwo == row1[0]:
                        i = 1
                if i != 1:
                    panstwo = input("Nie ma takiego państwa, spróbuj ponownie: ")

            print("Który klub z wybranego państwa rozwiązał działaność lub zostaje usunięty z bazy danych?")
            sql2 = "SELECT id_zawodnik, imie_zawodnika, nazwisko_zawodnika FROM zawodnik WHERE reprezentacja=(%s)"
            cursor.execute(sql2, panstwo)
            result1 = cursor.fetchall()
            tab_indeksow = arr.array('i')
            i = 0
            for row1 in result1:
                time.sleep(0.1)
                tab_indeksow.append(int(row1[0]))
                print("\t", row1[0], ".", row1[1], row1[2])
                i = i + 1
            k = 0
            numer_zawodnika = int(input("Wybierz ID zawodnika: "))
            while k == 0:
                for j in range(i):
                    if numer_zawodnika == tab_indeksow[j]:
                        k = 1
                if k != 1:
                    numer_zawodnika = int(input("Nie ma takiego zawodnika w wybranym panstwie, spróbuj ponownie: "))

            j = 0
            sql3 = "SELECT id_klub, nazwa_klubu FROM klub"
            cursor.execute(sql3)
            result2 = cursor.fetchall()
            print("Dostepne kluby:")
            for row in result2:
                time.sleep(0.15)
                print("\t", row[0], ".", row[1])
                j = j + 1

            print("Czy zawodnik: ")
            print("\ta) został przypisany do klubu z listy")
            print("\tb) został przypisany do nowego klubu - należy dodać klub")
            wybrana_opcja = input("Wybierz a lub b: ")
            while wybrana_opcja != "a" and wybrana_opcja != "b":
                wybrana_opcja = input("Wybrano niepoprawną opcję. Spróbuj ponownie: ")
            if wybrana_opcja == "a":
                numer_klubu = input("Wybierz numer klubu: ")
                while numer_klubu.isdigit() is False or int(numer_klubu) < 1 or int(numer_klubu) > j:
                    numer_klubu = input("Klub o takim numerze nie istnieje, wybierz ponownie: ")
                numer_klubu = int(numer_klubu)
            else:
                dodanie_klubu()
                numer_klubu = cursor.rowcount() + 1
                print("numer nowego", numer_klubu)

            dodawane_wartosci = (numer_klubu, numer_zawodnika)
            sql = "UPDATE zawodnik SET id_klub=(%s) WHERE id_zawodnik=(%s)"
            cursor.execute(sql, dodawane_wartosci)
            connection.commit()

            print("Pomyślnie zmieniono klub dla danego zawodnika.")

    finally:
        connection.close()


def usuniecie_klubu():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:

            sql1 = "SELECT DISTINCT panstwo FROM klub"
            cursor.execute(sql1)
            result1 = cursor.fetchall()
            panstwo = input("Z jakiego państwa ma być klub który chcesz usunąć?")
            i = 0
            while i == 0:
                for row1 in result1:
                    if panstwo == row1[0]:
                        i = 1
                if i != 1:
                    panstwo = input("Nie ma takiego państwa, spróbuj ponownie: ")

            print("Który klub z wybranego państwa rozwiązał działaność lub zostaje usunięty z bazy danych?")
            sql1 = "SELECT id_klub, nazwa_klubu FROM klub WHERE panstwo=(%s)"
            cursor.execute(sql1, panstwo)
            result1 = cursor.fetchall()
            tab_indeksow = arr.array('i')
            i = 0
            for row1 in result1:
                time.sleep(0.1)
                tab_indeksow.append(int(row1[0]))
                print("\t", row1[0], ".", row1[1])
                i = i + 1
            k = 0
            numer_klubu = input("Wybierz numer klubu: ")
            while numer_klubu.isdigit() is False:
                numer_klubu = input("Nie ma takiego klubu w wybranym panstwie, spróbuj ponownie: ")
            numer_klubu = int(numer_klubu)
            while k == 0:
                for j in range(i):
                    if numer_klubu == tab_indeksow[j]:
                        k = 1
                if k != 1:
                    numer_klubu = int(input("Nie ma takiego klubu w wybranym panstwie, spróbuj ponownie: "))

            odp = input("Czy na pewno chcesz usunąć wybrany klub? t/n: ")
            while odp != "t" and odp != "n":
                odp = input("Nie ma takiej opcji. Wprowadź t (tak) lub n (nie): ")
            if odp == "t":
                sql1 = "UPDATE zawodnik SET id_klub=NULL WHERE id_klub = (%s)"
                cursor.execute(sql1, numer_klubu)
                sql2 = "UPDATE liga SET id_klub_wygrany=NULL WHERE id_klub_wygrany = (%s)"
                cursor.execute(sql2, numer_klubu)
                sql3 = "DELETE FROM wynik WHERE id_klub = (%s)"
                cursor.execute(sql3, numer_klubu)
                sql4 = "DELETE FROM rozgrywka WHERE id_klub1 = (%s) OR id_klub2 = (%s)"
                cursor.execute(sql4, (numer_klubu, numer_klubu))
                sql5 = "DELETE FROM klub WHERE id_klub = (%s)"
                cursor.execute(sql5, numer_klubu)
                connection.commit()
                print("Usunięto wybrany klub z bazy danych")
            else:
                print("Powrót to listy zapytań.")

    finally:
        connection.close()


def zmiana_klubu_zwycieskiego_ligi():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:

            print("W której lidze zmienił się zwycięzca?")
            sql = "SELECT id_liga, szczebel_rozgrywkowy FROM liga"
            cursor.execute(sql)
            result1 = cursor.fetchall()
            i = 0
            for row in result1:
                time.sleep(0.15)
                print("\t", row[0], ".", row[1])
                i = i + 1

            wybrany_numer_ligi = input("Podaj numer ligi: ")
            while wybrany_numer_ligi.isdigit() is False or int(wybrany_numer_ligi) < 1 or int(wybrany_numer_ligi) > i:
                wybrany_numer_ligi = input("Liga o takim numerze nie istnieje, wybierz ponownie: ")
            wybrany_numer_ligi = int(wybrany_numer_ligi)
            sql2 = "SELECT id_klub, nazwa_klubu FROM klub"
            cursor.execute(sql2)
            result1 = cursor.fetchall()
            j = 0
            print("Dostepne kluby:")
            for row in result1:
                time.sleep(0.15)
                print("\t", row[0], ".", row[1])
                j = j + 1

            print("Czy nowy klub zwycięski dla danej ligi: ")
            print("\ta) istnieje na liście dostępnych klubów")
            print("\tb) należy dodać klub do bazy")
            wybrana_opcja = input("Wybierz a lub b: ")
            while wybrana_opcja != "a" and wybrana_opcja != "b":
                wybrana_opcja = input("Wybrano niepoprawną opcję. Spróbuj ponownie: ")
            if wybrana_opcja == "a":
                numer_klubu = input("Wybierz numer klubu: ")
                while numer_klubu.isdigit() is False or int(numer_klubu) < 1 or int(numer_klubu) > j:
                    numer_klubu = input("Klub o takim numerze nie istnieje, wybierz ponownie: ")
                numer_klubu = int(numer_klubu)
            else:
                dodanie_klubu()
                numer_klubu = cursor.rowcount() + 1

            dodawane_wartosci = (numer_klubu, wybrany_numer_ligi)
            sql = "UPDATE liga SET id_klub_wygrany=(%s) WHERE id_liga=(%s)"
            cursor.execute(sql, dodawane_wartosci)
            connection.commit()

            print("Pomyślnie zmieniono klub dla danej ligi.")

    finally:
        connection.close()


def dodanie_rozgrywki():
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:

            print("Liga w obrębie jakiej rozgrywa się spotkanie")
            sql = "SELECT id_liga, szczebel_rozgrywkowy FROM liga"
            cursor.execute(sql)
            result1 = cursor.fetchall()
            i = 0
            for row in result1:
                time.sleep(0.15)
                print("\t", row[0], ".", row[1])
                i = i + 1
            wybrany_numer_ligi = input("Podaj numer ligi: ")
            while wybrany_numer_ligi.isdigit() is False or int(wybrany_numer_ligi) < 1 or int(wybrany_numer_ligi) > i:
                wybrany_numer_ligi = input("Liga o takim numerze nie istnieje, wybierz ponownie: ")
            wybrany_numer_ligi = int(wybrany_numer_ligi)

            sql2 = "SELECT id_klub, nazwa_klubu FROM klub"
            cursor.execute(sql2)
            result1 = cursor.fetchall()
            j = 0
            print("Rozgrywka ma miejsce między dwoma klubami. Lista wszystkich klubów:")
            for row in result1:
                time.sleep(0.15)
                print("\t", row[0], ".", row[1])
                j = j + 1

            print("Czy pierwszy klub znajduje się na liście?")
            print("\ta) tak, wybierz z listy")
            print("\tb) nie, należy dodać klub do bazy")
            wybrana_opcja = input("Wybierz a lub b: ")
            while wybrana_opcja != "a" and wybrana_opcja != "b":
                wybrana_opcja = input("Wybrano niepoprawną opcję. Spróbuj ponownie: ")
            if wybrana_opcja == "a":
                numer_klubu1 = input("Wybierz numer klubu: ")
                while numer_klubu1.isdigit() is False or int(numer_klubu1) < 1 or int(numer_klubu1) > j:
                    numer_klubu1 = input("Klub o takim numerze nie istnieje, wybierz ponownie: ")
                numer_klubu1 = int(numer_klubu1)
            else:
                dodanie_klubu()
                numer_klubu1 = cursor.rowcount() + 1

            print("Czy drugi klub znajduje się na liście?")
            print("\ta) tak, wybierz z listy")
            print("\tb) nie, należy dodać klub do bazy")
            wybrana_opcja = input("Wybierz a lub b: ")
            while wybrana_opcja != "a" and wybrana_opcja != "b":
                wybrana_opcja = input("Wybrano niepoprawną opcję. Spróbuj ponownie: ")
            if wybrana_opcja == "a":
                numer_klubu2 = input("Wybierz numer klubu: ")
                while numer_klubu2.isdigit() is False or int(numer_klubu2) < 1 or int(numer_klubu2) > j:
                    numer_klubu2 = input("Klub o takim numerze nie istnieje, wybierz ponownie: ")
                numer_klubu2 = int(numer_klubu2)
            else:
                dodanie_klubu()
                numer_klubu2 = cursor.rowcount() + 1
                #tututututututututututututututu !

            print("Podaj datę rozgrywki:")
            dzien = input("\tDzień: ")
            while dzien.isdigit() is False or int(dzien) < 1 or int(dzien) > 31:
                dzien = input("Niepoprawny format dnia. Spróbuj ponownie: ")
            dzien = int(dzien)
            if dzien < 10:
                dzien = "0" + str(dzien)
            miesiac = input("\tMiesiąc: ")
            while miesiac.isdigit() is False or int(miesiac) < 1 or int(miesiac) > 12:
                miesiac = input("Miesiąc może być tylko liczbą całkowitą. Spróbuj ponownie: ")
            miesiac = int(miesiac)
            rok = input("\tRok: ")
            while rok.isdigit() is False or int(rok) < 999 or int(rok) > 10000:
                rok = input("Rok może być tylko liczbą całkowitą. Spróbuj ponownie: ")
            rok = int(rok)
            godzina = input("\tGodzina: ")
            while godzina.isdigit() is False or int(godzina) < 0 or int(godzina) > 23:
                godzina = input("Niepoprawny format godziny. Spróbuj ponownie: ")
            godzina = int(godzina)
            minuta = input("\tMinuta: ")
            while minuta.isdigit() is False or int(minuta) < 0 or int(minuta) > 59:
                minuta = input("Niepoprawny format minuty. Spróbuj ponownie: ")
            minuta = int(minuta)

            data_rozgrywki = "{}:{}:{} {}:{}:00".format(rok, miesiac, dzien, godzina, minuta)
            miejscowosc = input("Podaj miejscowość: ")
            wynik1 = input("Podaj wynik pierwszego klubu: ")
            while wynik1.isdigit() is False:
                wynik1 = input("Wynik musi być liczbą całkowitą. Spróbuj jeszcze raz: ")
            wynik1 = int(wynik1)
            wynik2 = input("Podaj wynik drugiego klubu: ")
            while wynik2.isdigit() is False:
                wynik2 = input("Wynik musi być liczbą całkowitą. Spróbuj jeszcze raz: ")
            wynik2 = int(wynik2)
            sql = "SELECT id_rozgrywka FROM rozgrywka ORDER BY id_rozgrywka"
            cursor.execute(sql)
            for row in cursor.fetchall():
                id_rozgrywki = row[0]
            id_rozgrywki = id_rozgrywki + 1

            print(data_rozgrywki)
            dane = (id_rozgrywki, data_rozgrywki, miejscowosc, numer_klubu1, numer_klubu2, wynik1, wynik2, wybrany_numer_ligi)

            sql1 = "INSERT INTO rozgrywka(id_rozgrywka, data_rozgrywki, miejscowosc, id_klub1, id_klub2, wynik_klub1, wynik_klub2, id_liga) \
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"

            cursor.execute(sql1, dane)
            connection.commit()
    finally:
        connection.close()