### `Example1:`

**Stored Procedure with Parameters:**

- Suppose you have a table called `clients` with columns `id`, `name`, and `state`, and you want to create a stored procedure to retrieve clients based on a specific state.

```sql
DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state
    (
        IN p_state CHAR(2) -- Input parameter: State code
    )
    BEGIN
        SELECT * FROM clients c
        WHERE c.state = p_state;
    END$$
DELIMITER ;
```

**Calling the Procedure:** To call the stored procedure and retrieve clients from the state of California ('CA'), you would use the following SQL code:

```sql
CALL get_clients_by_state('CA');
```


![[Helpful video]](https://github.com/Hassansahi1122/ultimate-mysql-bootcamp/blob/main/08_stored_procedures/video/storeprocedure.gif)

---

### `Example2:`

- Suppose you have a table called clients with columns id, name, and state, and you want to create a stored procedure to retrieve clients based on a specific state. If no state is provided, the procedure should return all clients.

```sql
DELIMITER $$
CREATE PROCEDURE get_clients_by_default_states
	(
        state CHAR(2)
        )
	BEGIN
    IF state IS NULL THEN
        select * from clients;
    ELSE
            SELECT * FROM clients c
            WHERE c.state = state;
    END IF;
	END$$
DELIMITER ;
```

**Calling the Procedure:** To call the stored procedure and retrieve clients without specifying a state (i.e., all clients), you would use the following SQL code:

```
CALL get_clients_by_default_states(NULL)
```

To retrieve clients from a specific state (e.g., California 'CA'), you would use:

```
CALL get_clients_by_default_states('CA')
```

---

### `Stored Procedure with Input Validation:`

**Example 3:**

- Suppose you have a table called `invoices` with columns `invoice_id`, `payment_total`, and `payment_date`, and you want to create a stored procedure to update payment details for a specific invoice. However, you want to ensure that the payment amount is valid (greater than 0) before updating the record.

```sql
DROP PROCEDURE IF EXISTS make_validate_payments;
DELIMITER $$
CREATE PROCEDURE make_validate_payments
    (
        IN p_invoice_id INT,
        IN p_payment_total DECIMAL(8,2),
        IN p_payment_date DATE
    )
BEGIN
    IF p_payment_total <= 0 THEN
        SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = "Invalid Payment Amount";
    END IF;
    UPDATE invoices i
    SET
    i.payment_total = p_payment_total,
    i.payment_date = p_payment_date
    WHERE i.invoice_id = p_invoice_id;
END$$
DELIMITER ;
```

**Calling the Procedure:** To call the stored procedure and update the payment details for a specific invoice (e.g., invoice_id = 2), you would use the following SQL code:

```sql
CALL make_validate_payments(2, 123.45, '2023-01-07');
```

---

### `Stored Procedure with Output Parameters:`

**Example 4:**

- Suppose you have a table called `invoices` with columns `invoice_id`, `client_id`, `invoice_total`, and `payment_total`, and you want to create a stored procedure to retrieve the count and total amount of unpaid invoices for a specific client.

```sql
DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_clients;
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_clients
    (
        IN p_client_id INT,
        OUT p_invoices_count INT,
        OUT p_invoices_total DECIMAL(9,2)
    )
BEGIN
    SELECT COUNT(*), SUM(invoice_total)
    INTO p_invoices_count, p_invoices_total
    FROM invoices i
    WHERE i.client_id = p_client_id
    AND i.payment_total = 0;
END$$
DELIMITER ;
```

**Calling the Procedure:** To call the stored procedure and retrieve the count and total amount of unpaid invoices for a specific client (e.g., client_id = 3), you would use the following SQL code:

```sql
CALL get_unpaid_invoices_for_clients(3, @invoices_count, @invoices_total);
SELECT @invoices_count AS invoices_count, @invoices_total AS invoices_total;
```

**output**:

```
-----------------------------------
|   COUNT(*)   SUM(invoice_total) |
|   2          286.08             |
-----------------------------------
```

---

### `Stored Procedure with Local Variables:`

**Example 5:**

- Suppose you have a table called `invoices` with columns `invoice_id` and `invoice_total`, and you want to create a stored procedure to calculate a risk factor based on the total amount and count of invoices.

```sql
DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
    DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;

    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;

    SET risk_factor = invoices_total / invoices_count * 5;

    SELECT risk_factor;
END$$
DELIMITER ;
```

**Calling the Procedure:** To call the stored procedure and calculate the risk factor based on the total amount and count of invoices, you would use the following SQL code:

```sql
CALL get_risk_factor();
```

**output:**

```
----------------
|  risk_factor |
|   777.75     |
----------------

```
