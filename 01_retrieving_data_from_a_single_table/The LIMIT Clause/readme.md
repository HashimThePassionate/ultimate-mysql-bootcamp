## How to Select first 7 records using "LIMIT" Clause

 ```sql
 SELECT * 
 FROM customers 
 LIMIT 7;
 ```
 <img src=./Images/8Capture.PNG></img>

 
## How to skip first 10 records using "LIMIT" Clause and select 3 records before 10 records

 - we define offset 10 , 3
 
 ```sql
 SELECT *  
 FROM customers 
 LIMIT 10 , 3;
 ```