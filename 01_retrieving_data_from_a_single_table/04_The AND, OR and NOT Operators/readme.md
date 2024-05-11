## How to filter those records whose birth_date > 2023-08-07 and Points > 1500
 - We use AND operator it return true if both condition meets true.
 ```sql
 SELECT *  
 FROM customers 
 WHERE birth_date > '2023-08-07' AND points > 1500;
 ``` 

## How to filter those records whose birth_date > '2023-08-07' OR Points > 1500

 - We use OR operator it return true if at least one condition meets true.
 ```sql 
 SELECT *  
 FROM customers 
 WHERE birth_date > '2023-08-07' OR points > 1500;
 ```
 
 
## How to filter those records whose birth_date > 2023-08-07 is NOT Greater than

 - We use NOT operator to reverse
 ```sql
 SELECT *  
 FROM customers 
 WHERE NOT(birth_date > '2023-08-07' OR points > 1500);
 ```

## How to filter those records whose birth_date > 2023-08-07 OR Points > 1500 AND city ="Chicago"

 - We use OR and AND both to add multiple conditions.
 ```sql
 SELECT * 
 FROM customers 
 WHERE birth_date > '2023-08-07' OR (points > 1500 AND city = 'Chicago');
 ```