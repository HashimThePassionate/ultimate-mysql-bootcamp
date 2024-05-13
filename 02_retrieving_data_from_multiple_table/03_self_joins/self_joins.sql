SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    e.first_name,
    e.last_name
FROM customers c
JOIN customers e 
ON c.customer_id = e.customer_id;