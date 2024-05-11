## How to select those rows that matched with specific string pattern using LIKE operator

 - we use WHERE last_name LIKE 's%' it means last_name must be start with s but after s it contain any letters.

 ```sql 
 SELECT *  
 FROM customers 
 WHERE last_name LIKE 's%';
 ```
 <img src=./Images/6Capture.PNG></img>


 **Another Example**
 
 ```sql
 SELECT * 
 FROM customers 
 WHERE last_name LIKE 'summer%'; 
 ```
## we can also specify first and last letter and Between letters range with "__" underscore

 ```sql
 SELECT *  
 FROM customers 
 WHERE last_name LIKE 'v______s'
 ```
 <img src=./Images/7Capture.PNG></img>


