## use REGEXP to use complex string pattern

 - we can also use REGEXP for more complex string patterns.

 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP 'hr'
 ```

**first_name must end with t**

 ```sql
 SELECT * 
 FROM customers 
 WHERE first_name REGEXP 't$'
 ```
## we can also use pipe operator | in REGEXP

 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP '^cl|t$'
 ```

 - it means first_name must start with cl
 - Or first_name must end with t

## we can also specify []

 ```sql
 SELECT * 
 FROM customers 
 WHERE first_name REGEXP '[agc]t'
 ```

 - first_name will be at, gt, ct anywhere.

## we can also specify range [a-h]

 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP '[a-h]t'
 ```

 - first_name will be at,bt,ct,dt,et,ft, gt, ht anywhere.
