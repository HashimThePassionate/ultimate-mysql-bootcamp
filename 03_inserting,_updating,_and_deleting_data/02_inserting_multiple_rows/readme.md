### INSERT Multiple Rows

- Inserting multiple rows in SQL allows you to add more than one record to a table in a single SQL statement. This is often more efficient than executing multiple INSERT statements for each row individually.

- You can insert multiple rows using the same `INSERT INTO` statement by providing multiple sets of values in the `VALUES` clause, separated by commas. Here's the syntax:

```sql
INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    birth_date,
    phone,
    address,
    city,
    state,
    points
) VALUES (
    53,
    'Ishaque',
    'Chaiwala',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Sindh',
    DEFAULT
),
(
    54,
    'Muhammad',
    'Mowahid',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Punjab',
    DEFAULT
);
```

- Each set of values in the `VALUES` clause corresponds to a new row to be inserted into the table. The values within each set must match the order and data types of the columns specified in the `INSERT INTO` statement.

- Executing this SQL statement will insert three new rows into the employees table, each with the specified values for EmployeeID, FirstName, LastName, Department and Salary.
