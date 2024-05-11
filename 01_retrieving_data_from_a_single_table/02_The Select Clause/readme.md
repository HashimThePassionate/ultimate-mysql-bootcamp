## Select Clause
**Introduction**

- The `SELECT clause` lies at the heart of SQL, empowering users to retrieve specific data from a database based on their needs and 
  criteria.
- Whether fetching entire datasets, specific columns, or filtered subsets, mastering the `SELECT clause` is foundational for effectively 
  querying databases.

## Use of Select Clause

 ```sql -- use your own database
 USE mydb; 
 SELECT * 
 FROM customers;
 ``` 
## Select specific field  but change calculated name in run time with AS Alias

 ```sql
 SELECT first_name, last_name , points, (points+10)*100 AS discount_factor  
 FROM customers;
 ```

 

