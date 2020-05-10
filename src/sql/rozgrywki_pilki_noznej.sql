SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rozgrywki_pilki_noznej`
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
  `panstwo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klub`
--

INSERT INTO `klub` (`id_klub`, `nazwa_klubu`, `siedziba`, `trener_klubu`, `data_zalozenia`, `panstwo`) VALUES
(1, 'Legia Warszawa', 'Warszawa', 'Aleksandar Vukovic', 1916, 'Polska'),
(2, 'Bologna FC', 'Bolonia', 'Sinisa Mihajlovic', 1909, 'Wlochy'),
(3, 'Juventus F.C.', 'Turyn', 'Maurizio Sarri', 1897, 'Wlochy'),
(4, 'Southampton F.C.', 'Southampton', 'Ralph Hasenhuttl', 1871, 'Wielka Brytania'),
(5, 'Borussia Dortmund', 'Dortmund', 'Lucien Favre', 1909, 'Niemcy'),
(6, 'UC Sampdoria', 'Genua', 'Claudio Ranieri', 1946, 'Wlochy'),
(7, 'SPAL 2013', 'Ferrara', 'Luigi Di Biagio', 1907, 'Wlochy'),
(8, 'AS Monaco', 'Monaco', 'Robert Moreno', 1924, 'Monaco'),
(9, 'Dynamo Kijow', 'Kijow', 'Oleksij Mychajlyczenko', 1927, 'Ukraina'),
(10, 'Lokomotiw Moskwa', 'Moskwa', 'Jurij Siomin', 1923, 'Rosja'),
(11, 'Fortuna Dusseldorf', 'Dusseldorf', 'Uwe Rosler', 1895, 'Niemcy'),
(12, 'Bayern Monachium', 'Monachium', 'Hans-Dieter Flick', 1965, 'Niemcy'),
(13, 'SSC Napoli', 'Neapol', 'Gennaro Gattuso', 1926, 'Wlochy'),
(14, 'Hertha BSC', 'Berlin', 'Bruno Labbadia', 1892, 'Niemcy'),
(15, 'Derby County', 'Derby', 'Phillip Cocu', 1884, 'Wielka Brytania'),
(16, 'Chicago Fire', 'Chicago', 'Raphael Wicky', 1997, 'Stany Zjednoczone'),
(17, 'Wisla Plock', 'Plock', 'Radoslaw Sobolewski', 1947, 'Polska'),
(18, 'Kajrat Almaty', 'Almaty', 'Alaksiej Szpileuski', 1954, 'Kazachstan'),
(19, 'West Bromwich Albion F.C.', 'West Bromwich', 'Slaven Bilic', 1878, 'Wielka Brytania'),
(20, 'Lech Poznan', 'Poznan', 'Dariusz Zuraw', 1948, 'Polska'),
(21, 'Dinamo Zagrzeb', 'Zagrzeb', 'Igor Jovicevic', 1945, 'Chorwacja'),
(22, 'Leeds United F.C.', 'Leeds', 'Marcelo Bielsa', 1919, 'Wielka Brytania'),
(23, 'Dinamo Moskwa', 'Moskwa', 'Krill Novikov', 1923, 'Rosja'),
(24, 'Manchester United F.C.', 'Manchester', 'Ole Gunnar Solskjer', 1978, 'Wielka Brytania'),
(25, 'Chelsea F.C.', 'Londyn', 'Frank Lampard', 1905, 'Wielka Brytania'),
(26, 'AS Roma', 'Rzym', 'Paulo Fonseca', 1927, 'Wlochy'),
(27, 'Real Madryt', 'Madryt', 'Zinedine Zidane', 1929, 'Hiszpania'),
(28, 'Villarreal CF', 'Vila-real', 'Javier Calleja', 1923, 'Hiszpania'),
(29, 'Sevilla FC', 'Sevilla', 'Julen Lopetegui', 1890, 'Hiszpania'),
(30, 'Paris Saint-Germain F.C.', 'Paryz', 'Thomas Tuchel', 1970, 'Francja'),
(31, 'Athletic Bilbao', 'Bilbao', 'Gaizka Garitano', 1898, 'Hiszpania'),
(32, 'Valencia CF', 'Walencja', 'Albert Celades', 1919, 'Hiszpania'),
(33, 'FC Barcelona', 'Barcelona', 'Quique Setien', 1899, 'Hiszpania'),
(34, 'Atletico Madryt', 'Madryt', 'Diego Simeone', 1903, 'Hiszpania'),
(35, 'Manchester City F.C.', 'Manchester', 'Pep Guardiola', 1880, 'Wielka Brytania'),
(36, 'RB Leipzig', 'Lipsk', 'Julian Nagelsmann', 2009, 'Niemcy'),
(37, 'Real Sociedad', 'San Sebastian', 'Imanol Alguacil', 1909, 'Hiszpania');

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
(2, 'Seria A', '1929-10-02', 'Wlochy', 20, 2),
(3, 'Premier League', '1992-02-20', 'Anglia', 20, 4),
(4, 'Bundesliga', '1962-07-28', 'Niemcy', 18, 5),
(5, 'Premier-liha', '1992-11-28', 'Ukraina', 12, 9),
(6, 'Priemjer-Liga', '1992-10-14', 'Rosja', 16, 10),
(7, 'EFL Championship', '2004-08-13', 'Anglia', 24, 15),
(8, 'Major League Soccer', '1996-01-25', 'Stany Zjednoczone', 26, 16),
(9, 'Priemjer Ligasy', '1992-03-20', 'Kazachstan', 12, 18),
(10, 'Prva hrvatska nogometna liga', '1991-05-21', 'Chorwacja', 10, 21),
(11, 'LaLiga', '1929-02-10', 'Hiszpania', 20, 33);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozgrywka`
--

CREATE TABLE `rozgrywka` (
  `id_rozgrywka` int(11) NOT NULL,
  `data_rozgrywki` datetime NOT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `id_klub1` int(11) DEFAULT NULL,
  `id_klub2` int(11) DEFAULT NULL,
  `wynik_klub1` int(11) DEFAULT NULL,
  `wynik_klub2` int(11) DEFAULT NULL,
  `id_liga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rozgrywka`
--

INSERT INTO `rozgrywka` (`id_rozgrywka`, `data_rozgrywki`, `miejscowosc`, `id_klub1`, `id_klub2`, `wynik_klub1`, `wynik_klub2`, `id_liga`) VALUES
(1, '2020-03-07 18:30:00', 'Barcelona', 33, 37, 1, 0, 11),
(2, '2020-03-01 21:00:00', 'Madryt', 37, 33, 2, 0, 11),
(3, '2020-03-01 14:00:00', 'Bilbao', 31, 28, 1, 0, 11),
(4, '2020-03-07 16:00:00', 'Madryt', 34, 29, 2, 2, 11);

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

--
-- Zrzut danych tabeli `wynik`
--

INSERT INTO `wynik` (`id_wynik`, `id_klub`, `rozegrane`, `wygrane`, `remisy`, `przegrane`, `punkty`, `id_liga`) VALUES
(1, 33, 27, 18, 4, 5, 58, 11),
(2, 27, 27, 16, 8, 3, 56, 11),
(3, 29, 27, 13, 8, 6, 47, 11),
(4, 37, 27, 14, 4, 9, 46, 11),
(5, 34, 27, 11, 12, 4, 45, 11);

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
(1, 'Radoslaw', 'Majecki', 'bramkarz', 'Polska', 21, 1, 78),
(2, 'Lukasz', 'Skorupski', 'bramkarz', 'Polska', 29, 2, 84),
(3, 'Wojciech', 'Szczesny', 'bramkarz', 'Polska', 30, 3, 85),
(4, 'Jan', 'Bednarek', 'obronca', 'Polska', 24, 4, 77),
(5, 'Lukasz', 'Piszczek', 'obronca', 'Polska', 35, 5, 78),
(6, 'Bartosz', 'Bereszynski', 'obronca', 'Polska', 28, 6, 77),
(7, 'Thiago', 'Cionek', 'obronca', 'Polska', 34, 7, 79),
(8, 'Kamil', 'Glik', 'obronca', 'Polska', 32, 8, 73),
(9, 'Artur', 'Jedrzejczyk', 'obronca', 'Polska', 33, 1, 78),
(10, 'Tomasz', 'Kedziora', 'obronca', 'Polska', 26, 9, 73),
(11, 'Arkadiusz', 'Reca', 'obronca', 'Polska', 25, 7, 81),
(12, 'Maciej', 'Rybus', 'obronca', 'Polska', 31, 10, 75),
(13, 'Dawid', 'Kownacki', 'napastnik', 'Polska', 23, 11, 81),
(14, 'Robert', 'Lewandowski', 'napastnik', 'Polska', 32, 12, 79),
(15, 'Arkadiusz', 'Milk', 'napastnik', 'Polska', 26, 13, 78),
(16, 'Krzysztof', 'Piatek', 'napastnik', 'Polska', 25, 14, 77),
(17, 'Krystian', 'Bielik', 'pomocnik', 'Polska', 22, 15, 78),
(18, 'Przemyslaw', 'Frankowski', 'pomocnik', 'Polska', 25, 16, 70),
(19, 'Dominik', 'Furman', 'pomocnik', 'Polska', 28, 17, 71),
(20, 'Jacek', 'Goralski', 'pomocnik', 'Polska', 28, 18, 66),
(21, 'Kamil', 'Grosicki', 'pomocnik', 'Polska', 32, 19, 78),
(22, 'Kamil', 'Jozwiak', 'pomocnik', 'Polska', 22, 20, 70),
(23, 'Damian', 'Kadzior', 'pomocnik', 'Polska', 28, 21, 70),
(24, 'Mateusz', 'Klich', 'pomocnik', 'Polska', 30, 22, 84),
(25, 'Grzegorz', 'Krychowiak', 'pomocnik', 'Polska', 30, 10, 83),
(26, 'Sebastian', 'Szymanski', 'pomocnik', 'Polska', 21, 23, 58),
(27, 'Piotr', 'Zielinski', 'pomocnik', 'Polska', 26, 13, 75),
(28, 'David', 'De Gea', 'bramkarz', 'Hiszpania', 29, 24, 82),
(29, 'Kepa', 'Arrizabalaga', 'bramkarz', 'Hiszpania', 25, 25, 88),
(30, 'Pau', 'Lopez', 'bramkarz', 'Hiszpania', 25, 26, 77),
(31, 'Sergio', 'Ramos', 'obronca', 'Hiszpania', 34, 27, 82),
(32, 'Raul', 'Albiol', 'obronca', 'Hiszpania', 34, 28, 82),
(33, 'Jesus', 'Navas', 'obronca', 'Hiszpania', 34, 29, 64),
(34, 'Dani', 'Carvajal', 'obronca', 'Hiszpania', 28, 27, 73),
(35, 'Juan', 'Bernat', 'obronca', 'Hiszpania', 27, 30, 67),
(36, 'Inigo', 'Martinez', 'obronca', 'Hiszpania', 28, 31, 77),
(37, 'Jose Luis', 'Gaya', 'obronca', 'Hiszpania', 24, 32, 64),
(39, 'Pau', 'Torres', 'obronca', 'Hiszpania', 23, 28, 80),
(40, 'Sergio', 'Busquets', 'pomocnik', 'Hiszpania', 31, 33, 76),
(41, 'Santi', 'Cazorla', 'pomocnik', 'Hiszpania', 35, 28, 67),
(42, 'Thiago', 'Alcantara', 'pomocnik', 'Hiszpania', 29, 12, 71),
(43, 'Saul', 'Niguez', 'pomocnik', 'Hiszpania', 25, 34, 70),
(44, 'Rodrigo', 'Cascante', 'pomocnik', 'Hiszpania', 23, 35, 82),
(45, 'Fabian', 'Ruiz', 'pomocnik', 'Hiszpania', 24, 13, 70),
(46, 'Pablo', 'Sarabia', 'pomocnik', 'Hiszpania', 27, 30, 70),
(47, 'Dani', 'Olmo', 'pomocnik', 'Hiszpania', 22, 36, 68),
(48, 'Alvaro', 'Morata', 'napastnik', 'Hiszpania', 27, 34, 84),
(49, 'Paco', 'Alcacer', 'napastnik', 'Hiszpania', 26, 28, 72),
(50, 'Mikel', 'Oyarzabal', 'napastnik', 'Hiszpania', 23, 37, 78),
(51, 'Gerard', 'Moreno', 'napastnik', 'Hiszpania', 28, 28, 75);

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
  ADD KEY `wygrany_klub_fk` (`id_klub1`),
  ADD KEY `przegrany_klub_fk` (`id_klub2`),
  ADD KEY `rozgrywka_liga_fk` (`id_liga`);

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
  ADD CONSTRAINT `przegrany_klub_fk` FOREIGN KEY (`id_klub2`) REFERENCES `klub` (`id_klub`),
  ADD CONSTRAINT `rozgrywka_liga_fk` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`),
  ADD CONSTRAINT `wygrany_klub_fk` FOREIGN KEY (`id_klub1`) REFERENCES `klub` (`id_klub`);

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
