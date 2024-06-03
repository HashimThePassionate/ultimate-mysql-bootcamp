UPDATE orders
SET comments = "Gold Customer"
WHERE c_id IN
                (SELECT customer_id
                 FROM customers
                 WHERE points > 1800);