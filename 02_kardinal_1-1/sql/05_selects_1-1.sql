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
WHERE servant_name = "Patrick";

-- Inner Join / Dienstzeit
SELECT
	servant_name AS Diener,
    yrs_served AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id;

-- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)
SELECT
	servant_name AS Diener,
    yrs_served AS Dienstzeit,
    CONCAT(servant_name, " der Diener von ", cat_name, " - ist der Diener mit der längsten Dienstzeit.") AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
ORDER BY yrs_served DESC
LIMIT 1;

-- 2. Subquery
SELECT MAX(yrs_served) FROM mydb.servants;

-- Test
SELECT
	servant_name AS Diener,
    yrs_served AS Dienstzeit,
    CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der längsten Dienstzeit.") AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE yrs_served = (SELECT MAX(yrs_served) FROM mydb.servants);

-- 3. Variante VIEW / QUERY / MAX() in VIEW gekapselt
DROP VIEW IF EXISTS mydb.max_time;
CREATE VIEW mydb.max_time AS
SELECT 
	MAX(yrs_served) 
FROM mydb.servants
;

SELECT * FROM mydb.max_time;

SELECT
    CONCAT(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der längsten Dienstzeit, welche ", yrs_served, " Jahre beträgt.") AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE yrs_served = (SELECT * FROM mydb.max_time);
