### Viewing Indexes:
```sql
CREATE INDEX idx_state ON customers (state);
EXPLAIN SELECT customer_id FROM customer where state = 'CA';
```
### Query Explanation
1. **Scan Type:** Index Scan
   - **Description:** The query is using an index scan to retrieve rows from the `customers` table.
   - **Index Used:** `idx_state` (Index on the `state` column)
   - **Rows:** The number of rows scanned using the index.

2. **Filter**
   - **Description:** The `state = 'CA'` condition is applied as a filter after the index scan.
   - **Description:** This filter condition is applied to each row retrieved using the index to select only those rows where the `state` column matches 'CA'.
