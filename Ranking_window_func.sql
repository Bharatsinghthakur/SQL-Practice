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

-- RANK()
-- assign a rank to each row
-- It handles ties 
-- It leaves gaps in ranking(shared ranking,leaves gaps skipping)
SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank
FROM Sales.Orders

-- DENSE_RANK()
-- assign a rank to each row
-- it handles ties
-- it doesn't leaves gaps in ranking (shared rank,leaves no gaps)

SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank,
	DENSE_RANK() OVER(ORDER BY Sales DESC) SalesRank_DenseRank

FROM Sales.Orders

-- 

