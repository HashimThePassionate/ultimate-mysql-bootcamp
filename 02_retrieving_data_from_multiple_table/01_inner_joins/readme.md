## INNER Joins

**Introduction**

- `Inner Joins` are a fundamental concept in relational database management systems (RDBMS) and are used to 
 combine rows from two or more tables based on a related column between them.
- The result of an `Inner Join` contains only the rows that have matching values in both tables according to  the specified condition.

## Syntax

```sql
SELECT order_id, orders.customer_id first_name, phone, city 
FROM orders 
INNER JOIN customers
ON  
orders.customer_id  = customers.customer_id;
```

- `SELECT Statement`: Specifies the columns you want to retrieve from the resulting joined table.
- `Customers` and `Orders`: are the tables you want to join.
- `INNER JOIN`: specifies the type of join you're performing.
- `ON`: specifies the condition for joining the tables. It specifies which columns from each table are used for the join operation.

## How to select one table with relationship to another table using `INNER JOIN`

```sql
SELECT * 
FROM orders 
INNER JOIN customers
ON orders.customer_id  = customers.customer_id;
```

- If we have orders table in orders table we have customer_id which is a foriegn key to customer table.
- In Orders table we have orders_id, customer_id, status, comments.
- In Customer table we have customer_id, first_name, last_name, birth_date, phone, address, city and state.
- We want to `Inner Join` with orders table and customer table.

## We can also use `Alias` in `Inner Join`

```sql
SELECT order_id, o.customer_id first_name, phone, city 
FROM orders o
INNER JOIN customers c
ON 
o.customer_id  = c.customer_id;
```
