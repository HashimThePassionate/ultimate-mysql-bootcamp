# p46-subqueries.sql
```sql
-- In sql_hr database:
--     Find employees whose earn more than average
USE sql_hr;

SELECT
    *
FROM
    employees
WHERE
    salary > (SELECT AVG(salary) FROM employees);
```
## Explaination;

### 1.Specifying the Database:

USE sql_hr; tells the database system to use the sql_hr database for this query.
### 2.Selecting Data:

- SELECT * indicates that we want to retrieve all columns (fields) from the specified table.
- FROM employees specifies that we're retrieving data from the employees table within the sql_hr database.

### 3.Filtering Results:

WHERE salary > (SELECT AVG(salary) FROM employees) applies a filter to select only those employees whose salary is greater than the average salary of all employees.
- The AVG(salary) function calculates the average salary within the employees table.
- The > operator compares each employee's salary to the calculated average.

### 4.Executing the Query:

The database system processes the query, calculates the average salary, compares each employee's salary to the average, and returns the rows (records) that meet the specified condition (salary above average).

### In simpler terms:

- The query first finds the average salary of all employees in the employees table.
- Then, it looks through each employee's salary and picks out only those who earn more than the calculated average.
Finally, it displays all the information (all columns) for those selected employees.







# p47-the_in_operator.sql
```sql
-- Find clients without invoices

USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
	SELECT DISTINCT client_id
    FROM invoices
);

```
## Explaination;

### 1. Selecting the Database:

USE sql_invoicing; instructs the database system to use the database named sql_invoicing for subsequent queries. This ensures the code interacts with the correct data.

### 2. Main Query:

- SELECT * FROM clients WHERE client_id NOT IN (...); is the primary query that retrieves client information. 
- SELECT *: Fetching all columns (indicated by the asterisk) from the clients table.
WHERE client_id NOT IN (...): Applying a filter condition to include only clients whose client_id is not present in the results of the subquery.

### 3. Subquery:

- SELECT DISTINCT client_id FROM invoices; is the subquery nested within the main query's WHERE clause. It serves to:
- *SELECT DISTINCT client_id*: Retrieve a list of unique client_id values from the invoices table, ensuring no duplicates.

### 4. Combining Results:

- The database system executes the subquery first, producing a set of distinct client_id values associated with existing invoices.
- The main query then filters the clients table, retaining only rows where the client_id is not found in the subquery's result set.
- The final output will display all columns for those clients who have no corresponding invoices in the invoices table.

### Summary:

The code effectively identifies clients who have not yet been invoiced within the sql_invoicing database, allowing for follow-up actions such as invoice generation or investigation into any potential issues.







# p48-subqueries_vs_joins.sql
```sql
-- Find customers who have ordered lettuce (id = 3)
--     Select customer_id, first_name, last_name
USE sql_store;

-- method 1, more readable
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customers c LEFT JOIN orders o USING(customer_id)
        LEFT JOIN order_items oi USING(order_id)
WHERE
    oi.product_id = 3;


-- method 2
SELECT
    customer_id,
    first_name,
    last_name
FROM 
    customers
WHERE
    customer_id IN (SELECT DISTINCT customer_id
                    FROM orders
                    WHERE order_id IN (SELECT DISTINCT order_id
		                       FROM order_items
                                       WHERE product_id = 3));

-- method 3
SELECT
    customer_id,
    first_name,
    last_name
FROM 
    customers
WHERE
    customer_id IN (SELECT DISTINCT o.customer_id
                    FROM orders o LEFT JOIN order_items oi USING (order_id)
                    WHERE oi.product_id = 3);

```
## Explaination;

**All three queries follow a similar logic**:

### 1.Identify the relevant tables:

- *customers*: Contains customer information (id, first name, last name).
- *orders*: Contains order information (id, customer id, date).
- *order_items*: Contains details of items within each order (order id, product id, quantity).

### 2.Establish relationships between tables:

- customers and orders are linked by customer_id.
- orders and order_items are linked by order_id.

### 3.Filter for lettuce orders:

Each query isolates orders containing lettuce (product id 3) using a WHERE clause.

### 4.Retrieve customer details:

The queries select the required customer information (customer_id, first_name, last_name).

### 5.Differences in query structure:

- Method 1 (left joins):
Joins tables sequentially using LEFT JOIN.
Employs DISTINCT to eliminate duplicate rows.
- Method 2 (nested subqueries):
Uses nested subqueries to filter orders and customers.
- Method 3 (left join with subquery):
Combines a left join with a subquery to filter orders.
### Key considerations for choosing a method:

- **Readability**: Method 1 is often considered more readable due to its straightforward join structure.
- **Performance**: The optimal method can vary depending on database size and structure. Testing is recommended for specific cases.







# p51-correlated_subqueries.sql
```sql
-- Get invoices that are larger than the
-- client's average invoice amount
USE sql_invoicing;

SELECT
    *
FROM
    invoices i
WHERE
    invoice_total > (
        SELECT
            AVG(invoice_total)
        FROM
            invoices
        WHERE
            i.client_id = client_id
    );

```
## Explaination;

### 1. Selecting the Database:

USE sql_invoicing;: This line specifies that the query will operate within the database named sql_invoicing. It ensures that the following queries access the correct data tables.

### 2. Retrieving Invoices:

- SELECT * FROM invoices i: This part initiates the data retrieval process. It instructs the database to:
- Fetch all columns (SELECT *) from the table named invoices.
- Assign an alias i to the invoices table for easier reference within the query.

### 3. Filtering Invoices:

WHERE invoice_total > ( ... ): This clause establishes a condition to filter the retrieved invoices. It specifies that only those invoices will be included in the results where the value in the invoice_total column exceeds a particular value.

### 4. Calculating Average Invoice Amount:

(SELECT AVG(invoice_total) FROM invoices WHERE i.client_id = client_id): This subquery, embedded within the WHERE clause, performs a - - crucial calculation:
- It first calculates the average invoice amount for each client using the AVG(invoice_total) function.
- It focuses on invoices belonging to the same client as the current invoice being evaluated in the outer query, ensuring a client-specific comparison. This is achieved by matching the client_id in both the outer and inner queries.

### 5. Comparing Invoice Totals:

- The calculated average invoice amount from the subquery is directly compared with the invoice_total value of each invoice in the outer query.
- Only those invoices with an invoice_total greater than their respective client's average invoice amount are ultimately included in the final results.

### Summary:

The query effectively identifies and returns those invoices that have a higher total value than the typical invoice amount for their respective clients, providing insights into potentially notable or exceptional billing patterns within the sql_invoicing database.









# p52-the_exists_operator.sql
```sql
-- Find the products that have never been ordered
USE sql_store;

SELECT
    *
FROM
    products
WHERE
    product_id NOT IN (
        SELECT
            product_id
        FROM
            order_items
    );

-- better than above
SELECT
    *
FROM
    products p
WHERE
    NOT EXISTS (
        SELECT
            product_id
        FROM
            order_items
        WHERE
            product_id = p.product_id
    );

```
## Explaination;

### 1. Selecting the Database:

USE sql_store; tells the database system to work within the database named "sql_store".

### 2. Retrieving Products Never Ordered (First Query):

- SELECT * FROM products: Fetches all columns from the "products" table.
- WHERE product_id NOT IN (SELECT product_id FROM order_items): Filters results to include only products whose IDs are not found in the "product_id" column of the "order_items" table.

### 3. Retrieving Products Never Ordered (Second Query):

- SELECT * FROM products p: Fetches all columns from the "products" table, using an alias "p" for readability.
- WHERE NOT EXISTS (SELECT product_id FROM order_items WHERE product_id = p.product_id): Filters results to include only products for which there doesn't exist a matching "product_id" in the "order_items" table.

### Key Points:

Both queries achieve the same goal: finding products without any associated orders.
- The second query is generally preferred: It often performs better with large datasets due to how databases optimize NOT EXISTS compared to NOT IN.
- The "order_items" table likely stores individual items within orders: It's used to track which products have been ordered.








# p53-subqueries_in_the_select_clause.sql

```sql
USE sql_invoicing;

SELECT
    c.client_id,
    c.name,
    (SELECT SUM(invoice_total) FROM invoices WHERE c.client_id = client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sales - average) AS difference
FROM
    clients c;

```

## Explaination;

### 1. Selecting the Database:

USE sql_invoicing; tells the database system to use the database named sql_invoicing. This sets the context for the subsequent query.

### 2. Retrieving Data:

SELECT ... FROM clients c; is the main part of the query that fetches data from the clients table. It retrieves the following columns:
- c.client_id: The unique ID of each client.
- c.name: The name of each client.

### 3. Calculating Total Sales for Each Client:

(SELECT SUM(invoice_total) FROM invoices WHERE c.client_id = client_id) AS total_sales uses a subquery to calculate the total sales for each client. It does this by:
- Joining the clients table with the invoices table based on the client_id column.
- Summing up the invoice_total for each client using the SUM function.
- Aliasing the result as total_sales for easier reference.

### 4. Calculating Average Invoice Total:

(SELECT AVG(invoice_total) FROM invoices) AS average calculates the overall average invoice total across all clients using the AVG function.

### 5. Calculating Difference:

(SELECT total_sales - average) AS difference calculates the difference between each client's total sales and the overall average, using the values calculated in steps 3 and 4.

### 6. Presenting the Results:

The final output of the query will display a table with the following columns:
- client_id
- name
- total_sales
- average
- difference

This output provides insights into how each client's sales compare to the overall average, which can be valuable for various sales analyses and decision-making processes.