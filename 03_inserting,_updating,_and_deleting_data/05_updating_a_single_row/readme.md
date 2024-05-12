### Updating a Single Row

- Updating a single row in a database involves modifying the data of an existing record in a table. This is typically done using the `UPDATE` statement in SQL. When you update a single row, you're changing the values of one or more columns for that specific row while leaving the other rows unchanged.

- Here's the basic syntax for updating a single row in SQL:-

```sql
USE sql_store;
UPDATE customers 
SET first_name="Muhammad", last_name="Hashim", birth_date="2023-12-30"
WHERE customer_id = 1;
```

* `table_name`: The name of the table containing the row you want to update.
* `column1, column2, ...`: The columns you want to update.
* `new_value1, new_value2, ...`: The new values you want to set for the specified columns.
* `WHERE condition`: The condition that identifies the row(s) to be updated. If omitted, all rows in the table will be updated.
<hr>

<img src = './assets/update-single.gif'>

<hr>
