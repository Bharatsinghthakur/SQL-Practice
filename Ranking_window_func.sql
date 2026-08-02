/*
Ranking window function 

Integer based ranking  -- TOP BOTTOM analysis
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE(N)

 Percentage Based Ranking -- Distribution Analysis
 - CUME_DIST()
 - PERCENTAGE_RANK()

 syntax

 RANK() OVER(PARTITION BY ProductID ORDER BY Sales)

 -- expression must be empty - ORDER BY IS MUST , Frame clause not allowed

*/

-- ROW_NUMBER()
-- assign a unique number to each row
-- it doesn't handle ties (unique Ranking) without gaps/skipping

-- Rank the orders based on their sales from highest to lowest

USE SalesDB;

SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row
FROM Sales.Orders