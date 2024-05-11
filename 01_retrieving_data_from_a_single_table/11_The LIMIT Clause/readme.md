## The LIMIT Clause 

**Introduction**

- The `LIMIT Clause` is a SQL feature used to restrict the number of rows returned by a query.
- It allows you to limit the result set to a specified number of rows, which can be useful for pagination or when you only need to 
  retrieve a subset of the available data.

## Syntax
 ```sql
 SELECT phone,state
 FROM customers 
 LIMIT 7;
 ```
- `Phone`, `State`, ...: The columns to be selected from the table.
- `Customers`: The name of the table from which to retrieve data.
- `Number_of_rows`: The maximum number of rows to be returned by the query.

**This query will return the first 7 rows from the customers table.**
  
## How to skip first 10 records using `LIMIT Clause` and Select 3 records before 10 records

 - we define offset 10 , 3
 
 ```sql
 SELECT *  
 FROM customers
 LIMIT 10 , 3;
 ```
## Additional Notes
- The `LIMIT Clause`is supported by most relational database management systems (RDBMS) such as MySQL, PostgreSQL, SQLite, etc.
- Some database systems also support an optional offset parameter to skip a certain number of rows before returning the result set. For 
  example, *LIMIT 10 OFFSET 20 would return rows 21 to 30.*


