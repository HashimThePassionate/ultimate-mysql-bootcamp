# p69-creating_a_stored_procedure.sql

```sql
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

```

## Explaination;

### 1. Selecting a Database:

USING sql_invoicing; tells the database system to use the database named sql_invoicing for subsequent commands. This ensures that the procedure is created within the intended database.

### 2. Changing the Statement Delimiter:

DELIMITER $<span class="math-inline">\ temporarily changes the statement delimiter from the default semicolon (`;`) to double dollar signs (``). This is necessary because the procedure body itself contains semicolons, and we need a way to signal the end of the entire procedure definition.

### 3. Creating the Stored Procedure:

- CREATE PROCEDURE get_invoices_with_balance() starts the definition of a stored procedure named get_invoices_with_balance. It doesn't take any input parameters.
- BEGIN marks the beginning of the procedure's body, containing the SQL statements to be executed when the procedure is called.

### 4. Retrieving Invoices with Outstanding Balances:

SELECT *, invoice_total - payment_total AS balance FROM invoices WHERE invoice_total - payment_total > 0; is a SQL SELECT statement that retrieves the following:
- All columns (*) from the invoices table
- A calculated column named balance, which represents the difference between the invoice_total and payment_total columns
Only those rows where the balance is greater than 0 (meaning there's an outstanding payment)

### 5. Ending the Procedure and Resetting the Delimiter:

- END $$ marks the end of the procedure definition.
- DELIMITER ; resets the statement delimiter back to the default semicolon.







# p72-parameters.sql

```sql
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client(client_id INT)
BEGIN
    SELECT
       *
    FROM
        invoices i
    WHERE
        i.client_id = client_id;
END $$
DELIMITER ;

CALL get_invoices_by_client(1);

```

## Explaination;

### 1. Database Selection:

USE sql_invoicing;
Instructs the database system to use the database named sql_invoicing for subsequent commands.

### 2. Procedure Removal (if it exists):

DROP PROCEDURE IF EXISTS get_invoices_by_client;
Checks if a procedure named get_invoices_by_client already exists in the database.
If it does, it's removed to avoid conflicts.

### 3. Delimiter Setting:

DELIMITER $<span class="math-inline">\ - Temporarily changes the statement delimiter from the semicolon (`;`) to double dollar signs (``).
This is necessary because the procedure's body contains semicolons within its code, and we need to distinguish them from the end of the procedure definition.

### 4. Procedure Creation:

CREATE PROCEDURE get_invoices_by_client(client_id INT)
Creates a new procedure named get_invoices_by_client with an input parameter named client_id of type INT (integer).

### 5. Procedure Body:

- BEGIN
- Marks the start of the procedure's code block.
- SELECT * FROM invoices i WHERE i.client_id = client_id;
This SQL query is the heart of the procedure:
- It selects all columns (*) from the invoices table, using the alias i for convenience.
- It filters the results to only include invoices where the client_id in the invoices table matches the client_id input parameter passed to the procedure.
- END $$
- Marks the end of the procedure's code block.

### 6. Delimiter Reset:

DELIMITER ;
Resets the statement delimiter back to the semicolon (;) for normal SQL execution.

### 7. Procedure Execution:

- CALL get_invoices_by_client(1);
- Calls the newly created procedure, passing the value 1 as the client_id parameter.
- This executes the query within the procedure, retrieving all invoices associated with client ID 1.







# p73-parameters_with_default_value.sql

```sql
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER $$
CREATE PROCEDURE get_payments(client_id INT,
                              payment_method_id TINYINT)
BEGIN
    SELECT
        *
    FROM payments p
    WHERE
        p.client_id = IFNULL(client_id, p.client_id)
        AND p.payment_method = IFNULL(payment_method_id, p.payment_method);
END $$
DELIMITER ;

CALL get_payments(NULL, NULL);
CALL get_payments(1, NULL);

```
## Explaination;

### 1. Database Selection:

USE sql_invoicing; tells the database system to use the database named "sql_invoicing" for subsequent operations.

### 2. Procedure Creation:

- DROP PROCEDURE IF EXISTS get_payments; removes any existing procedure named "get_payments" to avoid conflicts.
- DELIMITER $<span class="math-inline">\ changes the statement delimiter from the default semicolon (`;`) to double dollar signs (``) to allow for multi-line procedures.
 CREATE PROCEDURE get_payments(client_id INT, payment_method_id TINYINT) creates a new procedure named "get_payments" that accepts two parameters:
- client_id: An integer representing the client ID.
- payment_method_id: A tiny integer representing the payment method ID.

### 3. Procedure Body:

- BEGIN marks the start of the procedure's executable code.
- SELECT * FROM payments p WHERE p.client_id = IFNULL(client_id, p.client_id) AND p.payment_method = IFNULL(payment_method_id, p.payment_method); performs the following:
- Selects all columns (*) from the "payments" table, aliasing it as "p".
Filters the results based on:
- p.client_id: Matches either the provided client_id or any value if client_id is NULL (using IFNULL).
- p.payment_method: Matches either the provided payment_method_id or any value if payment_method_id is NULL (using IFNULL).
- END $$ marks the end of the procedure's code.
- DELIMITER ; restores the default statement delimiter back to semicolon.

### 4. Procedure Calls:

- CALL get_payments(NULL, NULL); executes the procedure without specifying any client ID or payment method ID, retrieving all payments from the table.
- CALL get_payments(1, NULL); executes the procedure with a client ID of 1, retrieving payments for that client regardless of payment method.
