/* CTE 
Comman table expression --
Temporary, Named result set(virtual table) that can be used multiple times within your query 
to simplify and organise complex query.

*/

/*
CTE 
Improves readablity,modularity, resuablity

once we start executing the query the DB engine start to execute the query and 
Store the table details into cache

CTE TYPES 
_ NON RECURSIVE CTE
a - Standalone CTE 
b - Nested CTE
- RECURSIVE CTE
*/

/*

-- STAND ALONE CTE 
Defined and used independently Runs independently as its self contained 
and doesn't rely on Other CTEs or Queries.


CTE syntax 
WITH cte_name AS 
(
SELECT 
FROM 
WHERE 

)

SELECT 
FROM cte_name
WHERE 
*/
USE SalesDB;
-- find the total sales per customer 

WITH CTE_TOTAL_SALES AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
-- Main Query

SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName ,
	cts.totalSales
FROM Sales.Customers c
LEFT JOIN CTE_TOTAL_SALES cts
ON cts.CustomerID = c.CustomerID
