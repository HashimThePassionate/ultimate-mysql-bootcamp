

#                                 p14-regexp.sql:

```sql
-- Get the customers whose
--    first names are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

--    last names end with EY OR ON
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

--    last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

--    last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]';
SELECT *
FROM customers
WHERE last_name REGEXP 'BR|BU';


```

## Explaination;

### 1. Retrieving Data:

- Each SQL query starts with SELECT *, which instructs the database to fetch all columns (indicated by *) from the specified table.
- The FROM customers clause specifies that the data should be retrieved from the customers table.

### 2. Filtering with Regular Expressions:

The WHERE clause applies filters to narrow down the results. It uses the REGEXP operator to match text patterns using regular expressions.

### 3. Specific Filtering Patterns:

- *First query*: Matches first names exactly as "ELKA" or "AMBUR".
- *Second query*: Matches last names ending with "EY" or "ON" (<span class="math-inline">\ denotes the end of a string). 
- *Third query:* Matches last names starting with "MY" (^ denotes the beginning) or containing "SE" anywhere within.
- *Fourth and fifth queries:* Both achieve the same result, matching last names with a "B" followed by either "R" or "U". 
- *4. Regular Expression Breakdown:* - `|`: Acts as an "or" operator, matching either of the patterns on its sides. 
- *`^`*: Matches the beginning of a string. - ``: Matches the end of a string.
- *[RU]*: Matches a single character that is either "R" or "U".

### General Process:

The database engine reads the SQL query.
- It locates the customers table.
- It applies the regular expression patterns within the WHERE clause to filter the results.
- It retrieves only the rows that satisfy the specified conditions.
- It returns the filtered results, containing all columns for each matching customer.






#                                 p15-is_null.sql:


```sql
-- Get the orders that are not shipped
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- or
SELECT *
FROM orders
WHERE shipper_id IS NULL;
```

## Explaination:

### 1. Retrieving Data:

-***SELECT** : This part instructs the database to fetch all columns (denoted by the asterisk) from the specified table.
-**FROM orders**: This indicates that the data should be retrieved from the table named "orders".
### 2. Filtering Unshipped Orders:

- *Shipped_date IS NULL*: This condition filters the results to include only those orders where the shipped_date column has a NULL value. NULL typically signifies that the order hasn't been shipped yet.
- *Shipper_id IS NULL*: This alternative condition serves a similar purpose, filtering for orders where the shipper_id column is NULL, indicating that a shipper hasn't been assigned yet.

### 3. Execution:

**The database engine processes these queries sequentially**:
- It first scans the orders table.
- For each row, it evaluates the WHERE condition(s).
- Rows that meet the condition (either shipped_date IS NULL or shipper_id IS NULL) are included in the results.
The final output is a table containing all columns for the unshipped orders, as specified by the SELECT * clause.
### Additional Insights:

- *Database Structure*: The specific structure of the orders table would influence the resulting columns.
- *Alternative Approaches*: Other filtering methods could be employed, such as using a date comparison or checking for a specific value in the shipped_date column.
- *Performance Considerations*: Depending on the table size and query frequency, optimizing for performance might be necessary.
### Key Points:

- The SELECT statement retrieves data from a database table.
- The FROM clause specifies the table to query.
- The WHERE clause filters results based on specified conditions.
- IS NULL checks for the absence of a value in a column.
- OR combines multiple conditions, allowing for alternative filtering criteria.






#                                 p16-order_by.sql:



```sql
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC
```
## Explaination:


### 1. Data Retrieval:

- The query starts with SELECT *, which means it will retrieve all columns (fields) from the table order_items.
- It then calculates a new column called total_price by multiplying quantity and unit_price for each row.

## 2. Filtering:

- The WHERE clause specifies that only rows with order_id equal to 2 should be included in the results. This filters the data to focus on items within a specific order.

### 3. Ordering:

- The ORDER BY total_price DESC clause arranges the results in descending order based on the calculated total_price column. This means the items with the highest total price will appear first in the output.

### In summary:

- The query fetches all columns from the order_items table.
- It calculates a new column named total_price for each row.
- It filters the results to include only rows where order_id is 2.
- It sorts the results in descending order based on the total_price column.





#                                 p17-limit.sql:

```sql
-- Get the top three loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;
```
## Explaination;

The query first selects all rows from the customers table. Then, it orders the rows by the points column in descending order. Finally, it limits the results to the top three rows using the LIMIT clause.

### Here are the steps involved in this process:

- *Data selection*: The SELECT * clause indicates that all columns from the customers table should be retrieved.
- *Sorting*: The ORDER BY points DESC clause sorts the rows in the table by the points column in descending order. This means that the rows with the highest point values will be at the top of the result set.
- *Limiting results*: The LIMIT 3 clause limits the number of rows returned by the query to three. This means that only the top three rows, as determined by the sorting order, will be included in the result set.

Overall, this query is a simple way to identify the top three customers in terms of their loyalty points.
