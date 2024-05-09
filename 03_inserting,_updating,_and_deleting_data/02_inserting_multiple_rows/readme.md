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


**This query will add multiple rows to a table.**

<img src='./image/insert result.PNG'>

