/*
DML COMMAND 
in order to add new rows to table we use insert to already existing data 

taget table - insert value(manual entries) 

INSERT INTO table_name(column1,column2,column3,....)
VALUES (value1,value2,value3,...)
	, (value1,value2,value3,...) -- Multiple entries
		

-- if no columns are specified SQL expects values for all columns 

RULE - match the number of columns & Values.
Remember - Columns and values must be in the same order
matching data types , column count & constraint
*/

INSERT INTO customers (id,first_name,country,score)
VALUES 
	(6,'JACK','USA',NULL),
	(7,'NEO',NULL,100)

-- we can add columns with these 2 values only using this approch 
-- Columns not included in INSERT become NULL (unless a default or constraint exists)
INSERT INTO customers(id,first_name)
VALUES 
		(8,'Niko')

-- we are doing direct modification inside our data 
SELECT * FROM customers


	
