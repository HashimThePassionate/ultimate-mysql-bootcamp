## Outer Join Between Multiple Tables

**Introduction**

- Performing outer joins between multiple tables allows you to include all rows from one or more tables, even if there are no matching values in the joined columns. 
- This is particularly useful when dealing with complex data relationships across multiple tables.
- You can use combinations of `LEFT OUTER JOIN`, `RIGHT OUTER JOIN`, and `FULL OUTER JOIN` to achieve the desired result. 

## Syntax

```sql
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id

```

- `Customers`: The tables you are joining.
- `LEFT OUTER JOIN`or`RIGHT OUTER JOIN`: Specifies the type of outer join to perform.
- `Colume_name`: Columns used to establish the join conditions between the tables.

## Additional Notes:

- You can chain multiple outer joins together to include rows from multiple tables in the result set.
- Be cautious when using multiple outer joins, as they can produce large result sets and potentially affect query performance.
- Ensure that join conditions are specified correctly to achieve the desired data relationships between the tables.
- Test the query thoroughly to verify that the results are as expected, especially when dealing with complex data structures.
