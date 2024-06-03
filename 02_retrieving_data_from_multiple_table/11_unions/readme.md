## The Unions

**Introduction**

- `Unions` in SQL are used to combine the results of two or more SELECT queries into a single result set. 
- The `UNION Operator` eliminates duplicate rows from the combined result set. 
- It's a powerful tool for combining data from different tables or views that have the same structure.

## Syntax

```sql
SELECT 
order_id,
order_date,
'Active' AS status
FROM orders
WHERE order_date >= '2023-11-09'
UNION
SELECT 
order_id,
order_date,
'Archived' AS status
FROM orders
WHERE order_date < '2023-11-09';
```

- `Orders` and `Orders`: The tables or views whose results you want to combine.
- `order_id` and `order_date`: The columns you want to select from each table or view.
- `UNION`: Combines the result sets of the preceding and following SELECT statements. It eliminates duplicate rows by default.
- `ALL (optional)`: Includes duplicate rows in the combined result set.

## Additional Notes:
- The number of columns selected in each SELECT statement within the UNION must be the same, and the data types must be compatible.
- `UNION` removes duplicate rows by default. If you want to include duplicate rows, you can use the UNION ALL operator.
- The order of rows in the combined result set may vary unless you use the ORDER BY clause to specify a consistent ordering.
- You can union together the results of any number of SELECT queries, as long as they have the same number of columns and compatible data types.
- `UNIONs` can be used to combine results from tables with similar structures, such as different partitions of the same table or different tables with the same schema.



