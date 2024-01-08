USING sql_invoicing;

DELIMITER $$

CREATE PROCEDURE get_invoices_with_balance() 
BEGIN
    SELECT
       *,
       invoice_total - payment_total AS balance
    FROM
       invoices
    WHERE
        invoice_total - payment_total > 0;
END $$

DELIMITER ;
