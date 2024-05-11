## The Select Clause
**Introduction**

- The `SELECT Clause` lies at the heart of SQL, empowering users to retrieve specific data from a database based on their needs and 
  criteria.
- Whether fetching entire datasets, specific columns, or filtered subsets, mastering the `SELECT Clause` is foundational for effectively 
  querying databases.

## How to use Select Clause

 ```sql 
 USE mydb; -- use your own database
 SELECT * 
 FROM customers;
 ```
- `SELECT *`: You can use `*` to retrieve all data from the table.
- `customers`: Specifies the name of the table from which you want to retrieve data.
  
## Alias `AS` in SQL

**Introduction**
- In SQL, `aliases` provide alternative names for columns or tables in a database query.
- They improve query readability and simplify syntax, especially in complex queries involving multiple tables or lengthy column names. 
 
 ## Syntax
 
 ```sql
 SELECT first_name, last_name , points, (points+10)*100 AS discount_factor  
 FROM customers;
 ```

 

