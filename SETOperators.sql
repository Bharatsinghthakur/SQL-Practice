/*
SET operators 
-- UNION 
-- UNION ALL 
-- EXCEPT 
-- INTERSECT
USES 
- combining similar information before analaysing data 
- filter out irrelavant data
*/




/*
Rules 1 | SQL Clauses 
SET operator can be used almost in all clauses  WHERE | JOIN | GROUP BY | Having 
- ORDER BY is allowed only once at the end 

RULE 2 | NUMBER OF COLUMNS 
The Number of columns in each query must be the same.

RULE 3 | DATA TYPES 
Data types of columns in each query must be compatible(match)

RULE 4 | ORDER OF COLUMNS 
the order of the columns in each query must be the same 

Rule 5 | COLUMNS ALIASES 
The columns name in the result set are determined by the columns name specified 
in the first query
1st query controls columns Names 

Rule 6 | correct columns
Even if all rules are met and SQL shows no errors, the result maybe incorrect 
- incorrect columns selection leads to inaccurate results

*/

/*
UNION 

syntax - 
SELECT 
	 A,
	 B
FROM customers 
JOIN CLAUSE 
WHERE CLAUSE 
GROUP BY CLAUSE 

UNION 

SELECT 
	A,
	B
FROM Employees
we can use these clauses as well 
JOIN CLAUSE 
WHERE CLAUSE 
GROUP BY CLAUSE 
-- please use ORDER BY at last 

--------------------------------------------------------------------
* Union returns all distinct  rows from both queries 
* Remove duplicates rows from the results 
* returns all the distinct rows from both the tables 
*/

-- combine the data from Employees and customers 

USE SalesDB;

SELECT
	 FirstName,
	 LastName
FROM Sales.Customers

UNION 

SELECT 
	 FirstName,
	 LastName
FROM Sales.Employees


/*
UNION ALL 
Returns all rows from both queries , including duplicates 
** SET operator that doesn't remove duplicates 
** Union ALL is genrally faster than UNION -- if we are confident that no dublicates
exists than we can use UNION ALL 

*/

--Combine the data from employees and customers into one table including dublicates

SELECT
	 FirstName,
	 LastName
FROM Sales.Employees

UNION ALL 

SELECT
	 FirstName,
	 LastName
FROM Sales.Customers 





