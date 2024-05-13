##  Using Indexes For Sorting:
lets check the indexes and then sort by ASC
```sql
SHOW INDEXES IN customers;
EXPLAIN 
SELECT customer_id 
FROM customers 
ORDER BY state; 
SHOW STATUS LIKE 'last_query_cost';
```
Lets check the cost of previous query!

Now lets check first_name which is not in indexes
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
ORDER BY first_name; 
SHOW STATUS LIKE 'last_query_cost';
```
Why cost is so high? because first_name is not indexes, when we put a column in indexes, mysql will automatically sort it in ASC and store it parmanent.
Now first_name is not in indexes so why mysql find? mysql uses filesort algorithm  which is very expensive.
**Here's how it works:**
*   Query Execution: When a query is executed, MySQL first retrieves the rows that match the WHERE clause.
*   Sorting: If the query has an ORDER BY clause and there's no suitable index to perform the sorting efficiently, MySQL resorts to the filesort algorithm. It sorts the result set based on the specified columns.
*   Temporary File: As MySQL sorts the result set, it may need to write intermediate results to a temporary file on disk if the result set is too large to fit into memory. This temporary file is used to store portions of the result set that can't be held in memory at once.
*   Merging: Once all the rows are sorted and stored in the temporary file, MySQL performs a merge operation to combine the sorted portions into a single sorted result set.
*   Final Result: After merging, MySQL returns the sorted result set to the client.
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
ORDER BY state , points DESC; 
SHOW STATUS LIKE 'last_query_cost';
```
Why cost decreases again? because both were in indexes.
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
ORDER BY state ,first_name, points; 
SHOW STATUS LIKE 'last_query_cost';

-- --------------------------------------------------------
EXPLAIN 
SELECT customer_id 
FROM customers 
ORDER BY state DESC , points DESC; 
SHOW STATUS LIKE 'last_query_cost';
```