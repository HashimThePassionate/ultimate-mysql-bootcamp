### Inserting a Row

- *INSERT INTO*: This adds new rows to a table.
- Inserting a row in SQL means adding a new record to a table within a database. It's one of the fundamental operations in database management and is  typically done using the INSERT INTO statement. Here's a basic syntax:

```sql
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES (107, 'Backpack', 'Accessories', 50.00, 80);
```
- Executing this SQL statement would insert a new row into the employees table with the specified values in the corresponding columns.

* `table_name`: The name of the table where you want to insert the data.
* `(column1, column2, column3, ...)`: The columns in the table where you want to insert the data.
* `VALUES`: The keyword indicating that the values for the specified columns will be provided.
* `(value1, value2, value3, ...)`: The actual values you want to insert into the specified columns.

<img src='./images/insert-single.PNG'></img>



### INSERT Multiple Rows

- Inserting multiple rows in SQL allows you to add more than one record to a table in a single SQL statement. This is often more efficient than executing multiple INSERT statements for each row individually.

- You can insert multiple rows using the same `INSERT INTO` statement by providing multiple sets of values in the `VALUES` clause, separated by commas. Here's the syntax:

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES 
    (1, 'John', 'Doe', 'Finance', 50000.00),
    (2, 'Jane', 'Smith', 'Marketing', 55000.00),
    (3, 'Alice', 'Johnson', 'Human Resources', 48000.00),
    (4, 'Bob', 'Williams', 'IT', 60000.00);
```

- Each set of values in the `VALUES` clause corresponds to a new row to be inserted into the table. The values within each set must match the order and data types of the columns specified in the `INSERT INTO` statement.

- Executing this SQL statement will insert three new rows into the employees table, each with the specified values for EmployeeID, FirstName, LastName, Department and Salary.

<img src='./images/insert result.PNG'>



### INSERT Hierarchical Rows

- Inserting hierarchical data in SQL typically refers to the process of inserting records into a table where there's a parent-child relationship among the records, creating a hierarchical structure. This is commonly done in scenarios like organizational charts, file systems, or product categories where each record (child) is associated with another record (parent).

```sql
INSERT INTO customers(customer_id,first_name,last_name,birth_date)
VALUES (DEFAULT,'IGI','ORIGIN','2023-12-25');

INSERT INTO orders(order_id,order_date, status,customer_id)
VALUES(DEFAULT,'2023-12-25',1,LAST_INSERT_ID());

INSERT INTO orders_items(order_id,product_id,unit_price,quantity)
VALUES (LAST_INSERT_ID(),9,35,3);
```

- Executing these SQL statements would insert hierarchical data into the table.



### Creating Copy of a Table

- Creating a copy of a table in a database essentially duplicates the structure and data of the original table, resulting in a new table with identical schema and contents. This operation is commonly used for various purposes such as backup, data migration, or performing experimental changes without affecting the original table.

- When you create a copy of a table, you essentially replicate both the structure (columns, data types, constraints, etc.) and the data itself. This means that the new table will have the same columns, indexes, and constraints as the original table, and it will contain a copy of all the rows from the original table at the time the copy was made.

- Here's how you typically create a copy of a table in SQL:

```sql
CREATE TABLE new_table_name AS
SELECT *
FROM original_table_name;
```

* `new_table_name`: The name of the new table that will be created as a copy of the original table.
* `original_table_name`: The name of the existing table that you want to copy.

- This statement creates a new table (`new_table_name`) with the same structure and data as the original table (`original_table_name`). All columns and rows from the original table are copied to the new table.



### Updating a Single Row

- Updating a single row in a database involves modifying the data of an existing record in a table. This is typically done using the UPDATE statement in SQL. When you update a single row, you're changing the values of one or more columns for that specific row while leaving the other rows unchanged.

- Here's the basic syntax for updating a single row in SQL:

```sql
UPDATE Products
SET Price = 45.00
WHERE ProductID = 101;
```

* `table_name`: The name of the table containing the row you want to update.
* `column1, column2, ...`: The columns you want to update.
* `new_value1, new_value2, ...`: The new values you want to set for the specified columns.
* `WHERE condition`: The condition that identifies the row(s) to be updated. If omitted, all rows in the table will be updated.

<img src='./images/update-single.PNG'>



### Updating Multiple Rows

- Updating multiple rows in a database involves modifying the data of multiple records in a table simultaneously. This is typically done using the `UPDATE` statement in SQL, where you can specify conditions to identify the rows to be updated.

- Here's the basic syntax for updating multiple rows in SQL:

```sql
UPDATE your_table_name
SET column1 = value1,
    column2 = value2, ...
WHERE condition;
```

* `table_name`: The name of the table containing the rows you want to update.
* `column1, column2, ...`: The columns you want to update.
* `new_value1, new_value2, ...`: The new values you want to set for the specified columns.
* `WHERE condition`: The condition that identifies the rows to be updated. If omitted, all rows in the table will be updated.

- Updating multiple rows at once can be efficient and convenient, especially when you need to apply the same change to a group of records based on certain criteria.



### Using subqueries in Updates

- Using subqueries in SQL allows you to nest one query within another query. Subqueries can be used in various parts of a SQL statement, such as the `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statements, and they serve several purposes:

1. **Filtering Data**: Subqueries can be used in the WHERE clause to filter rows based on the results of another query. For example, you can retrieve all employees who earn more than the average salary.

2. **Generating Calculations**: Subqueries can be used to perform calculations or aggregate functions on the results of another query. For instance, you can calculate the total sales for a specific product category.

3. **Data Manipulation**: Subqueries can be used to manipulate data within a query. For example, you can update rows in a table based on the results of another query.

4. **Nested Queries**: Subqueries can be nested within each other, allowing for complex logic and data retrieval. You can have subqueries within subqueries to achieve more intricate data manipulations.

- Here's a basic example of using a subquery to filter data:

```sql
SELECT employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
);
```

- In this example, the inner query retrieves the department_id for the 'Sales' department from the departments table, and the outer query selects the names of employees who belong to the Sales department based on the department_id retrieved by the subquery.

- Subqueries are powerful tools in SQL that allow you to perform complex operations and retrieve data in a flexible and efficient manner. However, they should be used judiciously, as poorly optimized subqueries can impact performance.



### Deleting Single Row

- Deleting a single row in a database removes that specific record from the table. It's a straightforward operation, typically done using the `DELETE FROM` statement in SQL.

- Here's the basic syntax for deleting a single row in SQL:

```sql
DELETE FROM table_name
WHERE condition;
```

* `table_name`: The name of the table from which you want to delete the row.
* `WHERE condition`: The condition that identifies the row to be deleted. If omitted, all rows in the table will be deleted.

- It's important to use caution when deleting rows from a database, especially without specifying a condition. If you omit the `WHERE` clause, it will delete all rows from the table, which can lead to data loss if not intended. Always double-check your conditions before executing a delete operation to avoid unintended consequences.



### Deleting Multiple Rows

- Deleting multiple rows in a database removes multiple records from a table simultaneously. This is typically done using the `DELETE FROM` statement in SQL, where you can specify conditions to identify the rows to be deleted.

- Here's the basic syntax for deleting multiple rows in SQL:

```sql
DELETE FROM table_name
WHERE condition_1
   OR condition_2
   OR condition_3;
```

* `DELETE FROM table_name`: This part of the query specifies the table from which rows will be deleted. table_name should be replaced with the actual name of the table from which you want to delete rows.
* `WHERE condition_1 OR condition_2 OR condition_3`: This part of the query specifies the conditions that rows must meet to be deleted. The WHERE clause filters the rows based on these conditions before deleting them. In this query, multiple conditions are combined using the logical OR operator (OR). This means that if any of the conditions evaluate to true for a particular row, that row will be deleted.
* `condition_1, condition_2, condition_3`: These represent individual conditions that are evaluated against each row in the table. These conditions can involve comparisons, functions, or other logical expressions. If any of these conditions are true for a row, the row will be included in the deletion process.

- Deleting multiple rows at once can be efficient and convenient, especially when you need to remove a group of records based on certain criteria. However, as with deleting a single row, it's important to use caution and double-check your conditions before executing a delete operation to avoid unintended consequences or data loss.



### Restoring the Databases

- Restoring a database refers to the process of recovering or rebuilding a database to a previous state or version. This typically involves taking a backup of a database and then restoring it in case of data loss, corruption, or other issues.

**Here's what restoring a database typically involves:**

1.**Backup**: Before restoring a database, it's crucial to have a backup of the database in a stable state. Backups can be full backups (containing the entire database), differential backups (containing only changes since the last full backup), or transaction log backups (containing changes since the last backup).

2.**Restore**: Restoring a database involves taking the backup file and applying it to the database management system to recreate the database as it was when the backup was taken. This process recreates the database structure, tables, indexes, and data.

3.**Point-in-Time Recovery**: In some cases, you might want to restore a database to a specific point in time, rather than just using the latest backup. This is often done for recovering from specific incidents or data corruption issues. Point-in-time recovery typically involves restoring a full backup and then applying transaction log backups up to the desired recovery point.

4.**Validation**: After restoring the database, it's essential to validate the integrity and consistency of the data to ensure that the restore operation was successful. This might involve running data consistency checks, verifying that all required data is present, and performing any necessary reconciliation steps.

- Overall, restoring a database is a critical operation in database management, allowing organizations to recover from data loss or corruption and ensure business continuity. It's essential to have robust backup and restore procedures in place to handle potential emergencies effectively.

- The SQL syntax can vary depending on the database management system (DBMS) you're using.

- For example, in Microsoft SQL Server, you would typically use the `RESTORE DATABASE` statement to restore a database from a backup file. Here's a basic example:

```sql
RESTORE DATABASE YourDatabaseName
FROM disk = 'C:\YourBackupFile.bak'
WITH REPLACE,
MOVE 'LogicalDataFileName' TO 'C:\YourDataFiles.mdf',
MOVE 'LogicalLogFileNamelog' TO 'C:\YourLogFiles.ldf';
```

- Explanation:

* `YourDatabaseName`: The name of the database you want to restore.
* `C:\YourBackupFile.bak`: The file path to the backup file.
* `WITH REPLACE`: This option is used to overwrite the existing database with the backup. Be careful, as this can overwrite existing data.
* `MOVE 'LogicalDataFileName' TO 'C:\YourDataFiles.mdf'`: Specifies the new file location for the data file.
* `MOVE 'LogicalLogFileNamelog' TO 'C:\YourLogFiles.ldf'`: Specifies the new file location for the log file.

- In MySQL, the syntax would be different. You would typically use the `mysql` command-line client or a similar tool to restore a database from a backup file. Here's a basic example of how you might do it:

```bash
mysql -u username -p YourDatabaseName < /path/to/your/backup/file.sql
```

- This command executes SQL commands stored in the backup file and applies them to the specified database.

- Keep in mind that these are just basic examples, and the actual SQL query or command you use for database restoration will depend on your specific DBMS and backup strategy. Make sure to consult the documentation for your DBMS for detailed instructions on how to perform database restoration.
