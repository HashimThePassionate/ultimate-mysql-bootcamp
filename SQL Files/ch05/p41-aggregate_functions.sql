SELECT
    'First half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
    'Second half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-07-01' AND '2020-12-31'
UNION
	SELECT
    'Total' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-01-01' AND '2020-12-31';
