-- 04 SELECTS

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.kittens;

-- Inner Join 1 / Gesamte Kombi-Tabelle
SELECT
	*
From mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id = mydb.kittens.cats_id
;

-- Inner Join 2 / Verwandschaft
-- "X ist die Mutter von Y"
SELECT
	#cat_name AS Mutter,
    #kitten_name AS Kind,
	CONCAT(cat_name, " ist die Mutter von ", kitten_name, ".") Verwandschaft
FROM mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id = mydb.kittens.cats_id
;

-- Inner Join 3 / Wieviel Kinder haben die Katzen?
SELECT
	cat_name AS Katze, -- nicht aggregiert / organisch
    count(cat_name) Kinderzahl
From mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id = mydb.kittens.cats_id
GROUP BY Katze
;

