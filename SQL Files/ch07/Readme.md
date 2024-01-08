# p57-date_functions.sql
```sql
USE sql_store;

SELECT
    *
FROM
    orders
WHERE
    YEAR(order_date) = YEAR(NOW());

-- We also can use EXTRACT(YEAR FROM NOW()).
```

## Explaination;

### 1.USE sql_store;

Specifies the database: This instruction tells the database management system to use the database named sql_store for subsequent commands. It ensures you're working within the correct context for your data.

### 2.SELECT *

Retrieves all columns: This part of the query selects all columns (designated by the asterisk *) from the specified table. It means you'll fetch every piece of information available for each row that meets the filtering criteria.

### FROM orders

Targets the table: This clause designates the table named orders as the source of the data. It's where the query will gather the information requested in the SELECT clause.

### 4.WHERE YEAR(order_date) = YEAR(NOW());

- **Applies a filter**: This condition narrows down the results to specific rows.
 It filters the data to include only orders where:
- The YEAR(order_date) function extracts the year from the order_date column.
- The extracted year is compared to the current year using YEAR(NOW()), which obtains the year from the current date and time.
- The = operator ensures that only orders placed in the current year are included in the final results.

### In essence, this SQL query:

Selects all columns (all available information)
- From the orders table
- Within the sql_store database
- Filters the results to include only orders placed in the current year.

### Output:

The query's output will be a table containing all columns of information for each order that meets the year-based filtering condition.




# p60-the_ifnull_and_coalesce_functions.sql
```sql
USE sql_store;

SELECT
    CONCAT(first_name, ' ', last_name) AS customer,
    IFNULL(phone, 'Unknown') AS phone
    -- or COALESCE(phone, 'Unknown') AS phone
FROM
    customers;

-- The difference between IFNULL and COALESCE is that COALESCE can accpet
-- more then one candidates.

```

## Explaination;

### 1. Selecting a Database:

USE sql_store; instructs the database system to use a database named sql_store. This ensures that subsequent commands operate within that specific database.

### 2. Retrieving Data:

SELECT initiates the data retrieval process.
It specifies which columns to extract and potentially modify:
- CONCAT(first_name, ' ', last_name) AS customer: This combines the first_name and last_name columns into a single column named customer, separated by a space.
- IFNULL(phone, 'Unknown') AS phone: This replaces any null values in the phone column with the text 'Unknown'. The result is named phone.

### 3. Identifying the Source:

FROM customers; indicates that the data should be retrieved from a table named customers within the chosen database.

### 4. Handling Null Values:

IFNULL and COALESCE are functions that address null values:
- IFNULL(phone, 'Unknown') checks if the phone value is null. If it is, it's replaced with 'Unknown'.
- COALESCE operates similarly, but can handle multiple potential replacements. It returns the first non-null value encountered.

### 5. Additional Information:

The comment clarifies the difference between IFNULL and COALESCE in terms of the number of values they can process.
In summary, the query:

- Selects the sql_store database.
- Retrieves data from the customers table.
- Combines first and last names into a customer column.
- Replaces null phone numbers with 'Unknown'.
- Presents the results in a structured format.






# p61-the_if_function.sql
```sql
USE sql_store;

SELECT
    product_id,
    name,
    t.orders,
    IF(t.orders > 1, 'Many times', 'Once') AS frequency
FROM
    products p RIGHT JOIN (
        SELECT product_id, COUNT(1) AS orders
	FROM sql_store.order_items GROUP BY 1) t
    USING(product_id);

SELECT
    product_id,
    name,
    COUNT(1) AS orders,
    IF(COUNT(1) > 1, 'Many times', 'Once') AS frequency
FROM
    products JOIN order_items USING (product_id)
GROUP BY
    product_id, name;

```

## Explaination;

### 1. USE sql_store

This statement specifies which database to use within the MySQL server. It tells the system to switch to a database named "sql_store" for subsequent queries.

### 2. SELECT ...

This is the main part of the query that retrieves data from the database. It selects specific columns and applies formatting and logic to create the desired output.

### 3. CONCAT(first_name, ' ', last_name) AS customer

This combines the first_name and last_name columns into a single column named "customer", separated by a space. It creates a full customer name for better readability.
### 4. points

This selects the "points" column from the "customers" table, displaying the number of points each customer has.
### 5. CASE WHEN ... END AS type

- This conditional statement assigns a customer "type" based on their point level:
- *Bronze*: Less than 2000 points
- *Silver*: Between 2000 and 3000 points (inclusive)
- *Gold*: More than 3000 points
### 6. FROM customers

This specifies that the data should be retrieved from the "customers" table within the "sql_store" database.

### 7. ORDER BY points DESC;

This sorts the results in descending order based on the "points" column, showing customers with the highest points first.

### In summary, this SQL code:

- Selects the "sql_store" database.
- Retrieves customer names (combined first and last name), their point totals, and assigns a customer tier based on points.
- Displays the results in a descending order of points, starting with the highest-scoring customers.

It's likely used for creating a customer list or report that highlights customer tiers based on a loyalty program or similar point-based system.

# p62-the_case_operator.sql


```sql
USE sql_store;

SELECT
    CONCAT(first_name, ' ', last_name) AS customer,
    points,
    CASE
        WHEN points < 2000 THEN 'Bronze'
	WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
	-- WHEN points <= 3000 THEN 'Silver'
	ELSE 'Gold'
    END AS type
FROM
    customers
ORDER BY
    points DESC;
```
## Explaination;

### 1.Database Selection:

The query begins by specifying the database to use: USE sql_store;

### 2.Data Retrieval:

The SELECT statement fetches specific columns from the customers table:

- *CONCAT(first_name, ' ', last_name) AS customer*: Combines first and last names into a single column named "customer."
- *points*: Retrieves the "points" column.
CASE...END AS type: Assigns a membership type based on points:
- Bronze for less than 2000 points.
- Silver for 2000-3000 points.
- Gold for over 3000 points.

### 3.Ordering Results:

ORDER BY points DESC: Arranges the results in descending order of "points."

### In essence, this query:

- Combines first and last names into a single column.
- Assigns membership types based on point thresholds.
- Sorts the results from highest to lowest points.
