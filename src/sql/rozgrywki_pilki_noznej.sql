-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 17 Maj 2020, 18:34
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP SCHEMA
IF EXISTS rozgrywki_pilki_noznej
	CREATE SCHEMA rozgrywki_pilki_noznej COLLATE = utf8_general_ci;
USE rozgrywki_pilki_noznej;

CREATE USER gosc@’localhost’ IDENTIFIED BY ‘gosc’;
GRANT SELECT ON rozgrywki_pilki_noznej.* TO gosc@’localhost’;
CREATE USER rpn_admin@’localhost’ IDENTIFIED BY ‘rpn_admin’;
GRANT ALL PRIVILEGES ON rozgrywki_pilki_noznej.* TO rpn_admin@’localhost’;


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
(4, 'Southampton F.C.', 'Southampton', 'Ralph Hasenhuttl', 1871, 'Anglia'),
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
(15, 'Derby County', 'Derby', 'Phillip Cocu', 1884, 'Anglia'),
(16, 'Chicago Fire', 'Chicago', 'Raphael Wicky', 1997, 'Stany Zjednoczone'),
(17, 'Wisla Plock', 'Plock', 'Radoslaw Sobolewski', 1947, 'Polska'),
(18, 'Kajrat Almaty', 'Almaty', 'Alaksiej Szpileuski', 1954, 'Kazachstan'),
(19, 'West Bromwich Albion F.C.', 'West Bromwich', 'Slaven Bilic', 1878, 'Anglia'),
(20, 'Lech Poznan', 'Poznan', 'Dariusz Zuraw', 1948, 'Polska'),
(21, 'Dinamo Zagrzeb', 'Zagrzeb', 'Igor Jovicevic', 1945, 'Chorwacja'),
(22, 'Leeds United F.C.', 'Leeds', 'Marcelo Bielsa', 1919, 'Anglia'),
(23, 'Dinamo Moskwa', 'Moskwa', 'Krill Novikov', 1923, 'Rosja'),
(24, 'Manchester United F.C.', 'Manchester', 'Ole Gunnar Solskjer', 1978, 'Anglia'),
(25, 'Chelsea F.C.', 'Londyn', 'Frank Lampard', 1905, 'Anglia'),
(26, 'AS Roma', 'Rzym', 'Paulo Fonseca', 1927, 'Wlochy'),
(27, 'Real Madryt', 'Madryt', 'Zinedine Zidane', 1929, 'Hiszpania'),
(28, 'Villarreal CF', 'Vila-real', 'Javier Calleja', 1923, 'Hiszpania'),
(29, 'Sevilla FC', 'Sevilla', 'Julen Lopetegui', 1890, 'Hiszpania'),
(30, 'Paris Saint-Germain F.C.', 'Paryz', 'Thomas Tuchel', 1970, 'Francja'),
(31, 'Athletic Bilbao', 'Bilbao', 'Gaizka Garitano', 1898, 'Hiszpania'),
(32, 'Valencia CF', 'Walencja', 'Albert Celades', 1919, 'Hiszpania'),
(33, 'FC Barcelona', 'Barcelona', 'Quique Setien', 1899, 'Hiszpania'),
(34, 'Atletico Madryt', 'Madryt', 'Diego Simeone', 1903, 'Hiszpania'),
(35, 'Manchester City F.C.', 'Manchester', 'Pep Guardiola', 1880, 'Anglia'),
(36, 'RB Leipzig', 'Lipsk', 'Julian Nagelsmann', 2009, 'Niemcy'),
(37, 'Real Sociedad', 'San Sebastian', 'Imanol Alguacil', 1909, 'Hiszpania'),
(38, 'Everton F.C', 'Liverpool', 'Carlo Ancelotti', 1878, 'Anglia'),
(39, 'Stoke City F.C.', 'Stoke-on-Trent', 'Michael O’Neill', 1863, 'Anglia'),
(40, 'Burnley F.C.', 'Burnley', 'Sean Dyche', 1882, 'Anglia'),
(41, 'Liverpool F.C.', 'Liverpool', 'Lijnders', 1894, 'Anglia'),
(42, 'Tottenham Hotspur F.C.', 'Tottenham', 'José Mourinho', 1882, 'Anglia'),
(43, 'Leicester City F.C.', 'Leicester', 'Brendan Rodgers', 1884, 'Anglia'),
(44, 'West Ham United F.C.', 'Londyn', 'David Moyes', 1895, 'Anglia'),
(45, 'A.F.C. Bournemouth', 'Bournemouth', 'Eddie Howe', 1899, 'Anglia'),
(46, 'FC Koln', 'Koln', 'Markus Gisdol', 1948, 'Niemcy'),
(47, 'Borussia Monchengladbach', 'Monchengladbach', 'Marco Rose', 1966, 'Niemcy'),
(48, 'Bayer 04 Leverkusen', 'Leverkusen', 'Peter Bosz', 1979, 'Niemcy'),
(49, 'Hertha BSC', 'Berlin', 'Bruno Labbadia', 1892, 'Niemcy'),
(50, 'Cracovia', 'Krakow', 'Michal Probierz', 1906, 'Polska'),
(51, 'Piast Gliwice', 'Gliwice', 'Waldemar Fornalik', 1945, 'Polska'),
(52, 'Slask Wroclaw', 'Wroclaw', 'Vitezslav Lavicka', 1947, 'Polska'),
(53, 'Pogon Szczecin', 'Szczecin', 'Kosta Runjaic', 1948, 'Polska'),
(54, 'Lechia Gdansk', 'Gdansk', 'Piotr Stokowiec', 1949, 'Polska'),
(55, 'Gornik Zabrze', 'Zabrze', 'Marcin Brosz', 1948, 'Polska'),
(56, 'Jagiellonia Bialystok', 'Bialystok', ' Iwajlo Petew', 1920, 'Polska'),
(57, 'Korona Kielce', 'Kielce', 'Maciej Bartoszek', 1973, 'Polska'),
(58, 'Wisla Krakow', 'Krakow', 'Artur Skowronek', 1927, 'Polska'),
(59, 'Miami FC', 'Miami', 'Nelson Vargas', 2015, 'Stany Zjednoczone'),
(60, 'Saint Louis FC', 'Missouri', 'Steve Trittschuh', 2014, 'Stany Zjednoczone'),
(61, 'Philadelphia Union', 'Filadelfia', 'Jim Curtin', 2008, 'Stany Zjednoczone'),
(62, 'Loudoun', 'Lessburg', 'Ryan Martin', 2018, 'Stany Zjednoczone'),
(63, 'FC Astana', 'Nur-Sułtan', 'Roman Hryhorczuk', 2009, 'Kazachstan'),
(64, 'Kaspij Aktau', 'Aktau', 'Sava Kovačević', 1962, 'Kazachstan'),
(65, 'Ordabasy', 'Szymkent', 'Kachaber Cchadadze', 2000, 'Kazachstan'),
(66, 'Kyzylzhar', 'Petropavl', 'Veaceslav Rusnac', 1968, 'Kazachstan'),
(67, 'Szachtar', 'Charków', 'Luís Castro', 1992, 'Ukraina'),
(68, 'Lokomotiva Zagrzeb', 'Zagrzeb', 'Sreten Ćuk', 1914, 'Chorwacja'),
(69, 'Dinamo Zagrzeb', 'Zagrzeb', 'Igor Jovićević', 1945, 'Chorwacja'),
(70, 'HNK Gorica', 'Velika Gorica', ' Valdas Dambrauskas', 2018, 'Chorwacja'),
(71, 'Istra', 'Pula', ' Robert Rubčić', 1948, 'Chorwacja'),
(72, 'Hajduk Split', 'Split', 'Igor Tudor', 1911, 'Chorwacja'),
(73, 'Slaven Belupo', 'Korpivnica', 'Željko Kopić', 1912, 'Chorwacja'),
(74, 'Rijeka', 'Rijeka', 'Simon Rožman', 1946, 'Chorwacja'),
(75, 'Inter Zapresic', 'Zapresic', 'Željko Petrović', 1929, 'Chorwacja');

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
  `id_klub_wygrany` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `liga`
--

INSERT INTO `liga` (`id_liga`, `szczebel_rozgrywkowy`, `data_zalozenia`, `panstwo`, `liczba_druzyn`, `id_klub_wygrany`) VALUES
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
(11, 'LaLiga', '1929-02-10', 'Hiszpania', 20, 33),
(12, 'Liga Mistrzow UEFA', '1955-01-01', 'Europa', 32, 41);

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
(4, '2020-03-07 16:00:00', 'Madryt', 34, 29, 2, 2, 11),
(5, '2020-03-01 21:00:00', 'Madryt', 27, 33, 2, 0, 11),
(6, '2020-02-23 21:00:00', 'Madryt', 34, 28, 3, 1, 11),
(7, '2020-02-22 18:30:00', 'San Sebastian', 37, 32, 3, 0, 11),
(8, '2020-02-01 16:00:00', 'Madryt', 27, 34, 1, 0, 11),
(9, '2020-01-25 16:00:00', 'Walencja', 32, 33, 2, 0, 11),
(10, '2019-12-14 16:00:00', 'San Sebastian', 37, 33, 2, 2, 11),
(11, '2020-03-01 15:30:00', 'Lipsk', 36, 48, 1, 1, 4),
(12, '2020-02-28 20:30:00', 'Lipsk', 11, 14, 3, 3, 4),
(13, '2020-01-26 20:30:00', 'Leverkusen', 48, 11, 3, 0, 4),
(14, '2020-01-19 15:30:00', 'Berlin', 14, 12, 0, 4, 4),
(15, '2019-12-14 18:30:00', 'Düsseldorf', 11, 36, 0, 3, 4),
(16, '2019-12-07 15:30:00', 'Dortmund', 5, 11, 5, 0, 4),
(17, '2019-11-30 15:30:00', 'Berlin', 14, 5, 1, 2, 4),
(18, '2019-11-23 15:30:00', 'Düsseldorf', 11, 12, 0, 4, 4),
(19, '2019-10-05 15:30:00', 'Leverkusen', 48, 36, 1, 1, 4),
(20, '2019-09-14 18:30:00', 'Lipsk', 36, 12, 1, 1, 4),
(21, '2020-03-08 17:30:00', 'Manchester', 24, 35, 2, 0, 3),
(22, '2020-01-11 16:00:00', 'Leicester', 43, 4, 1, 2, 3),
(23, '2020-01-19 17:30:00', 'Liverpool', 41, 24, 2, 0, 3),
(24, '2020-01-22 21:15:00', 'Manchester', 24, 40, 0, 2, 3),
(25, '2020-01-11 16:00:00', 'Londyn', 25, 40, 3, 0, 3),
(26, '2019-12-22 17:30:00', 'Londyn', 42, 25, 0, 2, 3),
(27, '2019-12-14 16:00:00', 'Londyn', 25, 45, 0, 1, 3),
(28, '2019-12-07 16:00:00', 'Bournemouth', 45, 41, 0, 3, 3),
(29, '2020-01-18 16:00:00', 'Londyn', 44, 38, 1, 1, 3),
(30, '2019-12-04 16:00:00', 'Liverpool', 41, 38, 5, 2, 3),
(31, '2019-12-15 17:30:00', 'Bialystok', 56, 54, 3, 0, 1),
(32, '2020-03-08 17:30:00', 'Warszawa', 1, 51, 1, 2, 1),
(33, '2019-11-30 20:00:00', 'Warszawa', 1, 57, 4, 0, 1),
(34, '2019-11-22 17:30:00', 'Poznan', 20, 51, 3, 0, 1),
(35, '2019-12-21 20:00:00', 'Zabrze', 55, 56, 3, 0, 1),
(36, '2019-12-21 17:30:00', 'Plock', 17, 51, 2, 1, 1),
(37, '2019-11-09 15:00:00', 'Plock', 17, 50, 0, 0, 1),
(38, '2019-11-24 17:30:00', 'Wroclaw', 52, 58, 2, 1, 1),
(39, '2020-02-23 15:00:00', 'Krakow', 58, 57, 2, 0, 1),
(40, '2020-03-06 20:30:00', 'Zabrze', 55, 50, 3, 2, 1),
(41, '2019-12-11 21:00:00', 'Monachium', 12, 42, 3, 1, 12),
(42, '2019-12-11 21:00:00', 'Madryt', 34, 10, 2, 0, 12),
(43, '2019-12-11 18:55:00', 'Zagrzeb', 21, 35, 1, 4, 12),
(44, '2019-11-06 21:00:00', 'Leverkusen', 34, 48, 2, 1, 12),
(45, '2020-02-25 21:00:00', 'Neapol', 13, 33, 1, 1, 12),
(46, '2019-11-26 21:00:00', 'Turyn', 3, 34, 1, 0, 12),
(47, '2019-11-06 21:00:00', 'Moskwa', 10, 48, 0, 2, 12),
(48, '2019-11-27 21:00:00', 'Barcelona', 33, 5, 3, 1, 12),
(49, '2020-02-26 21:00:00', 'Madryt', 27, 35, 1, 2, 12),
(50, '2020-02-25 21:00:00', 'Londyn', 25, 12, 0, 3, 12),
(51, '2020-01-25 15:00:00', 'Ferrara', 7, 2, 1, 3, 2),
(52, '2020-01-12 20:45:00', 'Rzym', 26, 3, 1, 2, 2),
(53, '2020-01-18 18:55:00', 'Genua', 6, 3, 1, 2, 2),
(54, '2019-12-15 18:00:00', 'Rzym', 26, 7, 3, 1, 2),
(55, '2019-12-01 18:00:00', 'Neapol', 13, 2, 1, 2, 2),
(56, '2019-11-04 20:45:00', 'Ferrara', 7, 6, 0, 1, 2),
(57, '2019-11-02 15:30:00', 'Rzym', 26, 13, 2, 1, 2),
(58, '2019-10-27 15:00:00', 'Ferrara', 7, 13, 1, 1, 2),
(59, '2019-10-27 12:30:00', 'Bolonia', 2, 6, 2, 1, 2),
(60, '2019-10-20 15:00:00', 'Genua', 6, 26, 0, 0, 2),
(61, '2019-10-19 20:45:00', 'Bolonia', 3, 2, 2, 1, 2),
(62, '2020-01-28 20:45:00', 'Derby', 15, 39, 4, 0, 7),
(63, '2020-01-20 21:00:00', 'West Bromwich', 19, 39, 0, 1, 7),
(64, '2020-01-01 18:15:00', 'West Bromwich', 19, 22, 1, 1, 7),
(65, '2019-11-04 21:00:00', 'Stoke on Trent', 39, 19, 0, 2, 7),
(66, '2019-09-21 13:30:00', 'Leeds', 22, 15, 1, 1, 7),
(67, '2019-08-24 16:00:00', 'Stoke on Tren', 39, 22, 0, 3, 7),
(68, '2019-08-24 13:30:00', 'Derby', 15, 19, 1, 1, 7),
(69, '2019-08-17 16:00:00', 'Stoke on Trent', 39, 15, 2, 2, 7),
(70, '2020-01-17 13:30:00', 'Filadelfia', 59, 61, 0, 0, 8),
(71, '2020-03-08 01:30:00', 'Filadelfia', 61, 62, 0, 0, 8),
(72, '2020-03-08 02:00:00', 'Saint Louis', 60, 59, 4, 1, 8),
(73, '2020-03-15 12:00:00', 'Kokshetau', 64, 63, 2, 3, 9),
(74, '2020-03-15 12:00:00', 'Karagandy', 67, 18, 1, 0, 9),
(75, '2020-03-11 11:00:00', 'Ałmaty', 18, 65, 5, 0, 9),
(76, '2020-03-11 09:00:00', 'Ałmaty', 63, 65, 1, 1, 9),
(77, '2020-03-07 09:00:00', 'Ałmaty', 18, 66, 4, 0, 9),
(78, '2020-03-09 18:00:00', 'Velika Gorica', 70, 68, 1, 3, 10),
(79, '2020-03-08 17:30:00', 'Rijeka', 74, 72, 2, 0, 10),
(80, '2020-03-08 15:00:00', 'Zagrzeb', 69, 71, 2, 0, 10),
(81, '2020-03-07 15:00:00', 'Zapresic', 75, 73, 0, 2, 10),
(82, '2020-03-04 19:00:00', 'Split', 72, 69, 0, 2, 10),
(83, '2020-03-03 19:00:00', 'Rijeka', 74, 70, 4, 1, 10),
(84, '2020-03-03 17:00:00', 'Zagrzeb', 68, 73, 3, 0, 10),
(85, '2020-02-29 17:30:00', 'Zagrzeb', 69, 74, 4, 0, 10),
(86, '2020-02-28 19:00:00', 'Velika Gorica', 70, 71, 3, 0, 10),
(87, '2020-02-27 16:30:00', 'Zapresic', 75, 68, 0, 2, 10),
(88, '2020-02-23 17:30:00', 'Pula', 71, 73, 1, 1, 10),
(89, '2020-02-23 15:00:00', 'Zagrzeb', 69, 75, 3, 2, 10),
(90, '2020-02-22 15:00:00', 'Split', 72, 70, 6, 0, 10),
(91, '2020-02-16 17:30:00', 'Velika Gorica', 70, 74, 0, 0, 10),
(92, '2020-02-15 17:30:00', 'Koprivnica', 73, 72, 2, 1, 10),
(93, '2020-02-14 18:00:00', 'Zagrzeb', 68, 71, 2, 0, 10),
(94, '2020-02-09 17:30:00', 'Zagrzeb', 69, 70, 2, 0, 10),
(95, '2020-02-09 15:00:00', 'Rijeka', 74, 73, 1, 0, 10),
(96, '2020-02-08 17:30:00', 'Split', 72, 68, 1, 0, 10),
(97, '2020-02-01 17:30:00', 'Koprivnica', 73, 69, 0, 2, 10),
(98, '2020-02-01 15:00:00', 'Zagrzeb', 74, 68, 2, 1, 10),
(99, '2020-01-31 18:00:00', 'Zapresic', 75, 71, 2, 0, 10),
(100, '2019-12-14 17:30:00', 'Zagrzeb', 69, 68, 1, 0, 10);

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
(5, 34, 27, 11, 12, 4, 45, 11),
(6, 32, 27, 11, 9, 7, 42, 11),
(7, 28, 27, 11, 5, 11, 38, 11),
(8, 31, 27, 9, 10, 8, 37, 11),
(9, 41, 29, 27, 1, 1, 82, 3),
(10, 35, 28, 18, 3, 7, 57, 3),
(11, 43, 29, 16, 5, 8, 53, 3),
(12, 25, 29, 14, 6, 9, 48, 3),
(13, 24, 29, 12, 9, 8, 45, 3),
(14, 42, 29, 11, 8, 10, 41, 3),
(15, 40, 29, 11, 6, 12, 39, 3),
(16, 38, 29, 10, 7, 12, 37, 3),
(17, 4, 29, 10, 4, 15, 34, 3),
(18, 44, 29, 7, 6, 16, 27, 3),
(19, 45, 29, 7, 6, 16, 27, 3),
(20, 3, 26, 20, 3, 3, 63, 2),
(21, 26, 26, 13, 6, 7, 45, 2),
(22, 2, 26, 9, 7, 10, 34, 2),
(23, 6, 25, 7, 5, 13, 26, 2),
(24, 7, 26, 5, 3, 18, 18, 2),
(25, 12, 25, 17, 4, 4, 55, 4),
(26, 2, 25, 15, 6, 4, 51, 4),
(27, 36, 25, 14, 8, 3, 50, 4),
(28, 48, 25, 14, 5, 6, 47, 4),
(29, 49, 25, 7, 7, 11, 28, 4),
(30, 11, 25, 5, 7, 13, 22, 4),
(31, 1, 26, 16, 3, 7, 51, 1),
(32, 20, 26, 11, 9, 6, 42, 1),
(33, 17, 26, 10, 6, 10, 36, 1),
(34, 18, 3, 3, 0, 1, 6, 9),
(35, 10, 22, 12, 5, 5, 41, 6),
(36, 22, 37, 21, 8, 8, 71, 7),
(37, 23, 22, 8, 6, 8, 30, 6),
(38, 19, 37, 19, 13, 5, 70, 7),
(39, 15, 37, 13, 12, 12, 51, 7),
(40, 39, 37, 12, 6, 19, 42, 7),
(41, 16, 34, 10, 12, 12, 42, 8),
(42, 51, 26, 13, 4, 9, 43, 1),
(43, 50, 26, 13, 3, 10, 42, 1),
(44, 52, 26, 11, 9, 6, 42, 1),
(45, 53, 26, 11, 8, 7, 41, 1),
(46, 54, 26, 10, 8, 8, 38, 1),
(47, 56, 26, 10, 7, 9, 37, 1),
(48, 55, 26, 8, 9, 9, 33, 1),
(49, 58, 26, 9, 4, 13, 31, 1),
(50, 57, 26, 7, 5, 14, 26, 1),
(51, 5, 25, 15, 6, 4, 51, 4),
(52, 14, 25, 7, 7, 11, 28, 4),
(53, 46, 25, 10, 2, 13, 31, 4),
(54, 47, 25, 15, 4, 6, 49, 4);

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
(51, 'Gerard', 'Moreno', 'napastnik', 'Hiszpania', 28, 28, 75),
(52, 'Jordan', 'Pickford', 'bramkarz', 'Anglia', 26, 38, 77),
(53, 'Jack', 'Butland', 'bramkarz', 'Anglia', 27, 39, 94),
(54, 'Tom', 'Heaton', 'bramkarz', 'Anglia', 34, 40, 85),
(55, 'Kyle', 'Walker', 'obronca', 'Anglia', 30, 35, 83),
(56, 'Danny', 'Rose', 'obronca', 'Anglia', 30, 42, 76),
(57, 'John', 'Stones', 'obronca', 'Anglia', 26, 35, 70),
(58, 'Harry', 'Maguire', 'obronca', 'Anglia', 27, 24, 100),
(59, 'Joe', 'Gomez', 'obronca', 'Anglia', 23, 41, 77),
(60, 'Ben', 'Chilwell', 'obronca', 'Anglia', 24, 43, 77),
(61, 'Michael', 'Keane', 'obronca', 'Anglia', 27, 38, 82),
(62, 'John', 'Alexander-Arnold', 'obronca', 'Anglia', 22, 41, 69),
(63, 'Eric', 'Dier', 'pomocnik', 'Anglia', 26, 42, 90),
(64, 'Jesse', 'Lingard', 'pomocnik', 'Anglia', 28, 24, 65),
(65, 'Jordan', 'Henderson', 'pomocnik', 'Anglia', 30, 41, 80),
(66, 'Declan', 'Rice', 'pomocnik', 'Anglia', 21, 44, 80),
(67, 'Fabian', 'Delph', 'pomocnik', 'Anglia', 31, 38, 60),
(68, 'Ross', 'Barkley', 'pomocnik', 'Anglia', 27, 25, 87),
(69, 'Dele', 'Alli', 'pomocnik', 'Anglia', 24, 42, 80),
(70, 'Harry', 'Kane', 'napastnik', 'Anglia', 27, 42, 86),
(71, 'Raheem', 'Starlin', 'napastnik', 'Anglia', 26, 35, 69),
(72, 'Jadon', 'Sancho', 'napastnik', 'Anglia', 20, 5, 76),
(73, 'Marcus', 'Rashford', 'napastnik', 'Anglia', 23, 24, 70),
(74, 'Callum', 'Wilson', 'napastnik', 'Anglia', 28, 45, 66),
(75, 'Manuel', 'Neuer', 'bramkarz', 'Niemcy', 34, 12, 92),
(76, 'Kevin', 'Trapp', 'bramkarz', 'Niemcy', 29, 30, 88),
(77, 'Sven', 'Ulreich', 'bramkarz', 'Niemcy', 31, 12, 84),
(78, 'Thilo', 'Kehrer', 'obronca', 'Niemcy', 23, 30, 76),
(79, 'Jonas', 'Hector', 'obronca', 'Niemcy', 29, 46, 75),
(80, 'Matthias', 'Ginter', 'obronca', 'Niemcy', 26, 47, 85),
(81, 'Jonathan', 'Tah', 'obronca', 'Niemcy', 24, 48, 97),
(82, 'Marcel', 'Halstenberg', 'obronca', 'Niemcy', 28, 36, 82),
(83, 'Nico', 'Schulz', 'obronca', 'Niemcy', 27, 30, 78),
(84, 'Niklas', 'Sule', 'obronca', 'Niemcy', 24, 12, 97),
(85, 'Lukas', 'Klostermann', 'obronca', 'Niemcy', 23, 36, 83),
(86, 'Niklas', 'Stark', 'obronca', 'Niemcy', 25, 49, 88),
(87, 'Joshua', 'Kimmich', 'pomocnik', 'Niemcy', 25, 12, 72),
(88, 'Julian', 'Draxler', 'pomocnik', 'Niemcy', 72, 30, 26),
(89, 'Marco', 'Reus', 'pomocnik', 'Niemcy', 30, 5, 71),
(90, 'Leon', 'Goretzka', 'pomocnik', 'Niemcy', 25, 12, 76),
(91, 'Ilkay', 'Gundogan', 'pomocnik', 'Niemcy', 29, 35, 80),
(92, 'Kai', 'Havertz', 'pomocnik', 'Niemcy', 20, 48, 82),
(93, 'Timo', 'Werner', 'napastnik', 'Niemcy', 24, 36, 75),
(94, 'Julian', 'Brandt', 'napastnik', 'Niemcy', 24, 5, 83),
(95, 'Leroy', 'Sané', 'napastnik', 'Niemcy', 24, 35, 75),
(96, 'Serge', 'Gnabry', 'napastnik', 'Niemcy', 24, 12, 75);

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
  ADD KEY `liga_klub_fk` (`id_klub_wygrany`);

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
  ADD CONSTRAINT `liga_klub_fk` FOREIGN KEY (`id_klub_wygrany`) REFERENCES `klub` (`id_klub`);

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
