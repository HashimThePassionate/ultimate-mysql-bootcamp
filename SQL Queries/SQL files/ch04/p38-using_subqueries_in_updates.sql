-- Write a SQL statement to
--     set the comments to 'Gold customer' where
--     customer's points larger than 3000
UPDATE orders
SET
    comments = 'Gold customer'
WHERE
    customer_id IN (SELECT customer_id
                    FROM customers
		    WHERE points > 3000);
