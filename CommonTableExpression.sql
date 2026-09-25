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
/*
Multiple StandAlone CTE's

WITH CTE-NAME1 AS 
(
	SELECT ...
	FROM ...
	WHERE ...


)
, CTE_NAME2 AS
(
	SELECT ...
	FROM ...
	WHERE ...

)
---------
SELECT 
FROM CTE-NAME1
JOIN CTE-NAME2
WHERE

*/
/*
Multiple StandAlone CTE's

WITH CTE-NAME1 AS 
(
	SELECT ...
	FROM ...
	WHERE ...


)
, CTE_NAME2 AS
(
	SELECT ...
	FROM ...
	WHERE ...

)
---------
SELECT 
FROM CTE-NAME1
JOIN CTE-NAME2
WHERE

*/
/*
Multiple StandAlone CTE's

WITH CTE-NAME1 AS 
(
	SELECT ...
	FROM ...
	WHERE ...


)
, CTE_NAME2 AS
(
	SELECT ...
	FROM ...
	WHERE ...

)
---------
SELECT 
FROM CTE-NAME1
JOIN CTE-NAME2
WHERE

*/



-- find the total sales per customer 

WITH CTE_TOTAL_SALES AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID

)

-- find the last order date for each customer
,CTE_Last_Order AS 
(
SELECT 
CustomerID,
MAX(OrderDate) AS Last_Order
FROM Sales.Orders
GROUP BY CustomerID
)



-- Rank customers based on Total Sales Per customer (Nested CTE)
, CTE_CUSTOMER_RANK AS
(
SELECT 
CustomerID,
TotalSales,
Rank() OVER(ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)
--- Segment customer based on their total sales(NESTED CTE).
, CTE_Customer_Segments AS
(
SELECT 
CustomerID,
TotalSales,
CASE WHEN TotalSales > 100 THEN 'High'
	 WHEN TotalSales > 50 THEN 'Medium'
	 ELSE 'Low'
END CustomerSegments
FROM CTE_Total_Sales
)

-- MAIN query

SELECT 
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Last_Order,
ccr.CustomerRank,
ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID 
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID = c.CustomerID  
LEFT JOIN CTE_Customer_Rank ccr
On ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segments ccs
ON ccs.CustomerID = c.CustomerID 






