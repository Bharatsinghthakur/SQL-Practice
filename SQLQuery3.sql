USE MyDatabase;

-- RETRIEVE EACH CUSTOMER'S name,country, and score
SELECT 
	first_name,
	country,
	score
FROM customers

-- Retrieve customers with a score not equal to zero
SELECT * 
FROM customers
WHERE score != 0 

-- Retrieve customers from germany

SELECT * 
FROM customers
WHERE country='Germany'