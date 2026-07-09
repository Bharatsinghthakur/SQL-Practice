/*
WHERE OPERATOR 
- comparison operator 
- =, <>,!=,>=,<=,<
- logical operator
- AND , OR , NOT
- range operator
- BETWEEN 
- membership operator
- IN NOT IN
- search operator
- LIKE 
*/

-- Reterieve all the customers from germany 

SELECT * 
FROM customers 
WHERE country='Germany'

-- Reterieve all the customers who are not from germany
SELECT * 
FROM customers 
-- WHERE country !='Germany'
WHERE country <> 'Germany'


-- Reterieve all customers with score greater than 500
SELECT * 
FROM customers
WHERE score >500

-- reterieve all the customers with a score of 500 or more.
SELECT *
FROM customers
WHERE score >= 500


-- Reterieve all customers with score Less than 500
SELECT * 
FROM customers
WHERE score < 500

-- reterieve all the customers with a score of 500 or less.
SELECT * 
FROM customers 
WHERE score <= 500

/*
LOGICAL OPERATOR - AND OR NOT 
AND - all conditions must be TRUE 
OR - atleast one condition must be TRUE 
NOT - (excludes) reverse matching values
*/

SELECT * 
FROM customers 
WHERE country ='USA' AND score > 500


-- Reterieve all the customers who are either from USA or score greater than 500

-- OR operator
SELECT * 
FROM customers 
WHERE country ='USA' OR score > 500

-- NOT operator
-- Reterieve all the customersor with score not less than 500
SELECT * 
FROM customers 
WHERE NOT score < 500
-- 