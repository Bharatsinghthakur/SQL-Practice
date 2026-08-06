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


-- Top N Analysis 
-- Find the top highest sales for each product 
SELECT * 
FROM (
SELECT 
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC ) RankByProduct
 FROM Sales.Orders
 )t WHERE RankByProduct = 1

 -- Bottom N analysis
 -- find the lowest 2 customers based on their total sales
SELECT * 
FROM(
SELECT
    CustomerID,
    SUM(Sales) TotalSales,
    ROW_NUMBER() OVER(ORDER BY SUM(Sales)) RankCustomers
FROM Sales.Orders
GROUP BY 
CustomerID)t WHERE RankCustomers <= 2

-- Generate Unique IDs -- paginating
-- Assign unique IDs to rows of the 'Order Archieve' table 


SELECT 
    ROW_NUMBER() OVER(ORDER BY OrderID,OrderDate) UniqueID,
    *
FROM Sales.OrdersArchive

-- Indentify Dublicates

-- Indentify dublicates rows in the table 'OrderArchieve'
-- and return a clean result without any dublicates

SELECT * FROM (
SELECT 
ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
* 
FROM Sales.OrdersArchive
)t WHERE rn=1



/*
NTILE():
        Divides the rows into a specfied number of approximately equal groups(buckets)

FOR EVEN --        bucket size = NUMBER OF ROWS / NUMBER OF BUCKETS
 FOR ODD -- LARGER GROUP COMES FIRST
*/

SELECT 
    OrderID,
    Sales,
    NTILE(4) OVER( ORDER BY Sales DESC) FourBucket,
    NTILE(3) OVER( ORDER BY Sales DESC) ThreeBucket,
    NTILE(2) OVER( ORDER BY Sales DESC) twoBucket,
    NTILE(1) OVER( ORDER BY Sales DESC) OneBucket
FROM Sales.Orders

-- Segement all orders into 3 categories: high, medium and low sales 
SELECT 
*,
CASE WHEN Buckets = 1 THEN 'High'
     WHEN Buckets = 2 THEN 'Medium'
     WHEN Buckets = 3 THEN 'Low'
END SaleSegmentations
FROM (
SELECT 
    OrderID,
    Sales,
    NTILE(3) OVER(ORDER BY Sales DESC) Buckets
FROM Sales.Orders
)t


-- In order to export the data , divide the orders into 2 groups.

SELECT 
    NTILE(2) OVER(ORDER BY OrderID) Buckets,
    *
FROM Sales.Orders

/*
Percentage Based Ranking 

SQL gonna calculate a relative position as percentage and assign it for each row
so the output would be continous normalize scale from 0 to 1 . Good for distribution analysis

-- CUME_DIST():
    cumulative distribution calculate the distribution of data points 
    within a window

    CUME_DIST = position No./ number of rows

-- PERCENTAGE_RANK : Calculate the relative position of last occurance 
of the same value .

    PERCENT_RANK = Position No. - 1 / Number of rows - 1
*/

-- Find the products that falls within the highest 40% of the prices.
SELECT *,
CONCAT(DistRank * 100 , '%') DistRankPerc
FROM(
SELECT  
    Product,
    Price,
    CUME_DIST() OVER (ORDER BY Price DESC) DistRank
FROM Sales.Products
)t
WHERE DistRank <= 0.4

----------------------------------------

/*
Window value Function 

we use value function to get access a value from other Row

- LAG()
- LEAD()
- FIRST_VALUE()
- LAST_VALUE()

*/

/*
LEAD & LAG

-- LEAD() : 
        access a value from the next row within a window 
-- LAG() :
        access a value from a previous row within a window

syntax :
    LEAD(expr,offset,defaultvalue) over(PARTITION BY ProductID ORDER BY OrderDate)

    ** ORDER BY Is required
*/

-- Analyze the month-over-month (MOM) performance by finding the percentage 
-- change in sales between the current and previous month
SELECT 
*,
CurrentMonthSales - PreviousMonthSales AS MOM_Change
FROM
(
SELECT 
    MONTH(OrderDate) OrderMonth,
    SUM(Sales) CurrentMonthSales,
    LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
    MONTH(OrderDate)
)t 