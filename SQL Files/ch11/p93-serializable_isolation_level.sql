-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 3;
COMMIT;
