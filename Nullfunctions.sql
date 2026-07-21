/*
Null Functions
NULL means nothing , Unknown !
Null is not equal to anything.

- Null is not zero
- NULL is not empty space
- NULL is not equal to empty string

** SOMETIMES we have to replace null with new values
- IS NULL
- COALESCE

** sometimes want to replace value with NULL
- NULL IF 

- check for NULL 
we have another function called IS NULL that gives TRUE if the value is NULL
IS NOT NULL will give FALSE
*/

/*
ISNULL():
	replaces 'NULL' with a specified value
syntax
ISNULL(Value,Replacement_value)
EG:
	ISNULL(shipping_address,'Unknown') - default or static value
	ISNULL(shipping_address,billing_address)

*/

/* 
COALESCE():
	Returns the first non - NULL value from the list
syntax
	COALESCE(value1,value2,value3,value4...)

EG:
	COALESCE(shipping_address,'unknown')
	COALESCE(shipping_address,billing_address)
	COALESCE(shipping_address,billing_address,'Unknown'
	)
*/

-- find the average scores of the customers 
use SalesDB;
SELECT 
	CustomerID,
	Score,
	AVG(Score) OVER() AvgScores,
	AVG(COALESCE(Score,0)) OVER() AvgScores2 
FROM Sales.Customers


-- display the fullname of customers in single Field
-- by merging their First and last name 
-- and add 10 bonus to each customer's score.

SELECT 
	CustomerID,
	FirstName,
	LastName,
	FirstName + ' ' + COALESCE(LastName,'') AS FullName,
	Score,
	COALESCE(Score,0) + 10 AS BonusScore
From Sales.Customers


-- Sort the customers from lowest to highest scores,
-- with nulls appearing last

SELECT
	CustomerID,
	Score,
	COALESCE(Score,99999) -- Lazy method
FROM Sales.Customers
ORDER BY COALESCE(Score,99999)

-- correct way 
SELECT 
	CustomerID,
	Score,
	CASE WHEN Score IS NULL THEN 1 ELSE 0 END FLAG
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score

-- preventing the error of dividing by zero
-- Find the sales price for each order by dividing the sales by the quantity.

SELECT 
	OrderID,
	Sales,
	Quantity,
	Sales / NULLIF(Quantity,0) AS Price
FROM Sales.Orders

-- Identify the customers who have no scores 

SELECT * 
FROM Sales.Customers
WHERE Score IS NULL

-- show all the customers who has scores 
SELECT 
	* 
FROM Sales.Customers
WHERE SCORE IS NOT NULL


------------------------------------
-- List all details for customers who have not places any orders
USE SalesDB;

SELECT 
c.*,
o.OrderId
FROM Sales.Customers c
LEFT JOIN Sales.Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL


WITH Orders AS(
SELECT 1 Id,'A' Category UNION
SELECT 2, NULL UNION 
SELECT 3 , '' UNION 
SELECT 4 , ' ' 
)
SELECT 
*,
TRIM(Category) Policy1,
NULLIF(TRIM(Category),'') Policy2,
COALESCE(NULLIF(TRIM(Category),''),'unknown') Policy3
FROM Orders