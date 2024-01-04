-- Session one
USE sql_store;

START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;

-- Session two
USE sql_store;

START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;

-- Execute them one by one, and see how the data updated.
