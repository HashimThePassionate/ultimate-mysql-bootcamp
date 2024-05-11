# Store Procedure

### `What is a Stored Procedures:`

A **stored procedure** in a database is like a recipe or a set of instructions. It allows you to store a sequence of database operations that can be reused whenever needed. Instead of writing the same instructions repeatedly, you can save them as a stored procedure and execute them with a single command. This helps make database operations more efficient and easier to manage.

#### **_`For Example:`_**

Imagine you have a recipe for your favorite chocolate chip cookies. Instead of rewriting the recipe every time you want to bake cookies, you can store it in a recipe book. That way, you can easily find it and follow the instructions whenever you have a craving.

---

### `why we use Store Prodcedure:`

1. **Code Reusability**: Instead of writing the same SQL code repeatedly in different parts of your application, you can write it once in a stored procedure and then call the procedure wherever needed.

2. **Improved Performance**: Stored procedures are precompiled and stored in the database. This can lead to better performance compared to executing the same SQL statements dynamically from your application.

3. **Security**: Using stored procedures can enhance security by allowing you to grant permissions at the procedure level rather than on the underlying tables. This can help protect your data from unauthorized access.

4. **Reduced Network Traffic**: Since the stored procedure is executed on the database server, only the procedure call needs to be sent over the network, reducing the amount of data transferred.

5. **Encapsulation of Business Logic**: Stored procedures can encapsulate complex business logic, making it easier to manage and maintain your application code.

6. **Ease of Maintenance**: If you need to modify a query or logic in your application, you only need to update the stored procedure rather than making changes in multiple places in your code.

---

### `Advantage of Store Procedure:`

| **_`Advantage`_**        | **_`Description`_**                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------------- |
| Structured Data Storage  | Tables provide a structured way to store data, making it easy to organize and retrieve information.           |
| Efficient Data Retrieval | Using tables allows for efficient retrieval of data through SQL queries, especially with proper indexes.      |
| Data Integrity           | Tables can enforce data integrity through constraints like primary keys, foreign keys, and check constraints. |
| Flexibility              | Tables can store different types of data and allow for complex relationships between data entities.           |
| Reduced Network Traffic  | Send only the procedure name, not the entire set of instructions.                                             |

---

### `Disadvantage of Store Procedure:`

<<<<<<< HEAD
| **Disadvantage**     | **Description**                                                                   |
| -------------------- | --------------------------------------------------------------------------------- |
| Increased Complexity | Debugging and troubleshooting procedures can be more complex than simple queries. |
| Development Time     | Initial creation of procedures takes extra time compared to a single query.       |
| Vendor Dependence    | Procedures may not be portable across different database systems.                 |
=======
---

### `Creating a Stored Procedure in MySQL Workbench:`

1. **Open MySQL Workbench** and connect to your database server.

2. **Select the Database:** In the navigation pane on the left, click on the schema (database) where you want to create the stored procedure.

3. **Open SQL Editor:** Click on the "SQL Editor" tab in the main window.

4. **Write the Procedure:** Enter the SQL code for your stored procedure. For example, to create a simple procedure that selects all records from a table called `my_table`:

   ```sql
   DELIMITER //
   CREATE PROCEDURE simple_proc()
   BEGIN
       SELECT * FROM my_table;
   END //
   DELIMITER ;
   ```

5. **Execute the SQL Code:** Click the lightning bolt icon or press `Ctrl + Enter` to execute the SQL code. If successful, you should see a message indicating that one row was affected.

6. **Call the Procedure:** To call the stored procedure, use the following SQL code:

   ```sql
   CALL simple_proc();
   ```

   This will execute the `simple_proc` procedure and return the result set.

7. **Modify as Needed:** Modify the stored procedure code to perform more complex operations as required.

---
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
---
![[Helpful video]](https://raw.githubusercontent.com/Hassansahi1122/ultimate-mysql-bootcamp/main/08_stored_procedures/video/MySQL%20Workbench%202024-05-09%2022-45-54.gif)]

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
>>>>>>> d823fb9e5429b21543a6215711acad129dab7af8
