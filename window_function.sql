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
COUNT(1) is equal to COUNT(*)
with COUNT(*) -- it will count even the nulls everything

COUNT(column) --  it will count only the values in the window
-- count the total number of rows even the dublicates 
*/

-- find the total number of orders 
-- additonally provide details such orderID,order Date

SELECT 
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER() TotalOrders ,
COUNT(*) OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Sales.Orders


-- find the total number of customers
-- additionally provide All customers Details

SELECT 
    *,
    COUNT(*) OVER() TotalCustomersStar,
    COUNT(*) OVER() TotalCustomers,
    COUNT(Score) OVER() TotalSCores,
    COUNT(Country) OVER() TotalCountry
FROM Sales.Customers

-- Check whether the table 'orders' contains any dublicates rows

SELECT 
    * 
FROM (
    SELECT
        OrderID,
        COUNT(*) OVER(PARTITION BY OrderID) CheckPK
    FROM Sales.OrdersArchive
)t WHERE CheckPk > 1

------------------------------------------------------------------------------------
-- part of all analysis -- shows the contribution of each data point to overall dataset
-- find the percentage contribution of each product's sales to total sales 

SELECT 
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER() TotalSales,
  ROUND(  CAST (Sales AS Float) / SUM(Sales) OVER() * 100 , 2) PercentageOfTotal
FROM Sales.Orders

-- Find the average sales for each product 
-- NUll should be zero 

SELECT
    OrderID,
    OrderDate,
    Sales,
    ProductID,
    AVG(Sales) OVER() AvgSales,
    AVG(Sales) OVER(PARTITION BY ProductID) AvgSalesByProducts
FROM Sales.Orders

-- find the average scores of customers
-- additionally Provide details such as CustomerID and Last Name

SELECT 
    CustomerID,
    LastName,
    Score,
    COALESCE(Score,0) CustomerScore,
    AVG(Score) OVER() AvgScore,
    AVG(COALESCE(Score,0)) OVER() AvgScoreWithoutNull
FROM Sales.Customers

-- Find all orders where sales are higher than the average sale across all orders
SELECT 
* 
FROM(
SELECT 
    OrderID,
    ProductID,
    Sales,
    AVG(Sales) OVER() AvgSales
FROM Sales.Orders
)t WHERE Sales > AvgSales

-- MIN & MAX
-- find the minimum of the value in a window.
-- find the maximum of the value in a window.

-- find the highest and lowerst sales across all orders
-- find the highest and lwoers sales for each product
-- additionally provide details like orderID and order date.


SELECT 
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER() HighestSales,
    MIN(Sales) OVER() LowestSales,
    MAX(Sales) OVER(PARTITION BY ProductID) HigheshSalesByProduct,
    MIN(Sales) OVER(PARTITION BY ProductID) LowestSalesByProduct
FROM Sales.Orders



-- show the employee who has the highest salaries 

SELECT 
    * 
FROM(
SELECT
    *,
    MAX(COALESCE(Salary,0)) OVER(PARTITION BY Department) HighestSalary
    FROM Sales.Employees
)t WHERE Salary = HighestSalary

-- Find the deviation of each sales from the minimum and maximum sales amounts.

SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER() highestSales,
    MIN(Sales) OVER() LowestSales,
    Sales - MIN(Sales) OVER() DeviationFromMin,
    MAX(Sales) OVER() - Sales DeviationFromMax
FROM Sales.Orders

-- calculate moving average of sales for each product over time
-- including only the next order

SELECT 
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAVG,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAVG
FROM Sales.Orders