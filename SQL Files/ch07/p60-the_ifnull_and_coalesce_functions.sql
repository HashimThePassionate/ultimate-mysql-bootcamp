USE sql_store;

SELECT
    CONCAT(first_name, ' ', last_name) AS customer,
    IFNULL(phone, 'Unknown') AS phone
    -- or COALESCE(phone, 'Unknown') AS phone
FROM
    customers;

-- The difference between IFNULL and COALESCE is that COALESCE can accpet
-- more then one candidates.
