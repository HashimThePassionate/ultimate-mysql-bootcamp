##  When indexes are ignored??:
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE state = 'CA' 
OR 
points > 1000;
```

**Scan Type: Full Table Scan**
*   **Description:** The query is performing a full table scan instead of utilizing any indexes.
Reason: Because the WHERE clause combines conditions using OR, which makes it difficult for the database to efficiently use indexes.

*   **Optimization:**One approach to optimize this query is to create separate indexes for each condition and then use UNION to combine the results.
How to optimize this query? lets create a separte index and than apply union

```sql
CREATE INDEX idx_points ON customers(points);
```
Now apply again:
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE state = 'CA' 
UNION 
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE points > 1000;
```

**Scan Type: Using Index**
*   **Description:** After creating a separate index on points, the query utilizes the index for the second part of the condition.
*   **Union:** The results from both queries are combined using UNION.

### Another Example:
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE points + 10 > 2010;
```
**Scan Type: Full Index Scan**
-   **Description:** The query is performing a full index scan instead of utilizing any indexes efficiently.
-   **Reason:** The expression points + 10 makes it challenging for the database to use indexes effectively.
-   **Optimization:** To optimize this query, rewrite the condition to allow the database to use indexes more efficiently.
Query 5:

This is searching FULL indexes so to fix,

```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE points > 2000;
```

**Scan Type: Using Index**
-   **Description:** After rewriting the condition to a simple inequality comparison, the query efficiently uses the index on the points column.