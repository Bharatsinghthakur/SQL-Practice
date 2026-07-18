/*
ROW LEVEL FUNCTION 
Number functions

*/

-- Round  - it will round of the value with the given decimal place 0-10 scale 


SELECT 
	3.516 Num,
	ROUND(3.516,2) AS round_2,
	ROUND(3.516,1) As round_1,
	ROUND(3.516,0) AS round_0


/* Abs
Returns the absolute (positive) value of a number, remove any negative sign

*/

SELECT 
	-10 negative,
	ABS(-10) as abs_value



/* 

*/
USE SalesDB;

-- The ways to GET The date from DB 

SELECT 
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime,
	'2025-08-20' HardCoded,
	GETDATE() Today
From Sales.orders

/*
DATE & TIME FUNCTIONS 
- PART EXTRACTION 
-- DAY
-- MONTH
-- YEAR
-- DATEPART
-- DATENAME
-- DATETRUNC
-- EOMONTH

- FORMAT & CASTING 
-- FORMAT
-- CONVERT
-- CAST

- CALCULATIONS
-- DATEADD
-- DATEDIFF

VALIDATION 
ISDATE
 
*/


-- DAY | MONTH | YEAR

SELECT 
	OrderID,
	CreationTime,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) MONTH,
	DAY(CreationTime) DAY
From Sales.orders


-- DATEPART() 
-- Returns a specific part of date as a number
-- many information is stored in data like quarter , week etc . but not visible

-- syntax
-- DATEPART(part,date)
-- DATEPART(month,OrderDate)
-- DATEPART(mm,'2025-08-20') -- abbreviation

SELECT 
	DATEPART(year,CreationTime) Year_dp,
	DATEPART(month,CreationTime) Month_dp,
	DATEPART(day,CreationTime) Day_dp,
	DATEPART(hour,CreationTime) hour_dp,
	DATEPART(quarter,CreationTime) Quater_dp,
	DATEPART(weekday,CreationTime) Week_dp
FROM Sales.Orders

-- DATENAME:
-- Returns the name of specific part of the date
-- return type is string
-- syntax DATENAME(part, date)


SELECT 
	DATENAME(month,CreationTime) AS Month_dn,
	DATENAME(weekday, CreationTime) AS Week_dn,
	DATENAME(day,CreationTime) AS day_dn,
	DATENAME(year,CreationTime) AS year_dn
FROM Sales.Orders

-- DATETRUNC 
-- truncates the date to the specific part
-- Allow us to change the level of details of information 
-- reset the other part of the datetime - for date - 01 for time - 00

SELECT 
	OrderID,
	CreationTime,
	DATETRUNC(minute,CreationTime) Minute_dt,
	DATETRUNC(day,CreationTime) Day_dt,
	DATETRUNC(year,CreationTime) Year_dt

FROM Sales.Orders

-- level of granuality is not defined in output as no order will be at same level

SELECT 
	CreationTime,
	COUNT(*)
FROM Sales.Orders
GROUP BY CreationTime

-- we can use DATETRUNC for this to overcome this problem
SELECT
	DATETRUNC(month,CreationTime) Creation,
	COUNT(*) order_count
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime)

--EOMONTH
-- Returns the last day of the month
-- syntax EOMONTH(date)

SELECT 
	EOMONTH('2025-08-11')

SELECT 
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS ENDOFMONTH,
	-- if we need start of month date we can use DATETRUNC(Month)
	DATETRUNC(month,CreationTime) as STARTOFMONTH
FROM Sales.Orders


-- How many orders were palced each year

SELECT
	YEAR(OrderDate) YEAR,
	COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY YEAR(ORDERDATE)

-- how many orders palced each month with full name of month

SELECT
	DATENAME(month,OrderDate) MONTH,
	COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY DATENAME(Month,OrderDate)

-- show all orders were placed in month of Feburary
SELECT 
	* 
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2


/*
CONVERT:
converts a date & time value to a different data type & formats the value 

syntax:
CONVERT(data_type,value[,style])

EG:
	CONVERT(INT,'124')
	CONVERT(VARCHAR,OrderDate,'34')
*/
USE SalesDB;
SELECT 
	CONVERT(INT,'123') AS [STRING TO INT CONVERT],
	CONVERT(DATE,'2026-07-18') AS [STRING TO DATE CONVERT],
	CreationTime,
	CONVERT(DATE,CreationTime) AS [DATETIME TO DATE CONVERT]
FROM Sales.Orders







