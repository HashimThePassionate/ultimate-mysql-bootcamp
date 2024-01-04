-- Get the top three loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;
