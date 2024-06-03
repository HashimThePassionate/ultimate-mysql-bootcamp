SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
