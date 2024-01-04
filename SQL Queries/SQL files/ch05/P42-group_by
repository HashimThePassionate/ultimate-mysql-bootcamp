SELECT
    p.date,
    pm.name AS payment_method,
    SUM(p.amount) AS total_payments
FROM
    payments p JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY
    p.date, payment_method
ORDER BY
    p.date;