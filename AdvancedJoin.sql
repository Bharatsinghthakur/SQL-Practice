/*
Multi join table 
--
using salesDB, retrieve a list of all orders, along with the related customers 
products and employee details 
- for each order, display:
- orderId
- customer's name
- product name 
- sales amount 
- product price 
- salesperson's name

----ER DAIGRAM 
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;
SELECT * FROM Sales.Products;
*/

USE SalesDB;

SELECT
	o.OrderID,
	o.Sales,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	p.Product AS ProductName,
	p.Price,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p 
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees as e
ON o.SalesPersonID = e.EmployeeID







