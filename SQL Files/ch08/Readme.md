#  p63-creating_views.sql
```sql
USE sql_invoicing;

CREATE VIEW clients_balance AS
SELECT
    c.client_id,
    c.name,
    SUM(i.invoice_total - i.payment_total) AS balance
FROM
    clients c JOIN invoices i USING (client_id)
GROUP BY 1, 2;

```

## Explaination;

### 1. Selecting the Database:

USE sql_invoicing; instructs the database system to use the database named sql_invoicing for subsequent operations.

### 2. Creating a View:

CREATE VIEW clients_balance AS initiates the creation of a view named clients_balance. Views are virtual tables that store a defined query, allowing you to access its results without executing the query every time.

### 3. Selecting Data and Calculating Balance:

SELECT c.client_id, c.name, SUM(i.invoice_total - i.payment_total) AS balance specifies the columns to be included in the view:
- c.client_id: Retrieves the client ID from the clients table.
- *c.name*: Retrieves the client name from the clients table.
- SUM(i.invoice_total - i.payment_total) AS balance: Calculates the balance for each client by subtracting the total payments (payment_total) from the total invoices (invoice_total) for each client. 
- The SUM function aggregates these values for each client.

### 4. Joining Tables:

FROM clients c JOIN invoices i USING (client_id) joins the clients table (c) with the invoices table (i) based on the common client_id column. This creates a combined result set that includes information from both tables.

### 5. Grouping and Aggregating:

GROUP BY 1, 2: Groups the results by the first two columns in the SELECT clause, which are client_id and name. This ensures that the balance calculation is performed for each unique client.
