## Creating Indexes:

lets first create a new table customer that have 1000 of records, we already attached **customer.sql** file.

### Example Query (Before Indexing):
```sql
EXPLAIN SELECT customer_id FROM customer where state = 'CA';
```
Now look to find the customer whose state is CA, mysql reads all the records
we can see using **Explain** keyword before select statement...

#### Now lets Create Indexe for fast searching:
```sql
CREATE INDEX idx_state ON customer (state);
EXPLAIN SELECT customer_id FROM customer where state = 'CA';
```