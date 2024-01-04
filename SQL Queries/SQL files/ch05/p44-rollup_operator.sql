SELECT
    pm.name AS payment_method,
    SUM(p.amount) AS total
FROM
    payments p JOIN payment_methods pm
        ON pm.payment_method_id = p.payment_method
GROUP BY
    pm.name WITH ROLLUP;
    -- Note: If we use WITH ROLLUP clause, the fields used in
    -- GROUP BY must the real fields, not alias.
