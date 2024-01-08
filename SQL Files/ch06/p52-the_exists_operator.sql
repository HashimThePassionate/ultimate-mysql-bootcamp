-- Find the products that have never been ordered
USE sql_store;

SELECT
    *
FROM
    products
WHERE
    product_id NOT IN (
        SELECT
            product_id
        FROM
            order_items
    );

-- better than above
SELECT
    *
FROM
    products p
WHERE
    NOT EXISTS (
        SELECT
            product_id
        FROM
            order_items
        WHERE
            product_id = p.product_id
    );

