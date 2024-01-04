USE sql_invoicing;

SELECT
    c.client_id,
    c.name,
    (SELECT SUM(invoice_total) FROM invoices WHERE c.client_id = client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sales - average) AS difference
FROM
    clients c;
