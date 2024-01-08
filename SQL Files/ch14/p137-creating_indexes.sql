-- Write a query to find customers with more than
-- 1000 points.

EXPLAIN SELECT customer_id FROM customers WHERE points > 1000;

-- id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra
-- '1', 'SIMPLE', 'customers', NULL, 'ALL', NULL, NULL, NULL, NULL, '1010', '33.33', 'Using where'

CREATE INDEX idx_points ON customers (points);
EXPLAIN SELECT customer_id FROM customers WHERE points > 1000;

--  id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra
-- '1', 'SIMPLE', 'customers', NULL, 'range', 'idx_points', 'idx_points', '4', NULL, '528', '100.00', 'Using where; Using index'
