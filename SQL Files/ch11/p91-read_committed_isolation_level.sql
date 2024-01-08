-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT points
FROM customers
WHERE customer_id = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;

SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20
WHERE customer_id = 1;
COMMIT;
