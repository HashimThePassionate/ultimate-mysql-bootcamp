## The IN Operator

**Introduction**
- The `IN Operator` is a logical operator in SQL used to specify multiple values in a WHERE clause.
- It allows you to filter rows based on a specified list of values, providing a concise alternative to multiple OR conditions.

## Syntax

```sql 
 SELECT *  
 FROM customers 
 WHERE city IN ('Chicago','kohat');
 ```

 - We can use `IN Operator` instead of `OR operator`
 - `IN Operator` is shorter and it works like `OR operator`.

 ## How to select those result whose city is `NOT IN` Chicago or Atlanta
 
 ```sql 
 SELECT *  
 FROM customers  
 WHERE city NOT IN ('Atlanta','Chicago');
 ```
- We use `NOT IN operator`.
  
## Additional Notes  

- The `IN Operator` can also be used with subqueries, allowing for more complex filtering based on the results of another query.
- It is important to note that the IN operator checks for exact matches, so if there are NULL values in the column being compared, they 
  will not match any value in the list.
 

