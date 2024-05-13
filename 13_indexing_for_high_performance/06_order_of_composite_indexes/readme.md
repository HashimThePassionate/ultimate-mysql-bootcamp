## Order of Composite:
**Two rules of composite indexes:**
1. Put the most frequently used columns first 
2. Put the columns with a higher cardinality first cardinality means unique values
```sql
SELECT customer_id 
FROM customers WHERE state = 'CA' 
AND last_name LIKE 'A%';
```
To Count how many unique values in each column 
```sql
SELECT 
COUNT(DISTINCT state), 
COUNT(DISTINCT last_name) 
FROM customers;
```
lets First we follow cardinality Rule **Note** cardinality rule not always work
```sql
CREATE INDEX idx_lastname_state ON customers (last_name, state); --Create index if not created
EXPLAIN SELECT customer_id 
FROM customers 
WHERE state = 'CA' 
AND 
last_name LIKE 'A%';
```
Now we reverse the order we put state than last_name
```sql
CREATE INDEX idx_state_lastname ON customers (state,last_name); --Create index if not created
EXPLAIN 
SELECT customer_id 
FROM customers 
WHERE state = 'CA' 
AND 
last_name LIKE 'A%';
```
To force mysql to use different index we use
```sql
EXPLAIN 
SELECT customer_id 
FROM customers 
USE INDEX (idex_lastname_state) 
WHERE state = 'CA' 
AND 
last_name LIKE 'A%';
```
