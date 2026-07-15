/*
SQL FUNCTIONS __ 


ROW LEVEL FUNCTION - 
Sometimes we have to do data cleansing , data transformation and data manipulation 
in our data . In order to solve some SQL tasks 

- String functions 
- Number functions 
- Date & time function 
- Null function
- case Statement 

FUNCTION : 
- A build in SQL code accepts input value 
- proccess it 
- returns an output value 


SINGLE ROW FUNCTIONS : INPUT for function would be single value and out will be one single 
value as well 
Eg: 'BHARAT' - LOWER() - 'bharat'

STRING FUNCTIONS , NUMERIC FUNCTION , DATE & TIME FUNCTION, NULL FUNCTION  

MULTI ROW FUNCTIONS : INPUT is multiple rows and output is single value

AGGREGATE FUNCTION , WINDOW FUNCTION 
NESTED FUNCTION : FUNCTION INSIDE ANOTHER FUNCTION . WE CAN USE MULTIPLE FUNCTION 
TOGETHER TO MANIPULATE ONE VALUE.

*/

/*
Data engineers are going to prepare the data using single row functions use them 
for clean up , transform , and manipulate the data . In order to prepare it for data analaysis 
And data analyst will be using the Aggregate functions 

SINGLE ROW FUNCTIONS : 
A. MANIPULATION
- CONCAT
- UPPER
- LOWER
- TRIM
- REPLACE 

B. CALCULATIONS
- LEN

C. STRING EXTRACTION 
- LEFT 
- RIGHT 
- SUBSTRING

*/

-- A. MANIPULATION 
-- CONCAT : COMBINE MULTIPLE STRINGS VALUES INTO ONE VALUE

-- CONCATENATE FIRST NAME & COUNTRY INTO ONE COLUMNS

USE MyDatabase;

SELECT 
	first_name,
	country,
	CONCAT(first_name,' ',country) AS name_country
FROM customers


-- UPPER & LOWER 
-- coverts all characters to uppercase 
-- converts all characters to lower case

-- covert the fistname to lower 

SELECT 
	first_name,
	LOWER(first_name) as low_name,
	UPPER(first_name) as upp_name
FROM customers

-- TRIM 
-- removes leading & trailing spaces in our string values

-- find customers who firstname contains leading or trailing spaces
 SELECT
	  first_name,
	  LEN(first_name) AS len_name,
	  LEN(TRIM(first_name)) as len_trim_name,
	  LEN(first_name) - LEN(TRIM(first_name)) flag

FROM customers
WHERE first_name != TRIM(first_name)