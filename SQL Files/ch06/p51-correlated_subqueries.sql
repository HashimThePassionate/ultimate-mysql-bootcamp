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
