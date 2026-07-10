/*
we have two methods through which we can combine table 
1 - SET operators - it works on rows - should have same number of columns
2 - Joins  - it works on columns - Key column required 

set types - same number of column required 
1 - union 
2- union all
3 - except (minus)
4 - intersect

Join types - key column required 
1 - inner join 
2 - full join 
3 - left join 
4 - right join
5 - no join

advanced 
a - left anti join 
b - right anti join 
c - full anti join 
d - cross join 
 
*/

-- NO JOIN 
-- Retrieve all data from customers and orders in different results 
use MyDatabase;
SELECT * 
FROM customers;

SELECT * 
FROM orders;

/*

INNER JOIN - returns only matching rows from both tables 
-- Default join 
-- the order of tables doesnt matter in inner join 
*/

-- get all customers along with their orders, but only for customers who have placed an order

-- TO avoid ambiguity - add table name before the column to 
-- avoid confusion in join with same named columns 

SELECT 
     customers.id,
     customers.first_name,
     orders.order_id,
     orders.sales 
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id 