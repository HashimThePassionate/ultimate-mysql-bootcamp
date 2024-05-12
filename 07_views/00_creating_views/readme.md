# Creating Views in MySQL
### Overview
To create a view in MySQL, you can use the `CREATE VIEW` statement followed by the view name and the `SELECT` query that defines the view's data.

Example:

```sql

CREATE VIEW sales_by_client AS 
SELECT 
c.client_id,
c.name,
SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name;

```