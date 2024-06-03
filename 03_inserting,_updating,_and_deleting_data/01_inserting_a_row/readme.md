### Inserting a Row

- *INSERT INTO*: This adds new rows to a table.
- Inserting a row in SQL means adding a new record to a table within a database. It's one of the fundamental operations in database management and is  typically done using the INSERT INTO statement. Here's a basic syntax:-

```sql
USE sql_store;
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
    11,
    'Ahmed',
    'Raheem',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'MA',
    DEFAULT
);
```
- Executing this SQL statement would insert a new row into the employees table with the specified values in the corresponding columns.

* `table_name`: The name of the table where you want to insert the data.
* `(column1, column2, column3, ...)`: The columns in the table where you want to insert the data.
* `VALUES`: The keyword indicating that the values for the specified columns will be provided.
* `(value1, value2, value3, ...)`: The actual values you want to insert into the specified columns.

**This code will insert new row to a table.**
<hr>

<img src='./assets/insert_single_record.gif'>

<hr>