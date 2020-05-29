# Rozgrywki piłki nożnej 
>Na przedmiocie Bazy Danych zrealizowany został projekt dwuosobowy, którego celem było zaprojektowanie oraz implementacja systemu bazodanowego. 

| Nazwisko i imię | Wydział | Kierunek | Semestr | Grupa | Rok akademicki |
| :-------------: | :-----: | :------: | :-----: | :---: | :------------: |
| Urszula Piątek         | WIMiIP  | IS       |   4     | 3     | 2019/2020      |
| Julia Matuła         | WIMiIP  | IS       |   4     | 3    | 2019/2020      |

## Projekt bazy danych
Temat projektu jaki został nam przydzielony to _,,Rozgrywki piłki nożnej"_. W celu zobrazowania funkcjonalności bazy, która została przez nas zaplanowana stworzony został diagram. Do stworzenia poniższego diagramu skorzystałyśmy z progarmu **Visual Paradigm**. 

![Rozgrywki_pilki_noznej_diagram](./resources/diagram.svg)

Przy użyciu **XAMPP** oraz  **phpMyAdmin** mogłyśmy w łatwy sposób stworzyć naszą bazą danych. W pierwszej kolejności została stworzona baza wraz z tabelkami. Do stworzenia tabelek wykorzystane zostały zapytania **DDL**. DDL są to zapytania służące do operowania na strukturach, dzięki nim można dodać, zmienić lub skaskować tabele lub bazy. Przykładowe zapytania służace do stworzenia poszczególnych tabel: 

W tabeli klub stworzone zostały następujące kolumny 
`CREATE TABLE `klub` (
  `id_klub` int(11) NOT NULL,
  `nazwa_klubu` varchar(50) NOT NULL,
  `siedziba` varchar(50) DEFAULT NULL,
  `trener_klubu` varchar(50) DEFAULT NULL,
  `data_zalozenia` int(11) DEFAULT NULL,
  `panstwo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;`

`CREATE TABLE `liga` (
  `id_liga` int(11) NOT NULL,
  `szczebel_rozgrywkowy` varchar(50) NOT NULL,
  `data_zalozenia` date NOT NULL,
  `panstwo` varchar(50) DEFAULT NULL,
  `liczba_druzyn` int(11) DEFAULT NULL,
  `id_klub_wygrany` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;`



Po pomyślnej implementacji przeszłyśmy do wypełniania tabel rekordami. Rozpoczęłyśmy od wypełniania tabeli _Klub_, ponieważ zawiera klucz obcy znajdujący się w tableli Zawodnik. Tym samym można było przejść do wypełniania tabeli Zawodnik, a następnie uzupełniania reszty tabel.  

## Implementacja zapytań SQL
Tutaj należy wylistować wszystkie funkcjonalności, wraz z odpowiednimi zapytaniami SQL. W tej sekcji należy zawrzeć wyłącznie zapytania z grupy DML oraz DQL.

## Aplikacja
Tutaj należy opisać aplikację, która wykorzystuje zapytania SQL z poprzedniego kroku. Można, jednak nie jest to konieczne, wrzucić tutaj istotne snippety z Waszych aplikacji.

## Dodatkowe uwagi
W tej sekcji możecie zawrzeć informacje, których nie jesteście w stanie przypisać do pozostałych. Mogą to być również jakieś komentarze, wolne uwagi, itp.


