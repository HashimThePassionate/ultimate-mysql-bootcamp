-- Get the customers
--     located in Virginia
--     who have spent more than $100
SELECT
    c.customer_id AS id,
    c.first_name AS first_name,
    c.last_name AS last_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM
    customers c LEFT JOIN orders o USING(customer_id)
    LEFT JOIN order_items oi USING(order_id)
WHERE
    c.state = 'VA'
GROUP BY 
    id, first_name, last_name
HAVING
    total_sales > 100;
