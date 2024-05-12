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

**`Here's an explanation of the trigger and a demonstration of how to check the trigger data with GIft:`**
![[Helpful for insert trigger video]](https://github.com/Hassansahi1122/ultimate-mysql-bootcamp/blob/main/09_triggers/video/triggerinsert.gif)

---
### `Example2:`

```sql
-- Change the delimiter to $$ to handle the trigger definition
DELIMITER $$

-- Create a trigger named payment_after_delete that fires after a deletion from the payments table
CREATE TRIGGER payment_after_delete
AFTER DELETE ON payments
FOR EACH ROW
BEGIN
    -- Update the invoices table by subtracting the deleted payment amount from the payment_total column
    -- for the invoice associated with the deleted payment
    UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END $$

-- Reset the delimiter back to ;
DELIMITER ;

-- Perform a delete operation on the payments table to trigger the trigger
DELETE FROM payments WHERE payment_id = 10;

-- Check the updated invoices table to see the changes
SELECT * FROM invoices WHERE invoice_id = (SELECT invoice_id FROM payments WHERE payment_id = 10);
```

In this example, the trigger `payment_after_delete` is created to update the `payment_total` column in the `invoices` table when a payment is deleted from the `payments` table. After deleting a payment with `payment_id` 10, the `invoices` table is queried to see the updated `payment_total` for the invoice associated with the deleted payment.

**`Here's an explanation of the trigger and a demonstration of how to check the trigger data with GIft:`**
![[Helpful for insert trigger video]](https://github.com/Hassansahi1122/ultimate-mysql-bootcamp/blob/main/09_triggers/video/triggerdel.gif)

---

### `Example3:`
This example demonstrates creating triggers in MySQL to update another table (`invoices`) and log the changes into an audit table (`payments_audit`) when `INSERT` and `DELETE` operations are performed on the `payments` table.

*Here's the `breakdown`:*

1. **Create an audit table (`payments_audit`):**
   ```sql
   CREATE TABLE payments_audit
   (
       client_id   INT           NOT NULL,
       date        DATE          NOT NULL,
       amount      DECIMAL(9, 2) NOT NULL,
       action_type VARCHAR(50)   NOT NULL,
       action_date DATETIME      NOT NULL
   );
   ```

2. **Create a trigger (`payments_after_insert`) for `INSERT` operation on `payments` table:**
   - Update `payment_total` in `invoices`.
   - Insert a record into `payments_audit` for the `INSERT` action.
   ```sql
   CREATE TRIGGER payments_after_insert
       AFTER INSERT ON payments
       FOR EACH ROW
   BEGIN
       UPDATE invoices
       SET payment_total = payment_total + NEW.amount
       WHERE invoice_id = NEW.invoice_id;
       
       INSERT INTO payments_audit
       VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
   END;
   ```

3. **Create a trigger (`payments_after_delete`) for `DELETE` operation on `payments` table:**
   - Update `payment_total` in `invoices`.
   - Insert a record into `payments_audit` for the `DELETE` action.
   ```sql
   CREATE TRIGGER payments_after_delete
       AFTER DELETE ON payments
       FOR EACH ROW
   BEGIN
       UPDATE invoices
       SET payment_total = payment_total - OLD.amount
       WHERE invoice_id = OLD.invoice_id;
       
       INSERT INTO payments_audit
       VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
   END;
   ```

4. **Insert a record into the `payments` table:**
   ```sql
   INSERT INTO payments 
   VALUES (DEFAULT,5,3,'2023-09-01',10,1);
   ```

These triggers will update the `payment_total` in the `invoices` table and log the changes in the `payments_audit` table whenever a `INSERT` or `DELETE` operation is performed on the `payments` table.
