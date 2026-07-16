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