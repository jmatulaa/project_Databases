import pymysql


def wyswietlanie_rep_danego_kraju(upr):
    if upr == "1": usr = 'gosc'
    if upr == "2": usr = 'rpn_admin'
    connection = pymysql.connect(host='localhost',
                                 user=usr,
                                 password=usr,
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            panstwo = input("Podaj panstwo ktorego zawodnikow reprezentacji chcesz wyswietlic: ")
            sql = "SELECT id_zawodnik, imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga \
                    FROM zawodnik WHERE reprezentacja=(%s)"
            cursor.execute(sql, panstwo)
            result = cursor.fetchall()

            nazwy = ("ID zawodnika", "Imie", "Nazwisko", "Pozycja", "Reprezentacja", "Wiek", "ID klubu", "Waga")
            s2 = "| {0:25} | {1:20}| {2:20}| {3:20}| {4:20}| {5:6} | {6:10} | {7:6} |"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4], nazwy[5], nazwy[6], nazwy[7]))
            print("{:->139}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))

    finally:
        connection.close()


def wyswietlenie_zawodnikow_klubow_na_danej_pozycji():
    pozycja = input("Podaj pozycje zawodnikow, którą chcesz wyświetlić: ")
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
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
                                 user='root',
                                 password='root',
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


def wyswietlenie_zawodnikow_o_okreslonej_wadze():
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            waga = input("Maksymalną wagę zawodnikow, których chcesz wyświetlić: ")
            sql = "SELECT zawodnik.imie_zawodnika, zawodnik.nazwisko_zawodnika, zawodnik.waga, zawodnik.pozycja, klub.nazwa_klubu \
                    FROM zawodnik, klub WHERE klub.id_klub=zawodnik.id_klub AND zawodnik.waga<(%d)"
            cursor.execute(sql, waga)
            result = cursor.fetchall()

            nazwy = ("Imię", "Nazwisko", "Waga", "Pozycja", "Klub piłkarski")
            s2 = "| {0:20}| {1:20}| {2:6}| {3:20}| {4:20}|"
            print(s2.format(nazwy[0], nazwy[1], nazwy[2], nazwy[3], nazwy[4]))
            print("{:->100}".format(""))

            for row in result:
                print(s2.format(row[0], row[1], row[2], row[3], row[4]))

    finally:
        connection.close()


def wyswietlenie_punktow_w_ligach():
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
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


def liczenie_srednich(wybor_sredniej):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='rozgrywki_pilki_noznej'
                                 )

    try:
        with connection.cursor() as cursor:
            if wybor_sredniej == "a":
                sql = "SELECT AVG(wiek_zawodnika) as srednia FROM zawodnik"
                wypisanie = "Średni wiek wszystkich zawodnikow: "
            if wybor_sredniej == "b":
                sql = "SELECT AVG(liczba_druzyn) as srednia FROM liga"
                wypisanie = "Średnia liczba drużyn we wszystkich ligach: "
            if wybor_sredniej == "c":
                sql = "SELECT AVG(punkty) as srednia FROM wynik"
                wypisanie = "Średnia liczba punktów uzyskanych przez wszystkie drużyny:"

            cursor.execute(sql)
            result = cursor.fetchall()
            for x in result:
                print(wypisanie, x[0])

    finally:
        connection.close()
