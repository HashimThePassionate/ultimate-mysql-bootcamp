## Outer JOINS

**Introduction**

- `Outer Joins` are a type of join operation in SQL that includes rows from one or both tables even if there are no matching values in the joined columns.
-  This is particularly useful when you want to include all rows from one table, regardless of whether they have a matching row in the other table.
- There are three main types of outer joins: `LEFT OUTER JOIN`, `RIGHT OUTER JOIN`, and `FULL OUTER JOIN`. 


1. **LEFT OUTER JOIN**:
- Returns all rows from the left table (the first table specified in the JOIN clause), and the matched rows from the right table (the second table specified in the JOIN clause).
- If there's no match, NULL values are returned for columns from the right table.

## Syntax

```sql
SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;
```
- `Left Outer Join` select those records which are not.
- Like in our example we also select those customers who don't have any order as well as who do.

2.**RIGHT OUTER JOIN**:
- Returns all rows from the right table (the second table specified in the JOIN clause), and the matched rows from the left table (the first table specified in the JOIN clause).
- If there's no match, NULL values are returned for columns from the left table.

## Syntax

```sql
SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;
```

- `Right Outer Join`select those records which satisfy the condition.
- Like in our example we only select those customers who have orders.

## Additional Notes:

- `Outer Joins` are useful for including unmatched rows from one or both tables in the result set.
- When using outer joins, be mindful of NULL values that may appear in columns from the table without a match.
- Choose the appropriate type of outer join based on your specific requirements for including unmatched rows.



















