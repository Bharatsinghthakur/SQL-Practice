/*
Data definition Language (DDL)
Editing defination by adding or removing columns 
- CREATE 
- ALTER - add , drop 
- DROP 
*/

-- ADD new column email to the persons table 

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

SELECT * FROM persons

-- Remove the column phone from the phone table 
ALTER TABLE persons 
DROP COLUMN phone 


-- Risky command 
DROP TABLE persons

