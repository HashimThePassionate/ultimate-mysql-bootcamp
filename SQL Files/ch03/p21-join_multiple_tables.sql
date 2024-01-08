SELECT
    p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name AS payment_method
FROM payments p
     JOIN payment_methods pm
       ON p.payment_method = pm.payment_method_id
     JOIN clients c
       ON p.client_id = c.client_id;
