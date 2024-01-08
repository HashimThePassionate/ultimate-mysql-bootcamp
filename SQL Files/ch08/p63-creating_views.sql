USE sql_invoicing;

CREATE VIEW clients_balance AS
SELECT
    c.client_id,
    c.name,
    SUM(i.invoice_total - i.payment_total) AS balance
FROM
    clients c JOIN invoices i USING (client_id)
GROUP BY 1, 2;
