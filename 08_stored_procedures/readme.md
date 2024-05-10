# Store Procedure
### `What is a Stored Procedures:`
A **stored procedure** in a database is like a recipe or a set of instructions. It allows you to store a sequence of database operations that can be reused whenever needed. Instead of writing the same instructions repeatedly, you can save them as a stored procedure and execute them with a single command. This helps make database operations more efficient and easier to manage.

#### ***`For Example:`***
Imagine you have a recipe for your favorite chocolate chip cookies.  Instead of rewriting the recipe every time you want to bake cookies, you can store it in a recipe book. That way, you can easily find it and follow the instructions whenever you have a craving.

---

### `Advantage of Store Procedure:`
|  ***`Advantage`***                | ***`Description`***                                                                                        |
|--------------------------|---------------------------------------------------------------------------------------------------|
| Structured Data Storage  | Tables provide a structured way to store data, making it easy to organize and retrieve information.|
|Efficient Data Retrieval | Using tables allows for efficient retrieval of data through SQL queries, especially with proper indexes.|
| Data Integrity           | Tables can enforce data integrity through constraints like primary keys, foreign keys, and check constraints.|
| Flexibility              | Tables can store different types of data and allow for complex relationships between data entities.|
| Reduced Network Traffic              | Send only the procedure name, not the entire set of instructions.|

---
### `Disadvantage of Store Procedure:`
| **Disadvantage**         | **Description**                                                                                   |
|--------------------------|---------------------------------------------------------------------------------------------------|
| Increased Complexity   | Debugging and troubleshooting procedures can be more complex than simple queries.|
| Development Time     |Initial creation of procedures takes extra time compared to a single query.|
| Vendor Dependence         | Procedures may not be portable across different database systems.|

---

### `Creating a Stored Procedure in MySQL Workbench`

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

