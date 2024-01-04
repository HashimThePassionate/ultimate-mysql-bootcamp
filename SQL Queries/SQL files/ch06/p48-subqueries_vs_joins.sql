-- Find customers who have ordered lettuce (id = 3)
--     Select customer_id, first_name, last_name
USE sql_store;

-- method 1, more readable
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customers c LEFT JOIN orders o USING(customer_id)
        LEFT JOIN order_items oi USING(order_id)
WHERE
    oi.product_id = 3;


-- method 2
SELECT
    customer_id,
    first_name,
    last_name
FROM 
    customers
WHERE
    customer_id IN (SELECT DISTINCT customer_id
                    FROM orders
                    WHERE order_id IN (SELECT DISTINCT order_id
		                       FROM order_items
                                       WHERE product_id = 3));

-- method 3
SELECT
    customer_id,
    first_name,
    last_name
FROM 
    customers
WHERE
    customer_id IN (SELECT DISTINCT o.customer_id
                    FROM orders o LEFT JOIN order_items oi USING (order_id)
                    WHERE oi.product_id = 3);
