-- Get the orders that are not shipped
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- or
SELECT *
FROM orders
WHERE shipper_id IS NULL;
