SELECT 
order_id,
order_date,
'Active' AS status
FROM orders
WHERE order_date >= '2023-11-09'
UNION
SELECT 
order_id,
order_date,
'Archived' AS status
FROM orders
WHERE order_date < '2023-11-09';