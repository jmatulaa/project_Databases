SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DROP SCHEMA

IF EXISTS rozgrywki_pilki_noznej;
	CREATE SCHEMA rozgrywki_pilki_noznej COLLATE = utf8_general_ci;

USE rozgrywki_pilki_noznej;


CREATE TABLE `klub` (
  `id_klub` int(11) NOT NULL,
  `nazwa_klubu` varchar(50) NOT NULL,
  `siedziba` varchar(50) DEFAULT NULL,
  `trener_klubu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `liga` (
  `id_liga` int(11) NOT NULL,
  `szczebel_rozgrywkowy` varchar(50) NOT NULL,
  `data_zalozenia` date NOT NULL,
  `panstwo` varchar(50) DEFAULT NULL,
  `liczba_druzyn` int(11) DEFAULT NULL,
  `id_klub` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `rozgrywka` (
  `id_rozgrywka` int(11) NOT NULL,
  `data_rozgrywki` datetime NOT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `id_klub1` int(11) DEFAULT NULL,
  `id_klub2` int(11) DEFAULT NULL,
  `wynik_klub1` int(11) DEFAULT NULL,
  `wynik_klub2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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


CREATE TABLE `zawodnik` (
  `id_zawodnik` int(11) NOT NULL,
  `imie_zawodnika` varchar(50) NOT NULL,
  `nazwisko_zawodnika` varchar(50) NOT NULL,
  `pozycja` varchar(50) DEFAULT NULL,
  `reprezentacja` varchar(50) DEFAULT NULL,
  `wiek_zawodnika` int(11) NOT NULL,
  `id_klub` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `klub`
  ADD PRIMARY KEY (`id_klub`);

ALTER TABLE `liga`
  ADD PRIMARY KEY (`id_liga`),
  ADD KEY `liga_klub_fk` (`id_klub`);

ALTER TABLE `rozgrywka`
  ADD PRIMARY KEY (`id_rozgrywka`),
  ADD KEY `wygrany_klub_fk` (`id_klub1`),
  ADD KEY `przegrany_klub_fk` (`id_klub2`);

ALTER TABLE `wynik`
  ADD PRIMARY KEY (`id_wynik`),
  ADD KEY `wynik_klub_liga_fk` (`id_liga`),
  ADD KEY `wynik_klubu_fk` (`id_klub`);

ALTER TABLE `zawodnik`
  ADD PRIMARY KEY (`id_zawodnik`),
  ADD KEY `klub_zawodnika_fk` (`id_klub`);

ALTER TABLE `liga`
  ADD CONSTRAINT `liga_klub_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);

ALTER TABLE `rozgrywka`
  ADD CONSTRAINT `przegrany_klub_fk` FOREIGN KEY (`id_klub2`) REFERENCES `klub` (`id_klub`),
  ADD CONSTRAINT `wygrany_klub_fk` FOREIGN KEY (`id_klub1`) REFERENCES `klub` (`id_klub`);

ALTER TABLE `wynik`
  ADD CONSTRAINT `wynik_klub_liga_fk` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`),
  ADD CONSTRAINT `wynik_klubu_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);

ALTER TABLE `zawodnik`
  ADD CONSTRAINT `klub_zawodnika_fk` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`);
COMMIT;

