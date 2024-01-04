SELECT order_id, oi.product_id, name, quantity, oi.unit_price
FROM order_items oi
     JOIN products p ON oi.product_id = p.product_id;
