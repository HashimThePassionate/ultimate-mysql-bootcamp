# Updatable Views in MySQL
### Introduction
This document provides an overview of updatable views in MySQL databases. Updatable views allow users to perform INSERT, UPDATE, and DELETE operations directly on the view, which in turn modifies the underlying tables based on defined rules and conditions.

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
    WHERE (invoice_total-payment_total) > 0;

DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

```