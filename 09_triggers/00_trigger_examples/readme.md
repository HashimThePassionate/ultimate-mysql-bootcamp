# Examples
### Example1:

```sql
-- Change the delimiter to $$ to handle the trigger definition
DELIMITER $$
-- Create a trigger named payment_after_insert that fires after an insertion into the payments table
CREATE TRIGGER payment_after_insert
    AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
    -- Update the invoices table by adding the new payment amount to the payment_total column
    -- for the invoice associated with the newly inserted payment
    UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END $$
-- Reset the delimiter back to ;
DELIMITER ;
```

This trigger is designed to automatically update the `payment_total` column in the `invoices` table whenever a new payment is inserted into the `payments` table.
