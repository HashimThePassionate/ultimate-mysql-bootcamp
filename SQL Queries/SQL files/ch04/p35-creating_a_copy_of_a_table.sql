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
