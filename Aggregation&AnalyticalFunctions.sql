/*
Aggregate Functions & Analytics 

-- Aggregate functions
-- Window basics 
-- window Aggregate functions
-- window value functions
*/

/*
Aggregate functions : 
Aggregate function accept multiple input and the output will be single value 
-- COUNT():
    It will give the total no. of rows given input.
-- SUM():
    Summarize the total of the input columns and gives the result
-- AVG():
    It will give the average of the given column like sales
-- MAX():
    It find the highest sales in our data. searching for highest value between 
    multiple values.

-- MIN():
        It will find the lowest value in our data seaching for lowest value
*/


-- find the total number of orders 

USE MyDatabase;

SELECT 
    COUNT(*) AS total_no_Orders
FROM orders


-- find the total of sales in our data 

SELECT 
    SUM(Sales) AS Total_sales
FROM orders

-- find the highest sales of all orders 
SELECT 
    MAX(Sales) AS Highest_Sales
FROM orders

-- find the lowest sales of all orders 
SELECT 
    MIN(Sales) AS Lowest_Sales
FROM Orders 

--- 

/*
Window Functions : we also called them analytical function
Perform calculations (eg: aggregation) on a specific subset of data,
Without losing the level of details of rows.

-- Row level calculations 
we dont lose the level of details . IF in input data we have 4 orders in output also we 
will get 4 orders.

** THE GRANULARITY STAYS THE SAME 
 -- AGGREGATIONS + DETAILS
 -- WINDOW FUNCTIONS 
 ** AGGREGATION FUNCTIONS 
 - SUM(expr)
 - COUNT(expr)
 - AVG(expr)
 - MIN(expr)
 -MAX(expr)
 ** RANK FUNCTIONS
 ROW_NUMBER()
 RANK()
 DENSE_RANK()
 CUME_DIST()
 PERCENT_RANK()
 NTILE(n)

 ** VALUE(analytics) functions
 LEAD(expr,offset,default)
 LAG(expr,offset,default)
 FIRST_VALUE(expr)
 LAST_VALUR(expr)

*/

-- why group by is not enough 
-- Find the total sales across all orders
USE SalesDB;

SELECT 
    ProductID,
    SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

-- Find the total sales across all orders
-- THE number of the rows in the output is defined by the dimensions

-- with Additonally provide details such orderId, Orderdate 

-- if we try to solve this with group by it will give error 
-- As GROUP BY rule -- All columns in SELECT must be Included by GROUP BY
-- GROUP BY has limit like we cannot do aggreagtions and provide details at  same time

SELECT
    OrderId,
    OrderDate,
    ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders
WHERE ProductID IN (101,102)

-- RESULT granularity window functions results a result for each row

/*
Window function Syntax:

Window_function(expr) OVER( PARTITION BY Category ORDER BY OrderDate ROWS UNBOUNDED PRECEDING)

OVER CLAUSE - Tells sql that the function used is a window function. IT defines the 
window or subset of the data

*/

/* Window function PARTITION BY 

DIVIDES the result set into partitions(WINDOWS)

-- if we keep it empty like
SUM(Sales) OVER() -- calculation is done on entier data

SUM(Sales) OVER(PARITION BY Product) 
-- IT is going to divide the whole data into partitions of windows
-- calculations is done individually on each window
 
SUM() -- will work as simple aggreagtion function 

*/

-- Rank customers based on their Ranks
-- Based on there Rank 

SELECT 
    CustomerID,
    SUM(Sales) TotalSales,
    Rank() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID

-- Rank customers based on their Ranks
-- Based on there Rank 

SELECT 
    CustomerID,
    SUM(Sales) TotalSales,
    Rank() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID