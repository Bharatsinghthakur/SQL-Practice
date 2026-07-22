/*
CASE STATEMENT
Evaluates a list conditions and returns a value when the first condition is met

syntax 

CASE 
	WHEN condition1 THEN result1  --condition to be evaluated result if condition is true
	WHEN condition2 THEN result2
	...
	ELSE result  -- when none of WHEN conditons are TRUE(OPTIONAL)
END

----
CASE
	WHEN SALES > 50 THEN 'HIGH'
END

*/

/*
CATEGORIZING DATA 
- main purpose is data transformation 
derive new information 
-- create new columns based on existing data
-- Generate a report showing the total sales for each category 

 ** high - If sales higher than 50 
 ** medium - If sales between 20 and 50 
 ** low - if the sales equal or lower than 20
 sort the result from lowest to highest
*/

SELECT 
	OrderID,
	Sales,
CASE
	WHEN Sales > 50 THEN 'High'
	WHEN Sales > 20 THEN 'Medium'
	ELSE 'Low'
END Category
FROM Sales.Orders


-- better way with subquery
SELECT
	Category,
	SUM(Sales) As TotalSales
FROM(
	SELECT 
	OrderID,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'HIGH'
		WHEN Sales > 20 THEN 'Medium'
		ELSE 'LOW'
	END Category 
FROM Sales.Orders) t
GROUP BY Category
ORDER BY TotalSales DESC

/*
Mapping values : transforming 
Transforming the value from one form to another 
-- from 0,1 need active & Inactive
*/
-- Reterieve Employee details with gender displayed Full text

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Gender,
	CASE
		WHEN Gender='F' THEN 'FEMALE'
		WHEN Gender='M' THEN 'MALE'
		ELSE 'NOT AVAILABLE'
	END 
FROM Sales.Employees 