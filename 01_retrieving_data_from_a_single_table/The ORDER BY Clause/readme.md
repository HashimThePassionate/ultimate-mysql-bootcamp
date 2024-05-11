## How to select and sort data by column name

 - by default every column is sorted according to primary key column.
 ```sql
 SELECT *  
 FROM customers 
 ORDER by first_name;
 ``` 
## We can also sort by multiple columns
 
 ```sql
 SELECT * 
 FROM customers 
 ORDER by first_name DESC, last_name ASC;
 ```

## How to Select Table and sort using First_name with ORDER BY Clause

 ```sql
 USE mydb;
 SELECT * 
 FROM customers
 -- WHERE customer_id = 5  "--" Double Hyphen is used to comment something.
 ORDER BY first_name;
 ```

