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

Suppose you have a table called `clients` with columns `id`, `name`, and `state`, and you want to create a stored procedure to retrieve clients based on a specific state.

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

### `Example2:`

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

CALL get_clients_by_default_states(NULL)
CALL get_clients_by_default_states('CA')
