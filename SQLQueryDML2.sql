 /*
 SECOND METHOD OF INSERTING TABLE USING source table to target table
 */
use MyDatabase;

CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY(id)
)

INSERT INTO persons(id,person_name,birth_date,phone)
SELECT 
		id,
		first_name,
		NULL,
		'Unknown'
From customers

SELECT * FROM persons


/*
UPDATE : we use UPDATE in order to change the content of the already existing rows 
	
	UPDATE table_name
	SET columns1 = value1,
		columns2 = value2
	WHERE <condition>
NOTE: ALWAYS USE WHERE TO AVOID UPDATING ALL ROWS UNINTENTIONALLY 
*/

-- CHANGE THE SCORE OF customer with ID 6 to 0

SELECT *
FROM customers

UPDATE customers
SET score = 0
WHERE id = 6

SELECT * 
FROM customers
WHERE id = 6

-- Change the score of customer 5 to 0 and update the country to UK 

SELECT * 
FROM customers
WHERE id = 5

UPDATE customers
SET score=0,
	country='UK'
WHERE id = 5

-- udpdate all the customers with NULL score by setting their score to 0

UPDATE customers
SET score=0
WHERE score is NULL


SELECT * 
FROM customers
WHERE country is NULL

/*
DELETE 
to remove rows from our table SQL start removing rows from exisiting table 

DELETE FROM table_name
WHERE <condition>

-- ALWAYS use WHERE To avoid DELETING all rows unintentionally 
*/

-- DELETE all customers with an ID greater than 9

DELETE FROM customers 
WHERE id > 9

SELECT * 
FROM customers 
WHERE id > 9


/*
DELETE - table 
DELETE FROM PERSONS -- will delete all the rows  
TRUNCATE - clears the whole table at once without checking or logging 
faster than delete command 

TRUNCATE TABLE persons
*/