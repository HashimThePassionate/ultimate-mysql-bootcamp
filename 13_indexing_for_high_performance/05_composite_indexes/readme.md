##  Composite Index:

A composite index, also known as a compound index, is an index created on multiple columns in a database table. Unlike a single-column index that indexes values from a single column, a composite index indexes values from multiple columns concatenated together. This allows queries to efficiently filter, sort, and search based on combinations of values from these columns

```sql
use sql_store;
CREATE INDEX id_points ON customers(points);
SHOW INDEXES IN customers;
CREATE INDEX idx_state_points ON customers (state,points);
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' and points> 1000;
DROP INDEX idx_state_points ON customers;
```

### Query Explanation

1. **Scan Type:** Index Scan
   - **Description:** The query is using an index scan to retrieve rows from the `customers` table.
   - **Index Used:** `idx_state_points` (Composite index on the `state` and `points` columns)
   - **Rows:** The number of rows scanned using the index.

2. **Filter**
   - **Description:** The `state = 'CA' and points > 1000` condition is applied as a filter after the index scan.
   - **Description:** This filter condition is applied to each row retrieved using the composite index to select only those rows where the `state` column matches 'CA' and the `points` column is greater than 1000.
