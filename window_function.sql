/*
WINDOW FUNCTION RULES 

Rule1 : window functions can be used only in SELECT and ORDER BY clause .
window functions cannot be used to filter data -- using WHERE & GROUP BY clause

Rule2 : Nesting window functions is not allowed!

Rule3 : sql execute window functions after WHERE clause 

Rule4: window functions can be used together with GROUP BY in the same query,
ONLY if the same columns are used.

*/

-- find the total sales for each order status only for two products 101 and 102
USE SalesDB;

SELECT 
    OrderID,
    OrderDate,
    OrderStatus,
    ProductID,
    Sales,
    SUM(Sales) OVER (PARTITION BY OrderStatus) TotalSales
FROM Sales.Orders
WHERE ProductID IN (101,102)

-- Rank customers based on their total sales
SELECT 
    CustomerID,
    SUM(Sales) TotalSales,
    RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID

/*
Aggreagate function 

COUNT(expr) - Returns the number of rows in a window
SUM(expr)  - Return the sum of values in a window
AVG(expr) - Return the AVG of values in a window
MIN(expr) - Return the MIN of values in a window
MAX(expr) - Return the MAX of values in a window
*/

/* Aggreagte window function COUNT()
Return the number of rows within a window

*/
