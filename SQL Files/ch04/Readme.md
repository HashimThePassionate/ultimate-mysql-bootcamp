# p33-inserting_multiple_rows.sql

```sql
-- Insert three rows in the products table
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Product1', 10, 1.95),
       ('Product2', 11, 1.95),
       ('Product3', 12, 1.95);

```
## Explaination;

### 1. Specifying the Target Table:

The statement begins with INSERT INTO products, indicating that new rows will be added to the table named "products".

### 2. Listing Target Columns (Optional):

The statement includes (name, quantity_in_stock, unit_price) to explicitly specify the columns that will receive the new data. While optional, this practice is recommended for clarity and to ensure data is inserted into the correct columns.

### 3. Providing Values:

The VALUES clause introduces the actual data to be inserted. It's followed by three sets of values, each enclosed in parentheses and separated by commas:
- ('Product1', 10, 1.95)
- ('Product2', 11, 1.95)
- ('Product3', 12, 1.95)
Each set of values corresponds to a new row, with values matching the order of the specified columns.

### 4. Termination:

The semicolon (;) at the end marks the end of the SQL statement.

**Execution**:

When a database system executes this statement, it performs these steps:
- Locates the "products" table.
- Inserts three new rows into the table.
- Populates the "name", "quantity_in_stock", and "unit_price" columns with the provided values for each row.

### Summary:

The statement effectively adds three new product entries to the "products" table, each with its respective name, quantity in stock, and unit price.






# p35-creating_a_copy_of_a_table.sql

```sql
USE sql_invoicing;

CREATE TABLE invoices_archived AS
    SELECT
        i.invoice_id,
	i.number,
	c.name AS client,
	i.invoice_total,
	i.payment_total,
	i.invoice_date,
	i.due_date,
	i.payment_date
    FROM invoices i JOIN clients c ON i.client_id = c.client_id
    WHERE i.payment_date IS NOT NULL;

-- or
CREATE TABLE invoices_archived AS
    SELECT
        i.invoice_id,
	i.number,
	c.name AS client,
	i.invoice_total,
	i.payment_total,
	i.invoice_date,
	i.due_date,
	i.payment_date
    FROM invoices OIN clients c USING (client_id)
    WHERE i.payment_date IS NOT NULL;
```

## Explaination;

### 1. Selecting the Database:

USE sql_invoicing; instructs the database system to use the database named sql_invoicing for subsequent commands.

### 2. Creating a New Table:

- CREATE TABLE invoices_archived AS ... creates a new table named invoices_archived.
- AS indicates that the table structure and data will be derived from the following query.

### 3. Populating the Table with Data:

The SELECT statement retrieves data from existing tables and populates the new table.

### 4. Joining Tables:

JOIN clients c ON i.client_id = c.client_id or JOIN clients c USING (client_id) links the invoices table with the clients table based on matching client_id values. This combines invoice information with associated client names.

### 5. Filtering Data:

WHERE i.payment_date IS NOT NULL ensures that only invoices with a payment date (meaning they've been paid) are included in the new table.
### 6. Selecting Specific Columns:

The query specifies the columns to be included in the new table:
- invoice_id
- number
- client (derived from the clients table)
- invoice_total
- payment_total
- invoice_date
- due_date
- payment_date

### 7. Table Creation:

The database system executes the query and creates the invoices_archived table with the specified structure and data, effectively archiving paid invoices.

### 8. Alternative Syntax:

The two JOIN variations (JOIN ... ON and JOIN ... USING) achieve the same result, but JOIN ... USING offers a shorthand for joining based on a common column name.




# p37-updating_multiple_rows.sql

```sql
-- Write a SQL statement to
--     given any customers born before 1990
--     50 extra points
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'
```

## Explaination;


### 1. Identifying the Target Table:

The statement begins with UPDATE customers, indicating that it aims to modify data within the customers table.

### 2. Specifying the Columns to Change:

The SET clause pinpoints the exact columns to be updated. In this case, it's points = points + 50, meaning the points column will be adjusted.

### 3. Defining the Criteria for Updates:

The WHERE clause establishes the conditions that must be met for a row to be updated. Here, it's birth_date < '1990-01-01', ensuring that only customers born before 1990 will have their points modified.

### 4. Executing the Update:

*Upon execution, the database system undertakes these steps*:
It locates all rows within the customers table that satisfy the WHERE clause (birth date prior to 1990).
For each qualifying row, it enhances the value in the points column by adding 50.

### 5. Confirmation of Completion:

The database typically conveys a message affirming the successful execution of the update, often specifying the number of rows affected.







# p38-using_subqueries_in_updates.sql

```sql
-- Write a SQL statement to
--     set the comments to 'Gold customer' where
--     customer's points larger than 3000
UPDATE orders
SET
    comments = 'Gold customer'
WHERE
    customer_id IN (SELECT customer_id
                    FROM customers
		    WHERE points > 3000);
```

## Explaination;

### 1. Identifying Target Table:

The statement begins with UPDATE orders, indicating that the modifications will be made to the orders table.

### 2. Specifying Columns to Update:

The SET clause pinpoints the column to be altered: comments = 'Gold customer'. This sets the value of the comments column to 'Gold customer' for the affected rows.

### 3. Determining Affected Rows:

- The WHERE clause establishes the condition for selecting rows: customer_id IN (SELECT customer_id FROM customers WHERE points > 3000).
- This employs a subquery to identify customers with points exceeding 3000.
- The IN operator verifies if a customer's ID in the orders table exists within the result of the subquery.

### 4. Updating Data:

The database engine executes the statement:
- It retrieves customer IDs with points greater than 3000 from the customers table.
- It locates rows in the orders table with matching customer IDs.
- It sets the comments column to 'Gold customer' for those rows.

### 5. Final Effect:

The comments column in the orders table now reflects 'Gold customer' for orders associated with customers who have points exceeding 3000.