USE sql_store;

-- Do a cross join between sippers and products
--   using the implicit syntax
SELECT
    s.name AS shipper,
    p.name AS product
FROM
    shippers s, products p
ORDER BY shipper;

--   and then using the explicit syntax
SELECT
    s.name AS shipper,
    p.name AS product
FROM
    shippers s CROSS JOIN products p
ORDER BY shipper;
