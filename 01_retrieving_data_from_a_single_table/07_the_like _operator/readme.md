## The LIKE Operator

**Introduction**
- The `LIKE Operator` is a logical operator in SQL used to search for a specified pattern in a column.
- It allows you to filter rows based on partial matches, using wildcard characters to represent unknown or variable parts of the pattern.

## Wildcard Characters
- `%`: Represents zero or more characters.
- `_`: Represents a single character.
  
## Syntax
 ```sql 
 SELECT *  
 FROM customers 
 WHERE last_name LIKE '%y'; -- % is a pattern
 ```
`Last_name`: The column to be searched for the specified pattern.
`Pattern`: The pattern to search for. It can include wildcard characters (% for zero or more characters, _ for a single character) and 
 regular characters.

 - we use WHERE last_name LIKE '%y' it means last_name must be end with y but before y it contain any letters.

## we can also specify first and last letter and Between letters range with "__" underscore

 ```sql
 SELECT *  
 FROM customers 
 WHERE last_name LIKE 'b______y'
 ```
## Additional Notes
- The `LIKE Operator` is case-insensitive by default in most database systems, but this behavior may vary depending on the database 
  configuration.
- You can use the `NOT LIKE Operator` to find rows that do not match the specified pattern.

 



