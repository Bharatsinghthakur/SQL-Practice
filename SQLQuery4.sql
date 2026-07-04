/* 
Order by - SORT YOUR DATA 
ASC -- default
DESC 
*/

-- Retrieve all the customers and sort the results by highest score first

SELECT * 
FROM customers
ORDER BY score DESC

-- NESTED SORTED 

SELECT * 
FROM customers
ORDER BY 
	country ASC,
	score DESC

-- Retrieve all customers and sort the results by the country and then by the highest score
SELECT * 
FROM customers
ORDER BY 
	 country ASC ,
	 score DESC