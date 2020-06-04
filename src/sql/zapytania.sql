#1
SELECT * FROM zawodnik
WHERE reprezentacja="Anglia" AND id_klub IS NOT NULL;

#2
SELECT klub.nazwa_klubu, zawodnik.imie_zawodnika, zawodnik.nazwisko_zawodnika 
FROM klub, zawodnik 
WHERE zawodnik.id_klub=klub.id_klub 
AND zawodnik.pozycja="napastnik"
AND zawodnik.id_klub IS NOT NULL
ORDER BY klub.nazwa_klubu;

#3
SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu, liga.panstwo FROM liga, klub 
WHERE liga.id_klub_wygrany=klub.id_klub;

#4
SELECT COUNT(id_klub)as liczbaKlubow, panstwo FROM klub GROUP BY panstwo;

#5
SELECT liga.szczebel_rozgrywkowy, klub.nazwa_klubu,  wynik.punkty, wynik.rozegrane, wynik.wygrane, wynik.remisy, wynik.przegrane 
FROM wynik 
INNER JOIN liga ON wynik.id_liga=liga.id_liga INNER JOIN klub ON wynik.id_klub=klub.id_klub 
ORDER BY wynik.punkty DESC );

#6
SELECT rozgrywka.data_rozgrywki, rozgrywka.miejscowosc, k1.nazwa_klubu, rozgrywka.wynik_klub1,  rozgrywka.wynik_klub2, k2.nazwa_klubu, liga.szczebel_rozgrywkowy
FROM rozgrywka
INNER JOIN klub k1 on rozgrywka.id_klub1=k1.id_klub
INNER JOIN klub k2 on rozgrywka.id_klub2=k2.id_klub
INNER JOIN liga on rozgrywka.id_liga=liga.id_liga
WHERE rozgrywka.miejscowosc IN ('Madryt', 'Lipsk', 'Berlin');

#7
SELECT AVG(wiek_zawodnika) FROM zawodnik;

#8
SELECT AVG(waga) FROM zawodnik;

#9
SELECT AVG(liczba_druzyn) FROM liga;

#10
INSERT INTO zawodnik(id_zawodnik, imie_zawodnika, nazwisko_zawodnika, pozycja, reprezentacja, wiek_zawodnika, id_klub, waga) 
VALUES (97, “Gerard”,”Pique”,”obrońca”,”Hiszpania”,33, 33, 85);

#11
INSERT INTO klub(id_klub, nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo) 
VALUES (59, “FK Loko Vltavin”, “Praga”, “Martin Frýdek”, 1898, “Czechy”);

#12
UPDATE zawodnik SET id_klub=10 WHERE id_zawodnik=15;

#13
DELETE FROM klub WHERE klub_id =1;

#14
UPDATE liga SET id_klub_wygrany=3 WHERE id_liga=5;

#15
INSERT INTO rozgrywka(id_rozgrywka, data_rozgrywki, miejscowosc, id_klub1, id_klub2, wynik_klub1, wynik_klub2, id_liga) 
VALUES (%s, %s, %s, %s, %s, %s, %s, %s)";


























