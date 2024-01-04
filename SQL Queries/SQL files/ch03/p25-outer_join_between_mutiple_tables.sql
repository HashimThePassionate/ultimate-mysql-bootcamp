SELECT
    o.order_id,
    o.order_date,
    c.first_name AS customer,
    s.name AS shipper,
    os.name AS status
FROM
    orders o
    LEFT JOIN customers c
      ON o.customer_id = c.customer_id
    LEFT JOIN shippers s
      ON o.shipper_id = s.shipper_id
    LEFT JOIN order_statuses os
      ON o.status = os.order_status_id;
				    
