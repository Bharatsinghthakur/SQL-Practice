/* ADVANCED SQL TECHNIQUES

DATA WAREHOUSE : A special database that collects and integrates data from 
different sources to enable analytics and support decesion-making

challenges :
- redundancy
- performace issues
- complexity
- hard to maintain
- DB stress
- security

Solutions:
- Subquery
- CTE(common table experession)
- Views
- Temp Tables
- CTAS(create table AS SELECT)

*/

/*
DATABASE ARCHITECTURE 
- The server is where the database lives.

- DATABASE ENGINE : It is brain of the database,executing multiple operations
such as storing , rerieving, and managing data within the database.

- STORAGE 

- DISK STORAGE :
long term memory where data is stored permanently. So its like your disk in pc it 
stores the data permanently 
- IT can hold large amount of data
- speed slow to read & write

- cache storage: fast short-term memeory, where data is stored temporiarily
speed - extreme fast to read & write 
capacity - can hold small amount of data

*/

/*
DISK STORAGE 
- USER 
- SYSTEM CATALOG
- TEMPERORY DATA


USER DATA STORAGE : It is the main content of the database where the actual data
that user care about is stored.

DB STORAGE:
System CATALOG: a database internal storage for its own information . A blueprint
that keeps track of everything about the database itself , not the user data

- It holds the meta data information about the database.
-- what happens behind is that database server not only stored the data inside 
but it is also going to store diffrent type of data inside datbase it is meta data


INFORMATION SCHEMA :
a system defined schema with built in views that provide info about the database
like table & columns.
*/

USE SalesDB;

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS

-----------------------------------

/*
What is subquery ?
Query inside another query 

scalar subquery : It is a subquery will return only one single value

row subquery: It is going to return multiple rows & single column.

table Subquery: It is going to return multiple rows & multiple columns.

*/
-- Scalar Subquery 
SELECT 
	AVG(Sales)
FROM Sales.Orders

-- Row Subquery
SELECT 
	CustomerID
FROM sales.Orders

-- Table subquery
SELECT 
	OrderId,
	OrderDate
FROM Sales.Orders

/*
(Subquery)
Location / Clauses

-- From : used as temporary table for the main query
syntax 
	SELECT column1 , column2 , ...
	FROM ( SELECT column)

*/

-- find the products that have a price higher than the average price of all products
SELECT 
* 
FROM 
--subquery
	(SELECT 
		ProductID,
		Price,
		AVG(Price) OVER() AvgPrice
FROM Sales.Products)t
WHERE Price > AvgPrice

-- Rank Customers based on their total amount of sales

SELECT 
*,
RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM
-- subquery
	(SELECT 
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t

		SELECT 
*,
RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM
-- subquery
	(SELECT 
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t

			SELECT 
*,
RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM
-- subquery
	(SELECT 
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t

----------------------------------------------------


-- SUBQUERY LOCATION | Clauses

-- SELECT | WHERE

/*

SELECT subquery
used to aggreagte data side by side with the main query's data,
allowing for direct comparsion

syntax :

mainquery
SELECT 
	Column1,
	--subquery
	(SELECT column FROM table WHERE condition) AS alias
FROM table1

*/

-- Show the ProductIDs, Product names , prices and the total number of orders
-- Main Query
SELECT 
	ProductId,
	Product,
	Price,
	--subquery
	(SELECT COUNT(*) FROM Sales.Orders) AS TotalOrders
FROM Sales.Products


/*
JOIN Subquery

Used to prepare the data(filtering or aggregation) before joining it with
other tables.

*/

-- show all customer details and find the total orders for each customers.
SELECT 
	* 
FROM Sales.Customers C 
LEFT JOIN (
	SELECT 
	customerID,
	COUNT(*) TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID) o 
ON C.CustomerID = o.CustomerID