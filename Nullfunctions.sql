/*
Null Functions
NULL means nothing , Unknown !
Null is not equal to anything.

- Null is not zero
- NULL is not empty space
- NULL is not equal to empty string

** SOMETIMES we have to replace null with new values
- IS NULL
- COALESCE

** sometimes want to replace value with NULL
- NULL IF 

- check for NULL 
we have another function called IS NULL that gives TRUE if the value is NULL
IS NOT NULL will give FALSE
*/

/*
ISNULL():
	replaces 'NULL' with a specified value
syntax
ISNULL(Value,Replacement_value)
EG:
	ISNULL(shipping_address,'Unknown') - default or static value
	ISNULL(shipping_address,billing_address)

*/

/* 
COALESCE():
	Returns the first non - NULL value from the list
syntax
	COALESCE(value1,value2,value3,value4...)

EG:
	COALESCE(shipping_address,'unknown')
	COALESCE(shipping_address,billing_address)
	COALESCE(shipping_address,billing_address,'Unknown'
	)
*/

-- find the average scores of the customers 

