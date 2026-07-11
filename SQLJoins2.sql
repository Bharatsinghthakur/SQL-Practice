/*
Right join - returns all the rows from right and only matching rows forms the 
left table 
-- order of table is important

SELECT * 
FROM A 
RIGHT JOIN B 
ON A.key = B.key
*/

/*
GET all the customers along with their orders including orders without matching
customers
*/

use MyDatabase

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
on c.id = o.customer_id

-- alterantive way of writing with left join
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o 
LEFT JOIN customers AS c
on o.customer_id = c.id


/*
FULL JOIN - Returns all the rows from both tables 
order of the tables doesn't matter

SELECT * 
FROM A 
FULL JOIN B 
ON A.key = B.key
*/
-- Get all customers and all orders even if there is no match 

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id


-- ADVANCED JOIN 
/*
LEFT ANTI JOIN - Returns rows from the left that has no match in right 
- order of the table is important
SELECT * 
FROM A 
LEFT JOIN B 
ON A.key = B.key
WHERE B.key IS NULL 
*/

-- Get all customers who haven't place an order

SELECT * 
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.customer_id IS NULL 

/*
RIGHT ANTI JOIN - returns rows from right that has no match left 
order of tables is important

SELECT * 
FROM A 
RIGHT JOIN B 
ON A.key = B.key
WHERE A.key is NULL
*/
-- get all the orders without matching customers 
SELECT * 
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id = o.customer_id 
WHERE c.id IS NULL

-- alternative 
SELECT * 
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL

/*
FULL ANTI JOIN - returns only rows that doesn't match in either tables 

- order of the table doesn't matter 

SELECT * 
FROM A 
FULL JOIN B 
ON A.key = B.key 
WHERE	
	B.key IS NULL
OR	
	A.key IS NULL
*/

-- find customers without orders and orders without customers 

SELECT * 
FROM orders AS o 
FULL JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id is NULL

/*
Get all customers along with their orders,but only for customers who have placed an order
without using inner join
*/
SELECT * 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.id
WHERE o.customer_id IS NOT NULL

/*
CROSS JOIN - combines every row from left with every row from right 
All possible combinations - cartersian join 
- the order of the table doesn't matter

SELECT * 
FROM A
CROSS JOIN B
*/

-- generate all possible combinations of customers and orders
SELECT * 
FROM customers 
CROSS JOIN orders 