### Updating Multiple Rows

- Updating multiple rows in a database involves modifying the data of multiple records in a table simultaneously. This is typically done using the `UPDATE` statement in SQL, where you can specify conditions to identify the rows to be updated.

- Here's the basic syntax for updating multiple rows in SQL:-

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
