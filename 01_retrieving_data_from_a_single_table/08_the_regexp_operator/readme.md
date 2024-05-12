## The REGEXP Operator 
**Introduction**

- The `REGEXP Operator` is a logical operator in SQL used to search for strings that match a specified regular expression pattern.
-  It allows you to perform more complex pattern matching compared to the `LIKE Operator`, by supporting regular expressions for pattern 
   matching.

## Syntax
 
 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP 'hr' -- hr is a pattern
 ```
- `first_name`: The column to be searched for the specified regular expression pattern.
- `Pattern`: The regular expression pattern to search for.

- We can also use `REGEXP` for more complex string patterns.

## First_name must end with y

 ```sql
 SELECT * 
 FROM customers 
 WHERE first_name REGEXP 'y$'
 ```
## We can also use `Pipe Operator` | in REGEXP

 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP '^cl|t$'
 ```
 - It means first_name must start with cl.
 - Or first_name must end with t.

## We can also specify [] with `REGEXP`

 ```sql
 SELECT * 
 FROM customers 
 WHERE first_name REGEXP '[lev]y'
 ```

## We can also specify `range` [a-h] with `REGEXP`

 ```sql
 SELECT *  
 FROM customers 
 WHERE first_name REGEXP '[b-z]y'
 ```

## Additional Notes
- Regular expressions can be complex and powerful, allowing for flexible pattern matching based on various criteria such as character 
  classes, quantifiers, anchors, and more.
- The specific syntax and behavior of regular expressions may vary depending on the database system being used.

 
