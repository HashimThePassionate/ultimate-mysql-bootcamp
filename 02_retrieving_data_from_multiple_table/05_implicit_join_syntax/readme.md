## Implicit Join Syntax

**Introduction**

- `Implicit Join Syntax` also known as traditional join syntax or comma-separated join syntax, is an older method of joining tables in SQL.
- In this syntax, tables are listed in the FROM clause separated by commas, and join conditions are specified in the WHERE clause using equality operators.
- This syntax is less common in modern SQL, it's still supported by most database management systems and can be useful in certain scenarios. 

## Syntax

```sql
SELECT * 
FROM orders o, customers c 
WHERE o.customer_id  = c.customer_id;
```
`Orders`,`Customer`: The tables you are joining, listed in the FROM clause separated by commas.
`customer_id`: Columns used to establish the join conditions, specified in the WHERE clause.

## Additional Notes:

- `Implicit Join Syntax` is concise but can be less readable, especially for complex join conditions involving multiple tables.
- `Join Conditions` are specified in the WHERE clause, making it easy to overlook them, leading to potential errors.
- This syntax doesn't differentiate between different types of joins (e.g., INNER JOIN, LEFT JOIN). It implicitly performs an inner join based on the specified conditions.
- While explicit join syntax (using the JOIN keyword) is generally preferred for its clarity and maintainability, implicit join syntax can still be useful in specific scenarios, such as quick ad-hoc queries or when working with legacy code.
