## Prerequisites for Creating Database

Before proceeding with database creation, ensure that you have the following:

- Access to a database management system (DBMS) such as MySQL, SQLite, etc.
- Administrative privileges or permissions to create databases.
- Basic understanding of SQL (Structured Query Language).

## Connect to the Database Management System
- Open your preferred database management tool `(e.g., MySQL Workbench, pgAdmin, SQLiteStudio)`.
- Connect to the database management system using the appropriate credentials `(username, password, host, port)`.

## Create a New Database
 ```sql
 USE <Dbname> || use <Dbname> -- use your own database
 USE mydb || use mydb
 ```
## The SELECT Statement
**Introduction**
- The `SELECT statement` is one of the fundamental SQL commands used to retrieve data from a database. 
- It allows you to query a database table and specify which columns or fields you want to retrieve, as well as any filtering or sorting 
  criteria.
  
## Syntax
The basic syntax of the `SELECT` statement is as follows:

```sql
SELECT customer_id, first_name, last_name ...
FROM customers;
``` 
- `customer_id,first_name, last_name, ...`: Specifies the columns you want to retrieve data from.
- `customers`: Specifies the name of the table from which you want to retrieve data.

## How to Select all fields in Database using SELECT `*`

 - First Select Database.
 - Than Select table
 - Also use semicolon `;` at the end of each statement.

 ```sql
 USE mydb; -- write your own database
 SELECT * 
 FROM customers;
 ```
 **This code selects all data of the table**



