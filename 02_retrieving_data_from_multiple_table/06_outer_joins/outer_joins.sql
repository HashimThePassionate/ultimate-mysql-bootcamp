SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;

SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;
