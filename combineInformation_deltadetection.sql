-- Orders data are stored in seprate tables (Orders & Orders Archive )
-- Combine all orders data into one report without duplicates 

USE SalesDB;

SELECT 
'Orders' AS SourceTable
     ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
'OrdersArchieve' AS SourceTable
      ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID;


/* 
SET operators 
-combine results of multiple queries into single result set 
TYPES 
UNION 
UNION ALL 
EXCEPT 
INTERSECT

RULES 
- SAME NO. OF COLUMNS , DATA TYPES , ORDER OF COLUMNS 
- 1ST QUERY CONTROLS COLUMNS NAME

USE CASES 
- COMBINE INFORMATION (UNION + UNION ALL )
- DELTA DETECTION (EXCEPT)
- DATA COMPRESSION CHECK (EXCEPT)
*/