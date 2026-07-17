/*
what is date format ?

2026-08-17 22:03:07
YYYY-MM-dd HH:mm:ss
** format specifier **

what is formatting ?
changing the format of value from one to another changing how 
the data looks

what is casting ?
changing the data type from one to another 
Using CAST() & FORMAT()

- FORMAT
- CONVERT
- CAST
*/

/** FORMAT 
- Formats a date & time value 
syntax(value , format [,culture])

- FORMAT(OrderDate,'dd/MM/YYYY')
- FORMAT(OrderDate,'dd/MM/YYYY,'ja-JP')
- FORMAT(OrderDate,'D','fr-FR')

**/

USE SalesDB;

SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'MM-dd-yyyy') USA_format,
	FORMAT(CreationTime,'dd-MM-yyyy') EURO_format,
	FORMAT(CreationTime,'dd') dd,
	FORMAT(CreationTime,'ddd') ddd,
	FORMAT(CreationTime,'dddd') dddd,
	FORMAT(CreationTime,'MM') MM,
	FORMAT(CreationTime,'MMM') MMM,
	FORMAT(CreationTime,'MMMM') MMMM 
FROM Sales.Orders


-- show creationtime using the following format:
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT 
	OrderID,
	CreationTime,
	'Day ' + FORMAT(CreationTime,'ddd MMM') + ' Q' + DATENAME(quarter , CreationTime)
	 + ' ' + FORMAT(CreationTime,'yyyy hh:mm:ss tt') AS customFormat
FROM Sales.Orders


-- aggregation 
SELECT 
	FORMAT(OrderDate,'MMM yy') OrderDate,
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate,'MMM yy')