/* ADVANCED SQL TECHNIQUES

DATA WAREHOUSE : A special database that collects and integrates data from 
different sources to enable analytics and support decesion-making

challenges :
- redundancy
- performace issues
- complexity
- hard to maintain
- DB stress
- security

Solutions:
- Subquery
- CTE(common table experession)
- Views
- Temp Tables
- CTAS(create table AS SELECT)

*/

/*
DATABASE ARCHITECTURE 
- The server is where the database lives.

- DATABASE ENGINE : It is brain of the database,executing multiple operations
such as storing , rerieving, and managing data within the database.

- STORAGE 

- DISK STORAGE :
long term memory where data is stored permanently. So its like your disk in pc it 
stores the data permanently 
- IT can hold large amount of data
- speed slow to read & write

- cache storage: fast short-term memeory, where data is stored temporiarily
speed - extreme fast to read & write 
capacity - can hold small amount of data

*/

/*
DISK STORAGE 
- USER 
- SYSTEM CATALOG
- TEMPERORY DATA


USER DATA STORAGE : It is the main content of the database where the actual data
that user care about is stored.

DB STORAGE:
System CATALOG: a database internal storage for its own information . A blueprint
that keeps track of everything about the database itself , not the user data

- It holds the meta data information about the database.
-- what happens behind is that database server not only stored the data inside 
but it is also going to store diffrent type of data inside datbase it is meta data


INFORMATION SCHEMA :
a system defined schema with built in views that provide info about the database
like table & columns.
*/

USE SalesDB;

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS

-----------------------------------

/*
What is subquery ?
Query inside another query

*/