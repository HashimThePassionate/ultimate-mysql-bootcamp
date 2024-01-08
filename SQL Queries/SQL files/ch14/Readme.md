# p137-creating_indexes.sql

```sql
-- Write a query to find customers with more than
-- 1000 points.

EXPLAIN SELECT customer_id FROM customers WHERE points > 1000;

-- id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra
-- '1', 'SIMPLE', 'customers', NULL, 'ALL', NULL, NULL, NULL, NULL, '1010', '33.33', 'Using where'

CREATE INDEX idx_points ON customers (points);
EXPLAIN SELECT customer_id FROM customers WHERE points > 1000;

--  id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra
-- '1', 'SIMPLE', 'customers', NULL, 'range', 'idx_points', 'idx_points', '4', NULL, '528', '100.00', 'Using where; Using index'
```
## Explaination;

### Without the index:

- **Full table scan**: The database engine scans every row in the customers table to find customers with points greater than 1000.
- **Filtering**: The engine applies the WHERE clause to filter out rows that don't meet the condition.
- **Result retrieval**: The engine retrieves the customer_id values from the matching rows and returns them as the query result.

### With the index (idx_points):

- **Index lookup**: The database engine uses the idx_points index to quickly locate the rows with points greater than 1000. This is much faster than scanning the entire table.
- **Range scan**: The engine efficiently scans only the relevant portion of the index, significantly reducing the number of rows it needs to examine.
- **Data retrieval**: The engine fetches the corresponding customer_id values from the table for the rows identified in the index.

### Key differences:

- Table scan vs. index lookup: The index allows the engine to skip the full table scan, which is the most time-consuming part of the query without the index.
- Filtering efficiency: The index also improves filtering efficiency by reducing the number of rows that need to be evaluated by the WHERE clause.
- Reduced data access: The engine accesses less data from the table when using the index, leading to faster query execution.

### In summary:

The index significantly improves query performance by enabling efficient row retrieval and filtering.
It's especially beneficial for queries that involve filtering and sorting on indexed columns.





# p140-full_text_indexes.sql

```sql
USE sql_blog;

SELECT
    *
FROM
    posts
WHERE
    title LIKE '%react redux%'
    OR body LIKE '%react redux%';

CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('react redux');

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE);

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE);

-- MATCH must contain all columns in full-text index.

```
## Explaination;

### 1. Selecting a Database:

USE sql_blog;: This line tells the database server to work within the database named sql_blog.

### 2. Basic Text Search (Without Full-Text Index):

SELECT * FROM posts WHERE title LIKE '%react redux%' OR body LIKE '%react redux%';: This query searches for posts that contain the phrase "react redux" either in the title or the body.
It uses the LIKE operator with wildcards (%) to match patterns within text.
However, this approach might be less efficient for large datasets as it scans each row sequentially.

### 3. Creating a Full-Text Index:

CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);: This line creates a full-text index named idx_title_body on the title and body columns of the posts table.
A full-text index optimizes text-based searches, making them significantly faster, especially for large text fields.

### 4. Searching Using Full-Text Index:

**Simple Full-Text Search**:

SELECT *, MATCH(title, body) AGAINST('react redux') FROM posts WHERE MATCH(title, body) AGAINST('react redux');: This query uses the MATCH() function to perform a full-text search against the indexed columns title and body for the phrase "react redux".
It returns all matching posts along with a relevance score (indicated by MATCH()).

**Boolean Mode Search**:

SELECT *, MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE) FROM posts WHERE MATCH(title, body) AGAINST('react redux');: This query uses Boolean mode to refine the search:
-redux: Excludes posts containing "redux".
+form: Mandates the presence of "form".

**Phrase Search**:

SELECT *, MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE) FROM posts WHERE MATCH(title, body) AGAINST('react redux');: This query searches for the exact phrase "handling a form".
The quotes ensure that the words are treated as a phrase rather than individual terms.

### 5. Notes:

- *Index Requirements*: The MATCH() function requires that a full-text index exists on the specified columns.
- *Relevance Score*: The MATCH() function returns a relevance score, indicating how closely a post matches the search terms.
- *Customization*: Full-text searches can be further customized using options like stemming, stop words, and thesauruses.








