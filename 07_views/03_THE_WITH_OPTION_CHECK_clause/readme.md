# WITH OPTION CHECK clause
### Introduction
The `WITH CHECK OPTION` clause is used when creating updatable views in MySQL. It ensures that any data modification operations performed on the view adhere to the conditions specified in the view's WHERE clause. If a new row or an existing row is modified in a way that violates the WHERE clause condition, the operation is rejected, and an error is raised.

### Example:

```sql

CREATE OR REPLACE VIEW invoices_with_balance AS
	SELECT 
	invoice_id,
	number,
	client_id,
	invoice_total,
	payment_total,
	invoice_total - payment_total AS balance,
	invoice_date,
	payment_date,
	due_date
	FROM invoices
    WHERE (invoice_total-payment_total) > 0
    WITH check OPTION;


```