## SELECT Statement
**Introduction**
- The `SELECT statement` is one of the fundamental SQL commands used to retrieve data from a database. 
- It allows you to query a database table and specify which columns or fields you want to retrieve, as well as any filtering or sorting 
  criteria.
  
## Syntax
The basic syntax of the `SELECT` statement is as follows:

```sql
SELECT first_name, last_name, ...
FROM customers;
```
- `first_name, last_name, ...`: Specifies the columns you want to retrieve data from.You can also use `*`to select all columns.
- customers: Specifies the name of the table from which you want to retrieve data.

## How to Select Database
 
 ```sql
 USE <Dbname> || use <Dbname>
 USE mydb || use mydb
 ```

## How to Select all Table fields in Database using "SELECT *"

 - First Select Database.
 - Select table
 - Also use semicolon ; at the end of each statement.

 ```sql
 USE mydb; -- write your own database
 SELECT * 
 FROM customers;
 ```
 **This code selects all data of the table**



