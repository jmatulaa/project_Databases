-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 10 Maj 2020, 00:55
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rozgrywki_pilki_noznej.sql`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klub`
--

CREATE TABLE `klub` (
  `id_klub` int(11) NOT NULL,
  `nazwa_klubu` varchar(50) NOT NULL,
  `siedziba` varchar(50) DEFAULT NULL,
  `trener_klubu` varchar(50) DEFAULT NULL,
  `data_zalozenia` int(11) DEFAULT NULL,
  `państwo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klub`
--

INSERT INTO `klub` (`id_klub`, `nazwa_klubu`, `siedziba`, `trener_klubu`, `data_zalozenia`, `państwo`) VALUES
(1, 'Legia Warszawa', 'Warszawa', 'Aleksandar Vuković', 1916, 'Polska'),
(2, 'Bologna FC', 'Bolonia', 'Siniša Mihajlović', 1909, 'Włochy'),
(3, 'Juventus F.C.', 'Turyn', 'Maurizio Sarri', 1897, 'Włochy'),
(4, 'Southampton F.C.', 'Southampton', 'Ralph Hasenhüttl', 1871, 'Wielka Brytania'),
(5, 'Borussia Dortmund', 'Dortmund', 'Lucien Favre', 1909, 'Niemcy'),
(6, 'UC Sampdoria', 'Genua', 'Claudio Ranieri', 1946, 'Włochy'),
(7, 'SPAL 2013', 'Ferrara', 'Luigi Di Biagio', 1907, 'Włochy'),
(8, 'AS Monaco', 'Monaco', 'Robert Moreno', 1924, 'Monaco'),
(9, 'Dynamo Kijów', 'Kijów', 'Ołeksij Mychajłyczenko', 1927, 'Ukraina'),
(10, 'Lokomotiw Moskwa', 'Moskwa', 'Jurij Siomin', 1923, 'Rosja'),
(11, 'Fortuna Düsseldorf', 'Düsseldorf', 'Uwe Rösler', 1895, 'Niemcy'),
(12, 'Bayern Monachium', 'Monachium', 'Hans-Dieter Flick', 1965, 'Niemcy'),
(13, 'SSC Napoli', 'Neapol', 'Gennaro Gattuso', 1926, 'Włochy'),
(14, 'Hertha BSC', 'Berlin', 'Bruno Labbadia', 1892, 'Niemcy'),
(15, 'Derby County', 'Derby', 'Phillip Cocu', 1884, 'Wielka Brytania'),
(16, 'Chicago Fire', 'Chicago', 'Raphaël Wicky', 1997, 'Stany Zjednoczone'),
(17, 'Wisła Płock', 'Płock', 'Radosław Sobolewski', 1947, 'Polska'),
(18, 'Kajrat Ałmaty', 'Ałmaty', 'Alaksiej Szpileuski', 1954, 'Kazachstan'),
(19, 'West Bromwich Albion F.C.', 'West Bromwich', 'Slaven Bilić', 1878, 'Wielka Brytania'),
(20, 'Lech Poznań', 'Poznań', 'Dariusz Żuraw', 1948, 'Polska'),
(21, 'Dinamo Zagrzeb', 'Zagrzeb', 'Igor Jovićević', 1945, 'Chorwacja'),
(22, 'Leeds United F.C.', 'Leeds', 'Marcelo Bielsa', 1919, 'Wielka Brytania'),
(23, 'Dinamo Moskwa', 'Moskwa', 'Krill Novikov', 1923, 'Rosja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liga`
--

CREATE TABLE `liga` (
  `id_liga` int(11) NOT NULL,
  `szczebel_rozgrywkowy` varchar(50) NOT NULL,
  `data_zalozenia` date NOT NULL,
  `panstwo` varchar(50) DEFAULT NULL,
  `liczba_druzyn` int(11) DEFAULT NULL,
  `id_klub` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `liga`
--

INSERT INTO `liga` (`id_liga`, `szczebel_rozgrywkowy`, `data_zalozenia`, `panstwo`, `liczba_druzyn`, `id_klub`) VALUES
(1, 'Ekstraklasa', '1926-12-05', 'Polska', 16, 1),
(2, 'Seria A', '1929-10-02', 'Włochy', 20, 2),
(3, 'Premier League', '1992-02-20', 'Anglia', 20, 4),
(4, 'Bundesliga', '1962-07-28', 'Niemcy', 18, 5),
(5, 'Premier-liha', '1992-11-28', 'Ukraina', 12, 9),
(6, 'Priemjer-Liga', '1992-10-14', 'Rosja', 16, 10),
(7, 'EFL Championship', '2004-08-13', 'Anglia', 24, 15),
(8, 'Major League Soccer', '1996-01-25', 'Stany Zjednoczone', 26, 16),
(9, 'Priemjer Ligasy', '1992-03-20', 'Kazachstan', 12, 18),
(10, 'Prva hrvatska nogometna liga', '1991-05-21', 'Chorwacja', 10, 21);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozgrywka`
--

CREATE TABLE `rozgrywka` (
  `id_rozgrywka` int(11) NOT NULL,
  `data_rozgrywki` datetime NOT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `id_wygrane` int(11) DEFAULT NULL,
  `id_przegrane` int(11) DEFAULT NULL,
  `wynik` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wynik`
--

CREATE TABLE `wynik` (
  `id_wynik` int(11) NOT NULL,
  `id_klub` int(11) NOT NULL,
  `rozegrane` int(11) DEFAULT NULL,
  `wygrane` int(11) DEFAULT NULL,
  `remisy` int(11) DEFAULT NULL,
  `przegrane` int(11) DEFAULT NULL,
  `punkty` int(11) DEFAULT NULL,
  `id_liga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnik`
--

CREATE TABLE `zawodnik` (
  `id_zawodnik` int(11) NOT NULL,
  `imie_zawodnika` varchar(50) NOT NULL,
  `nazwisko_zawodnika` varchar(50) NOT NULL,
  `pozycja` varchar(50) DEFAULT NULL,
  `reprezentacja` varchar(50) DEFAULT NULL,
  `wiek_zawodnika` int(11) NOT NULL,
  `id_klub` int(11) DEFAULT NULL,
  `waga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zawodnik`
--

INSERT INTO `zawodnik` (`id_zawodnik`, `imie_zawodnika`, `nazwisko_zawodnika`, `pozycja`, `reprezentacja`, `wiek_zawodnika`, `id_klub`, `waga`) VALUES
(1, 'Radosław', 'Majecki', 'bramkarz', 'Polska', 21, 1, 78),
(2, 'Łukasz', 'Skorupski', 'bramkarz', 'Polska', 29, 2, 84),
(3, 'Wojciech', 'Szczęsny', 'bramkarz', 'Polska', 30, 3, 85),
(4, 'Jan', 'Bednarek', 'obrońca', 'Polska', 24, 4, 77),
(5, 'Łukasz', 'Piszczek', 'obrońca', 'Polska', 35, 5, 78),
(6, 'Bartosz', 'Bereszyński', 'obrońca', 'Polska', 28, 6, 77),
(7, 'Thiago', 'Cionek', 'obrońca', 'Polska', 34, 7, 79),
(8, 'Kamil', 'Glik', 'obrońca', 'Polska', 32, 8, 73),
(9, 'Artur', 'Jędrzejczyk', 'obrońca', 'Polska', 33, 1, 78),
(10, 'Tomasz', 'Kędziora', 'obrońca', 'Polska', 26, 9, 73),
(11, 'Arkadiusz', 'Reca', 'obrońca', 'Polska', 25, 7, 81),
(12, 'Maciej', 'Rybus', 'obrońca', 'Polska', 31, 10, 75),
(13, 'Dawid', 'Kownacki', 'napastnik', 'Polska', 23, 11, 81),
(14, 'Robert', 'Lewandowski', 'napastnik', 'Polska', 32, 12, 79),
(15, 'Arkadiusz', 'Milk', 'napastnik', 'Polska', 26, 13, 78),
(16, 'Krzysztof', 'Piątek', 'napastnik', 'Polska', 25, 14, 77),
(17, 'Krystian', 'Bielik', 'pomocnik', 'Polska', 22, 15, 78),
(18, 'Przmysłas', 'Frankowski', 'pomocnik', 'Polska', 25, 16, 70),
(19, 'Dominik', 'Furman', 'pomocnik', 'Polska', 28, 17, 71),
(20, 'Jacek', 'Góralski', 'pomocnik', 'Polska', 28, 18, 66),
(21, 'Kamil', 'Grosicki', 'pomocnik', 'Polska', 32, 19, 78),
(22, 'Kamil', 'Jóźwiak', 'pomocnik', 'Polska', 22, 20, 70),
(23, 'Damian', 'Kądzior', 'pomocnik', 'Polska', 28, 21, 70),
(24, 'Mateusz', 'Klich', 'pomocnik', 'Polska', 30, 22, 84),
(25, 'Grzegorz', 'Krychowiak', 'pomocnik', 'Polska', 30, 10, 83),
(26, 'Sebastian', 'Szymański', 'pomocnik', 'Polska', 21, 23, 58),
(27, 'Piotr', 'Zieliński', 'pomocnik', 'Polska', 26, 13, 75);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klub`
--
ALTER TABLE `klub`
  ADD PRIMARY KEY (`id_klub`);

--
-- Indeksy dla tabeli `liga`
--
ALTER TABLE `liga`
  ADD PRIMARY KEY (`id_liga`),
  ADD KEY `liga_klub_fk` (`id_klub`);

--
-- Indeksy dla tabeli `rozgrywka`
--
ALTER TABLE `rozgrywka`
  ADD PRIMARY KEY (`id_rozgrywka`),
  ADD KEY `wygrany_klub_fk` (`id_wygrane`),
  ADD KEY `przegrany_klub_fk` (`id_przegrane`);

--
-- Indeksy dla tabeli `wynik`
--
ALTER TABLE `wynik`
  ADD PRIMARY KEY (`id_wynik`),
  ADD KEY `wynik_klub_liga_fk` (`id_liga`),
  ADD KEY `wynik_klubu_fk` (`id_klub`);

--
-- Indeksy dla tabeli `zawodnik`
--
ALTER TABLE `zawodnik`
  ADD PRIMARY KEY (`id_zawodnik`),
  ADD KEY `klub_zawodnika_fk` (`id_klub`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `liga`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `liga_klub_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);

--
-- Ograniczenia dla tabeli `rozgrywka`
--
ALTER TABLE `rozgrywka`
  ADD CONSTRAINT `przegrany_klub_fk` FOREIGN KEY (`id_przegrane`) REFERENCES `klub` (`id_klub`),
  ADD CONSTRAINT `wygrany_klub_fk` FOREIGN KEY (`id_wygrane`) REFERENCES `klub` (`id_klub`);

--
-- Ograniczenia dla tabeli `wynik`
--
ALTER TABLE `wynik`
  ADD CONSTRAINT `wynik_klub_liga_fk` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`),
  ADD CONSTRAINT `wynik_klubu_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);

--
-- Ograniczenia dla tabeli `zawodnik`
--
ALTER TABLE `zawodnik`
  ADD CONSTRAINT `klub_zawodnika_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
