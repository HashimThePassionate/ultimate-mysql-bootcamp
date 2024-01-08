USE sql_store;

SELECT
    product_id,
    name,
    t.orders,
    IF(t.orders > 1, 'Many times', 'Once') AS frequency
FROM
    products p RIGHT JOIN (
        SELECT product_id, COUNT(1) AS orders
	FROM sql_store.order_items GROUP BY 1) t
    USING(product_id);

SELECT
    product_id,
    name,
    COUNT(1) AS orders,
    IF(COUNT(1) > 1, 'Many times', 'Once') AS frequency
FROM
    products JOIN order_items USING (product_id)
GROUP BY
    product_id, name;
