/*
Create a new table called persons 
with columns: id,person_name,birth_date and phone
*/
use MyDatabase;
CREATE TABLE persons(
	id INT NOT NULL ,
	person_name VARCHAR(50) NOT NULL ,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL
	CONSTRAINT pk_persons PRIMARY KEY(id) -- pk_persons is internal for DB , id column is primary key
)
SELECT * FROM persons