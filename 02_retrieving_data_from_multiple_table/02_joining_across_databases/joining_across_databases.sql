SELECT oi.product_id, quantity_in_stock
FROM order_items oi
INNER JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

select * 
FROM orders_items oi
INNER JOIN inventory.products p
ON
oi.product_id = p.product_id;