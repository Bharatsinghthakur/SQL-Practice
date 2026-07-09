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


/*
Retrieve all the customers whose score falls in range between 100 and 500
*/
 
SELECT * 
FROM customers
WHERE score BETWEEN 100 AND 500


-- shows the explicit boundries 
SELECT * 
FROM customers
WHERE score >=100 AND score <= 500

/*
Membership operator 
- IN  - checks if value exists in a list
- NOT IN - reverse of IN operator

*/

-- Reterieve all cusotmers from USA or germany 

SELECT * 
FROM customers 
WHERE country = 'Germany' OR country = 'USA'

SELECT * 
FROM customers 
WHERE country IN ('Germany','USA')

/*
SEARCH operator - search for a pattern in a text 

*/

-- find all the customers whose first name starts with 'M'
SELECT * 
FROM customers
WHERE first_name LIKE 'M%'

-- find all the customers whose first name ends with 'n'
SELECT * 
FROM customers 
WHERE first_name LIKE '%n'


-- find all the customers whose first name contains 'r'
SELECT * 
FROM customers 
WHERE first_name LIKE '%r%'

-- 
-- find all the customers whose first name contains 'r' at 3rd postion
SELECT * 
FROM customers 
WHERE first_name LIKE '__r%'

