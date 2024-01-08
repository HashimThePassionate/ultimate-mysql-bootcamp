USE sql_invoicing;

CREATE TABLE payments_audit
(
    client_id   INT           NOT NULL,
    date        DATE          NOT NULL,
    amount      DECIMAL(9, 2) NOT NULL,
    action_type VARCHAR(50)   NOT NULL,
    action_date DATETIME      NOT NULL
);

DELIMITER $$

DROP TRIGGER IF EXISTS payments_after_insert;

CREATE TRIGGER payments_after_insert
    AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
    UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END $$

DELIMITER ;

DELIMITER $$

DROP TRIGGER IF EXISTS payments_after_delete;

CREATE TRIGGER payments_after_delete
    AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
    UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END $$

DELIMITER ;
