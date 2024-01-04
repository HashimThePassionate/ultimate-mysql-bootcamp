SELECT
    p.product_id,
    p.name,
    oi.quantity
FROM order_items oi
     RIGHT JOIN products p
       ON p.product_id = oi.product_id;

SELECT
    p.product_id,
    p.name,
    oi.quantity
FROM products p
     LEFT JOIN order_items oi
       ON p.product_id = oi.product_id;
