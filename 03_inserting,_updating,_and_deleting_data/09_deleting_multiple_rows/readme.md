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