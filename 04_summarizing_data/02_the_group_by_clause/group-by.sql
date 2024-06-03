SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
ORDER BY total_sales DESC;

SELECT 
client_id,
COUNT(*) AS number_of_invoices,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5;