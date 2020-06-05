# Rozgrywki piłki nożnej 
>Na przedmiocie Bazy Danych zrealizowany został projekt dwuosobowy, którego celem było zaprojektowanie oraz implementacja systemu bazodanowego. 

| Nazwisko i imię | Wydział | Kierunek | Semestr | Grupa | Rok akademicki |
| :-------------: | :-----: | :------: | :-----: | :---: | :------------: |
| Urszula Piątek         | WIMiIP  | IS       |   4     | 3     | 2019/2020      |
| Julia Matuła         | WIMiIP  | IS       |   4     | 3    | 2019/2020      |

## Projekt bazy danych
Temat projektu jaki został nam przydzielony to _,,Rozgrywki piłki nożnej"_. W celu zobrazowania funkcjonalności bazy, która została przez nas zaplanowana stworzony został diagram. Do stworzenia poniższego diagramu skorzystałyśmy z progarmu **Visual Paradigm**. 

![Rozgrywki_pilki_noznej_diagram](./diagram.svg)

Przy użyciu **XAMPP** oraz  **phpMyAdmin** mogłyśmy w łatwy sposób stworzyć naszą bazą danych. W pierwszej kolejności została stworzona baza wraz z tabelkami. Do stworzenia tabelek wykorzystane zostały zapytania **DDL**. DDL są to zapytania służące do operowania na strukturach, dzięki nim można dodać, zmienić lub skaskować tabele lub bazy. W każdej tabeli dodany został klucz główny, w celu identyfikacji każdego rekordu.  Przykładowe zapytania służace do stworzenia poszczególnych tabel: 

Kluczem prywatnym w tabeli klub jest _id_klub_.

```sql 
CREATE TABLE `klub` (
  `id_klub` int(11) NOT NULL,
  `nazwa_klubu` varchar(50) NOT NULL,
  `siedziba` varchar(50) DEFAULT NULL,
  `trener_klubu` varchar(50) DEFAULT NULL,
  `data_zalozenia` int(11) DEFAULT NULL,
  `panstwo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

W tabeli liga stworzony został klucz obcy _id_klub_wygrany_, w celu stworzenia powiązania tabeli _liga_ z tabelą _klub_.

```sql 
CREATE TABLE `liga` (
  `id_liga` int(11) NOT NULL,
  `szczebel_rozgrywkowy` varchar(50) NOT NULL,
  `data_zalozenia` date NOT NULL,
  `panstwo` varchar(50) DEFAULT NULL,
  `liczba_druzyn` int(11) DEFAULT NULL,
  `id_klub_wygrany` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Niektórych relacje, które są zawarte w tabelach:

```sql
ALTER TABLE `zawodnik`
ADD PRIMARY KEY (`id_zawodnik`),
ADD KEY `klub_zawodnika_fk` (`id_klub`);

ALTER TABLE `liga`
ADD PRIMARY KEY (`id_liga`),
ADD KEY `liga_klub_fk` (`id_klub_wygrany`);

ALTER TABLE `rozgrywka`
ADD PRIMARY KEY (`id_rozgrywka`),
ADD KEY `wygrany_klub_fk` (`id_klub1`),
ADD KEY `przegrany_klub_fk` (`id_klub2`),
ADD KEY `rozgrywka_liga_fk` (`id_liga`);
```
Po pomyślnej implementacji przeszłyśmy do uzupełnienia tabel rekordami. Rozpoczęłyśmy od tabeli _Klub_, ponieważ zawiera klucz obcy znajdujący się w tabeli Zawodnik. Tym samym można było przejść do wypełnienia tabeli Zawodnik, a następnie pozostałych tabel. 
W celu uzupełnienia tabel skorzystałyśmy z zapytań grupy **DML**. Przykładowe zapytanie:

```sql
INSERT INTO `rozgrywka` (`id_rozgrywka`, `data_rozgrywki`, `miejscowosc`, `id_klub1`, `id_klub2`, `wynik_klub1`, `wynik_klub2`, `id_liga`) VALUES
(1, '2020-03-07 18:30:00', 'Barcelona', 33, 37, 1, 0, 11);

INSERT INTO `zawodnik` (`id_zawodnik`, `imie_zawodnika`, `nazwisko_zawodnika`, `pozycja`, `reprezentacja`, `wiek_zawodnika`, `id_klub`, `waga`) VALUES
(1, 'Radoslaw', 'Majecki', 'bramkarz', 'Polska', 21, 1, 78),
(2, 'Lukasz', 'Skorupski', 'bramkarz', 'Polska', 29, 2, 84),
(3, 'Wojciech', 'Szczesny', 'bramkarz', 'Polska', 30, 3, 85),
(4, 'Jan', 'Bednarek', 'obronca', 'Polska', 24, 4, 77),
(5, 'Lukasz', 'Piszczek', 'obronca', 'Polska', 35, 5, 78);
```


## Implementacja zapytań SQL
Język definiowania **DQL** posłużył nam do formułowania zapytań do bazy danych. Przykładowe zapytania użyte w projekcie: 

* Zwrócenie listy zawodników z reprezentacji wybranego kraju.
```sql
SELECT * from zawodnik WHERE reprezentacja="Anglia" AND id_klub IS NOT NULL;
```

* Wyświetlenie zawodników, którzy grają na danej pozycji. Dodatkowo zapytanie posortuje elementy alfabetycznie.
```sql
SELECT klub.nazwa_klubu, zawodnik.imie_zawodnika, zawodnik.nazwisko_zawodnika. Za pomocą tego polecenia można uzyskać informacje w jakim klubie gra dany zawodnik będący na pozcyji napastnika. 
FROM klub, zawodnik 
WHERE zawodnik.id_klub=klub.id_klub 
AND zawodnik.pozycja="napastnik"
AND zawodnik.id_klub IS NOT NULL
ORDER BY klub.nazwa_klubu;
```

* Wyświetlenie szczeblu rozgrywkowego, a także państwa z tabeli liga oraz nazwy klubu z tabeli klub. Dzięki temu zapytaniu można się dowiedzieć w jakim państwie gra dana liga, a także jaki klub do danej ligi należy.
```sql
SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu, liga.panstwo FROM liga, klub 
WHERE liga.id_klub_wygrany=klub.id_klub;
```

* Zapytanie zliczające liczbę klubów w danym państwie.
```sql
SELECT COUNT(id_klub)as liczbaKlubow, panstwo 
FROM klub GROUP BY panstwo;
```

* Zapytanie wyświetlające informacje na temat wyniku klubu, znajdującego się na konkretnym szczeblu rozgrywkowym. Użycie klauzuli **Inner join** pozwoliło nam na złączenie wierszy, dla których warunek złączeń został spełniony. 
```sql 
SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu,  wynik.punkty, wynik.rozegrane, wynik.wygrane, wynik.remisy, wynik.przegrane  FROM wynik INNER JOIN liga ON wynik.id_liga=liga.id_liga INNER JOIN klub ON wynik.id_klub=klub.id_klub ORDER BY wynik.punkty DESC;
```

* Wyświetlenie rozgrywek, które odbyły się w trzech danych miastach.
```sql
SELECT rozgrywka.data_rozgrywki, rozgrywka.miejscowosc, k1.nazwa_klubu, rozgrywka.wynik_klub1,  rozgrywka.wynik_klub2, k2.nazwa_klubu, liga.szczebel_rozgrywkowy
FROM rozgrywka
INNER JOIN klub k1 on rozgrywka.id_klub1=k1.id_klub
INNER JOIN klub k2 on rozgrywka.id_klub2=k2.id_klub
INNER JOIN liga on rozgrywka.id_liga=liga.id_liga
WHERE rozgrywka.miejscowosc IN ('Madryt', 'Lipsk', 'Berlin');
```

* Wyświetlenie średniego wieku zawodnika z tabeli zawodnik. Za pomocą funkcji **AVG** zwrócona zostaje średnia wartość kolumny numerycznej. Takie samo zapytanie ze zmienionymi wartościami w funkcji użyte zostało do zwrócenia średniej wagi zawodników, a także do średniej liczby drużyn w ligach.
``` sql
SELECT AVG(wiek_zawodnika) FROM zawodnik;

SELECT AVG(waga) FROM zawodnik;

SELECT AVG(liczba_druzyn) FROM liga;
```

* Wyświetlenie szczeblu rozgrywkowego, liczby drużyn, panstwa, nazwy klubu, siedziby z dwóch tabel połączonym kluczem obcym id_klub. 
```sql
SELECT liga.szczebel_rozgrywkowy, liga.liczba_druzyn, liga.panstwo, klub.nazwa_klubu, klub.siedziba FROM liga INNER JOIN klub ON liga.id_klub_wygrany=klub.id_klub ORDER BY liga.liczba_druzyn DESC;
```

* Kolejne polecenie wyświetla zestawienie wyników, w których sa remisy. 
```sql
SELECT rozgrywka.data_rozgrywki, rozgrywka.miejscowosc, k1.nazwa_klubu, rozgrywka.wynik_klub1,  rozgrywka.wynik_klub2, k2.nazwa_klubu, liga.szczebel_rozgrywkowy
FROM rozgrywka
INNER JOIN klub k1 on rozgrywka.id_klub1=k1.id_klub
INNER JOIN klub k2 on rozgrywka.id_klub2=k2.id_klub
INNER JOIN liga on rozgrywka.id_liga=liga.id_liga
WHERE rozgrywka.wynik_klub1 = rozgrywka.wynik_klub2;
```

* Przy użyciu zapytania **DML** możliość dodania zawodnika oraz klubu, jeśli nie ma danego na liście. 
```sql
INSERT INTO zawodnik(id_zawodnik, imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga) VALUES (97, “Gerard”,”Pique”,”obrońca”,”Hiszpania”,33, 33, 85);

INSERT INTO klub(id_klub, nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo) VALUES (59, “FK Loko Vltavin”, “Praga”, “Martin Frýdek”, 1898, “Czechy”);
```

* Zapytanie aktualizujące klub, w którym gra zawodnik.
```sql
UPDATE zawdonik SET id_klub=10
WHERE id_zawodnik=15;
```

* Usunięcie z tabeli klub wybranego klubu.
```sql
DELETE FROM klub WHERE klub_id=1;
```

## Aplikacja
W ostatnim etapie projektu została zaimplementowana aplikacja, która służy do wizualizacji projektu systemu. Aplikacja została napisana w języku Python w połączeniu z biblioteką pymysql, ilustruje ona interakcję użytkownika z bazą.  Wykorzystane zostały zapytania SQL, za pomocą których użytkownik (tj. przeglądający aplikacje) może wylistować informacje, które chce zobaczyć. Aplikacja pozwala na wyświetlenie 15 zapytań, natomiast niektóre funkcjonalności są ograniczone i są dostępne tylko dla zalogowanych użytkowników. W aplikacji zostały również użyte funkcje pozwalające wprowadzać lub aktualizować dane znajdujące się w bazie.

**Snippety:**

Przykład funkcji napisanej w Pythonie, która wyświetla zawodników grających na danej pozycji.
```
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
                FROM klub, zawodnik WHERE zawodnik.id_klub=klub.id_klub AND zawodnik.pozycja=(%s) \
                AND zawodnik.id_klub IS NOT NULL ORDER BY klub.nazwa_klubu"
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
```

Możliowść aktualizacji klubu wygrywającego w danej lidze.
```
def zmiana_klubu_zwycieskiego_ligi():
connection = pymysql.connect(host='localhost',
                             user=usr,
                             password=usr,
                             db='rozgrywki_pilki_noznej'
                             )

try:
    with connection.cursor() as cursor:

        input("W której lidze zmienił się zwycięzca? Naciśnij dowolny klawisz aby wyświetlić dostępne ligi")
        sql = "SELECT id_liga, szczebel_rozgrywkowy FROM liga"
        cursor.execute(sql)
        result1 = cursor.fetchall()
        tab_indeksow_ligi = arr.array('i')
        i = 0
        for row in result1:
            time.sleep(0.1)
            tab_indeksow_ligi.append(int(row[0]))
            print("\t", row[0], ".", row[1])
            i = i + 1

        k = 0
        wybrany_numer_ligi = input("Podaj numer ligi: ")
        while k == 0:
            if wybrany_numer_ligi.isdigit() is True:
                for j in range(i):
                    if int(wybrany_numer_ligi) == tab_indeksow_ligi[j]:
                        k = 1
                        break
            if wybrany_numer_ligi.isdigit() is False or k == 0:
                wybrany_numer_ligi = input("Nie ma takiej ligi, spróbuj ponownie: ")
        wybrany_numer_ligi = int(wybrany_numer_ligi)
        sql2 = "SELECT id_klub, nazwa_klubu FROM klub ORDER BY id_klub"
        cursor.execute(sql2)
        result1 = cursor.fetchall()
        tab_indeksow_klubow = arr.array('i')
        j = 0
        input("Naciśnij dowolny klawisz aby wyświetlić dostępne kluby")
        for row in result1:
            time.sleep(0.15)
            tab_indeksow_klubow.append(int(row[0]))
            print("\t", row[0], ".", row[1])
            j = j + 1

        print("Jesli klubu nie ma w bazie, wybierz 0 aby dodać klub")
        numer_klubu = sprawdzenie_indeksu_klubu(j, tab_indeksow_klubow)
        if numer_klubu == 0:
            dodanie_klubu()
            numer_klubu = j + 1

        dodawane_wartosci = (numer_klubu, wybrany_numer_ligi)
        sql = "UPDATE liga SET id_klub_wygrany=(%s) WHERE id_liga=(%s)"
        cursor.execute(sql, dodawane_wartosci)
        connection.commit()

        print("Pomyślnie zmieniono klub dla danej ligi.")

finally:
    connection.close()
```







