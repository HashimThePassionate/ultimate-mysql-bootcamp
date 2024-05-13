SELECT 
o.order_id,
c.first_name
FROM orders o 
JOIN customers c
-- ON o.customer_id = c.first_name
USING (customer_id);