/*
Column order in order by is crucial as sorting is sequential 

*/

-- GROUP BY 
/* 
- Aggregate your data 
- combines rows with the same values 
- It aggregates a column by another column

category + Aggreagtion

SELECT 
	country,-- category
	SUM(score) -- aggregation
FROM table   1
GROUP BY country 2

*/
use MyDatabase;
-- RULE - ALl columns in the select must be either aggreagted or included in GROUP BY
-- Find the total score for each country
SELECT 
	first_name,
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country , first_name

-- find the total score and total numbers of customers for each country 

SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) AS cust_num
FROM customers
GROUP BY country 



/*
HAVING - filter aggregated data 
can be used only with GROUP BY 
SELECT  - 4
	country,
	SUM(score)
FROM Table - 1
GROUP BY Country - 2
HAVING SUM(SCORE) > 800 - 3
*/

-- Find the average score for each country considering only customers with a score not equal to 0
-- and return only those countries with an average score greater than 430

SELECT	
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0  -- used before the aggreagtion
GROUP BY country
HAVING AVG(score) > 430 -- having must used on aggregated columns - after aggregation



/*
DISTINCT -  remove dublicates(repeated values)
It make sure each value appears only once
-- expensive operation 
*/

SELECT DISTINCT Country
FROM customers



/*
TOP - limit your data
Restrict the number of rows returned 

-- In sql every row has row number that is not releated to your data its not actual data 
it is technical from the database . it not like ids columns in rows

SELECT TOP 3 
		* 
FROM customers
*/

SELECT TOP 3 * 
FROM customers

-- RETERIVE the TOP 3 customers with the HIGHEST SCORE 

SELECT TOP 3  *
FROM customers 
ORDER BY SCORE DESC

-- RETERIVE the Lowest 2 customers based on the score 

SELECT TOP 2 * 
FROM customers 
ORDER BY score ASC

-- GET THE TWO MOST RECENT ORDERS

SELECT TOP 2 * 
FROM orders
ORDER BY order_date DESC