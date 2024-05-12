## The ORDER BY Clause

**Introduction**
- The `ORDER BY Clause` is a fundamental component of SQL used to sort the result set returned by a query.
- It allows you to specify the order in which the rows should be displayed, based on the values in one or more columns.

## Syntax

 ```sql
 SELECT * 
 FROM customers 
 ORDER by first_name DESC, last_name ASC ...;
 ```
- `First_name`, `Last_name`: The columns used to sort the result set.
- ASC (optional): Specifies ascending order *(default)*.
- DESC (optional): Specifies descending order.
  
- By default every column is sorted according to primary key column.

## How to Select Table and sort using First_name with `ORDER BY Clause`

 ```sql
 USE mydb;
 SELECT * 
 FROM customers
  -- WHERE customer_id = 5  "--" Double Hyphen is used to comment something.
 ORDER BY first_name;
 ```
## Additional Notes
- The `ORDER BY Clause` can be applied to one or more columns, allowing for multi-level sorting.
- If no sorting order (ASC or DESC) is specified, ASC (ascending order) is assumed by default.
- The `ORDER BY Clause` is `*typically the last clause in a SELECT statement*`.

 

