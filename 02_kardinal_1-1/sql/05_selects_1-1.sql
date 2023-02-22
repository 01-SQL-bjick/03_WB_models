-- SELECTS 1:1

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

-- Kreuzprodukt
SELECT * FROM mydb.cats JOIN mydb.servants;

-- Kreuzprodukt (gefiltert)
SELECT * FROM mydb.cats JOIN mydb.servants
WHERE cat_name = "Grizabella";

-- Inner Join 1 / Gesamte Tabelle
SELECT * FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id;

-- Inner Join 2 / (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient Peter?
SELECT 
	cat_name AS Herrschaft,
	servant_name AS Diener
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
#WHERE cat_name = "Grizabella"
WHERE servant_name = "Peter";

-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y"  / Dienstverhältnis
SELECT
	CONCAT(servant_name, " ist Diener von ", cat_name, ".") "Dienstverhältnis"
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
#WHERE cat_name = "Grizabella"
#WHERE servant_name = "Patrick";