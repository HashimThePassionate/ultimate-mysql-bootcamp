USE sql_store;

SELECT
    *
FROM
    orders
WHERE
    YEAR(order_date) = YEAR(NOW());

-- We also can use EXTRACT(YEAR FROM NOW()).
