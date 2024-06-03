SELECT 
    c.customer_id,
    c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;