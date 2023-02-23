-- 03. SELECTS / Servants, Products, Purchases

-- Einzeltabellen
SELECT * FROM mydb.products;
SELECT * FROM mydb.servants;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT
	*
From mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Patrick/Martin gekauft?
SELECT
	servant_name AS Diener,
    product_name AS "Von Patrick gekaufte Produkte: "
From mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Patrick"
;

SELECT
	CONCAT(servant_name, " kauft ", product_name, ".") AS Kaufhandlung
From mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Wieviele Produkte hat Patrick gekauft?
SELECT
	CONCAT(servant_name," kauft ",COUNT(product_name)," Produkte.") AS Kaufhandlung
From mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Martin"
;