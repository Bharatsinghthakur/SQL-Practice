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