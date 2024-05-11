## How to select those result whose city is kohat or karachi

 - We use IN operator, we can also use OR operator but IN operator is shorter and it works like OR operator.

 ```sql 
 SELECT *  
 FROM customers 
 WHERE city IN ('karachi','kohat');
 ```
 <img src=./Images/4Capture.PNG></img>

 ## How to select those result whose city is not in kohat or karachi

 - We use NOT IN operator
 
 ```sql 
 SELECT *  
 FROM customers  
 WHERE city NOT IN ('karachi','kohat');
 ```

