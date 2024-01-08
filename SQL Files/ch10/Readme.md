#  p79-triggers.sql

```sql
-- Create a trigger that gets fired when we
-- delete a payment.
USE sql_invoicing;

DELIMITER $$

DROP TRIGGER IF EXISTS payment_after_delete;
CREATE TRIGGER payment_after_delete
    AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
    UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END $$

DELIMITER ;
```


Here's a breakdown of the process in the SQL code you provided:

## 1. Setup:

- USE sql_invoicing;: This selects the database named sql_invoicing to work within.
- **DELIMITER $<span class="math-inline">\**: This temporarily changes the statement delimiter from the default semicolon (`;`) to double dollar signs (``). This is necessary because the trigger body itself contains semicolons, and we need a way to clearly mark the end of the trigger definition.


## 2. Trigger Creation:

 DROP TRIGGER IF EXISTS payment_after_delete;: This drops any existing trigger named payment_after_delete to avoid conflicts.
- *CREATE TRIGGER payment_after_delete ...*: This creates a new trigger with the specified name and properties:
- *AFTER DELETE ON payments*: It's an AFTER trigger, meaning it fires after the specified event (DELETE in this case) occurs on the specified table (payments).
- *FOR EACH ROW*: It executes for each row that is affected by the delete operation.

## 3. Trigger Body:

- *BEGIN*: This marks the start of the trigger's actions.
- **UPDATE invoices SET payment_total = payment_total - OLD.amount WHERE invoice_id = OLD.invoice_id;**: This is the core action of the trigger:
- It updates the payment_total field in the invoices table.
- It subtracts the amount value of the deleted payment (OLD.amount) from the current payment_total.
- It only updates invoices that match the invoice_id of the deleted payment (OLD.invoice_id).
- *END $$*: This marks the end of the trigger's actions.

## 4. Delimiter Reset:

  - *DELIMITER ;*: This resets the delimiter back to the default semicolon, allowing for normal SQL statement execution again.


## In summary:

This trigger ensures that whenever a payment is deleted from the payments table, the corresponding invoice's payment_total is automatically adjusted to reflect the removed payment. This helps maintain data integrity and consistency within the sql_invoicing database.






#      p82-using_triggers_for_auditing.sql


```sql
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

```

## Explaination;


### 1. Table Creation:

Creating payments_audit table: This table stores payment audit information, including client ID, date, amount, action type (insert or delete), and action date.

### 2. Trigger Creation:

- *Creating payments_after_insert trigger*:
 -  Activates after a payment is inserted into the payments table.
 -  Updates the payment_total in the corresponding invoice in the invoices table.
 -  Inserts payment details into the payments_audit table for tracking.
- *Creating payments_after_delete trigger*:
 - Activates after a payment is deleted from the payments table.
 - Subtracts the deleted payment amount from payment_total in the corresponding invoice.
 - Inserts deletion details into payments_audit for tracking.

### Key Processes:

- *Data Consistency*: Triggers maintain consistency between payments and invoices tables by automatically updating payment totals.
- *Auditing*: The payments_audit table tracks payment history, including inserts and deletes, for transparency and potential troubleshooting.
- *Automation*: Triggers execute automatically upon data changes, ensuring data integrity without manual intervention.

Overall, these processes create an efficient and reliable system for managing payment data and maintaining accurate records for auditing purposes.





#      p83-events.sql

```sql
SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;
-- SET GLOBAL event_scheduler = OFF;

DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN
    DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;
```




## Explaination

### 1. Checking Event Scheduler Status:

SHOW VARIABLES LIKE 'event%';: This line queries the database to view the current status and settings related to the event scheduler.

### 2. Enabling Event Scheduler:

SET GLOBAL event_scheduler = ON;: This line activates the event scheduler, allowing scheduled events to run.

### 3. Setting Event Delimiter:

DELIMITER $<span class="math-inline">\: This line temporarily changes the statement delimiter from the default semicolon (`;`) to double dollar signs (``). This is necessary because events themselves can contain semicolons, so this change helps the database parser correctly identify the boundaries of the event definition.

### 4. Creating the Event:

- CREATE EVENT yearly_delete_stale_audit_rows: This line initiates the creation of a new event with the specified name.
**ON SCHEDULE EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01': This section defines the event's schedule**:
- It will execute once every year.
- It will commence on January 1st, 2019.
- It will cease execution after January 1st, 2029.
- DO BEGIN ... END $$: This block encloses the actions that the event will perform when triggered.
### 5. Deleting Stale Audit Rows:

**DELETE FROM payments_audit WHERE action_date < NOW() - INTERVAL 1 YEAR;: This SQL statement comprises the heart of the event's actions**:
- It targets the payments_audit table.
- It removes rows where the action_date is older than one year prior to the current time (NOW()).
- This effectively purges outdated audit records.
### 6. Resetting Delimiter:

*DELIMITER ;*: This line reverts the statement delimiter back to the default semicolon, indicating the completion of the event definition.

## Key Points:

- The event is named yearly_delete_stale_audit_rows, accurately reflecting its purpose.
- It's designed to execute annually between 2019 and 2029.
Its primary function is to maintain the payments_audit table by removing records that are over a year old, likely to optimize storage and potentially enhance performance.








#     p84-viewing_and_dropping_events.sql



```sql
SHOW EVENTS;
SHOW EVENTS LIKE 'yearly%';

-- enable/disable an event.
ALTER EVENT yearly_delete_stale_audit_rows ENABLE;
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;

DELIMITER $$

-- update the event.
ALTER EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
    AT '2029-05-01 10:00:00'
DO BEGIN
    DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;

DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;

Error Code: 1589. Event execution time is in the past and ON COMPLETION NOT PRESERVE is set. The event was not changed. Specify a time in the future.



```


## Explaination;

Here's a breakdown of the processes involved in the code, along with explanations for the error and potential fixes:

### 1. Viewing Events:

- SHOW EVENTS; lists all events in the database.
- SHOW EVENTS LIKE 'yearly%'; filters events whose names start with "yearly".
### 2. Managing Event State:

- ALTER EVENT yearly_delete_stale_audit_rows ENABLE; enables the event, allowing it to execute.
- ALTER EVENT yearly_delete_stale_audit_rows DISABLE; disables the event, preventing its execution.

### 3. Attempting to Update Event:

- DELIMITER $$ and DELIMITER ; change the statement delimiter temporarily, allowing for multi-line statements.
- ALTER EVENT yearly_delete_stale_audit_rows attempts to modify the event's schedule and action.
- ON SCHEDULE AT '2029-05-01 10:00:00' sets a new execution time in the past (error source).
- DO BEGIN ... END $$ encloses the action to be performed (deleting old audit rows).
### 4. Error Encountered:

- *Error Code*: 1589 indicates that the specified execution time is in the past, and the event won't be updated due to its completion behavior (ON COMPLETION NOT PRESERVE).
### 5. Deleting Event (Not Executed):

DROP EVENT IF EXISTS yearly_delete_stale_audit_rows; would delete the event, but it's not executed due to the error.
 **Potential Fix**:

- Specify a future execution time: Change '2029-05-01 10:00:00' to a date and time in the future.
- Consider ON COMPLETION PRESERVE: If you want the event to persist after execution, change its completion behavior.

**Recommendations**:

- Double-check execution times for scheduled events.
- Review completion behavior for events that need to run repeatedly.
- Consider using version control for event definitions to track changes.