## The Using Clause

**Introduction**

- The `USING Clause` in SQL is used in conjunction with the JOIN operation to specify a single column that should be used for the join condition between two tables.
- It's an alternative to specifying join conditions using the ON clause and is particularly useful when the join condition involves only one column with the same name in both tables.
- The `USING Clause` simplifies the syntax and improves readability in such cases. 

## Syntax

```sql
SELECT 
o.order_id,
c.first_name
FROM orders o 
JOIN customers c
-- ON o.customer_id = c.first_name
USING (customer_id);
```

- `Orders` and `Customers`: The tables being joined.
- `customer_id`: The column shared between the two tables used for the join operation.

- The `USING Clause` can replace JOIN complex steps.
- But it can only work when both table have same column name.

## Additional Notes:

- The `USING Clause` can only be used when the join condition involves columns with the same name in both tables.
- It simplifies the syntax by automatically identifying the common column and implicitly performing the join operation based on that column.
- The `USING Clause` cannot be combined with other join conditions or used with columns that have different names in the joined tables.
- Use the `USING Clause` when the join condition is straightforward and involves only one common column, enhancing code readability and reducing verbosity.