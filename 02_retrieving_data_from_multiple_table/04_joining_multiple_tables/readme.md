## Joining Multiple Tables

**Imtroduction**

- Joining multiple tables in a relational database allows you to combine data from different sources based on related columns, enabling complex queries and comprehensive data analysis. 
- When joining multiple tables, you typically use primary and foreign key relationships to establish connections between the tables. 

## Syntax

```sql
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
```

- We have three tables orders, order_status and customer we want to join.

## Additional Notes:
- Always ensure that there are proper indexes on the columns used for joining to enhance query performance.
- Understand the relationships between tables to select the appropriate join type.
- Use table aliases for better readability, especially when dealing with multiple joins.
- Be cautious about Cartesian products (when you join tables without specifying join conditions), as they can lead to unexpected results and performance issues.
