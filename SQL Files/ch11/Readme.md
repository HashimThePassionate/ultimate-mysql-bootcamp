# p86-creating_transactions.sql

```sql
USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

COMMIT;

--

SHOW VARIABLES LIKE 'autocommit';
```

## Explaination;

### 1. Database Selection:

USE sql_store; instructs the database system to use the database named sql_store for subsequent commands.

### 2. Transaction Control:

START TRANSACTION; begins a transaction, which groups multiple SQL statements into a single unit of work.

### 3. Data Insertion into Orders Table:

INSERT INTO orders (customer_id, order_date, status) VALUES (1, '2019-01-01', 1); inserts a new row into the orders table, specifying values for the customer_id, order_date, and status columns.

### 4. Data Insertion into Order Items Table:

INSERT INTO order_items VALUES (LAST_INSERT_ID(), 1, 1, 1); inserts a new row into the order_items table, using LAST_INSERT_ID() to retrieve the automatically generated ID of the newly created order from the orders table.

### 5. Transaction Commit:

COMMIT; permanently saves the changes made within the transaction to the database.

### 6. Autocommit Check:

SHOW VARIABLES LIKE 'autocommit'; displays the value of the autocommit setting, which determines whether or not individual statements are automatically committed.

### Key Points:

**Transactions**: Transactions ensure data consistency and integrity by grouping multiple operations into a single unit that either succeeds or fails as a whole.
**Last Insert ID**: LAST_INSERT_ID() is a handy function for retrieving the ID of the most recently created row, often used to create links between related tables.
**Autocommit**: Understanding the autocommit setting is crucial for controlling how and when changes are made permanent in the database.







# p87-concurrency_and_locking.sql

```sql
-- Session one
USE sql_store;

START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;

-- Session two
USE sql_store;

START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;

-- Execute them one by one, and see how the data updated.

```

## Explaination;

### 1. Database Selection:

USE sql_store; specifies the database to work with.

### 2. Transaction Management:

- START TRANSACTION; initiates a transaction, ensuring data integrity during multiple updates.
- COMMIT; finalizes the changes, making them visible to other sessions.

### 3. Data Modification:

- UPDATE customers targets the customers table for modification.
- SET points = points + 10 adds 10 points to the points column.
- WHERE customer_id = 1; applies the change only to the customer with ID 1.

### 4. Simultaneous Sessions:

The code demonstrates two independent sessions executing the same update.

### 5. Execution and Observation:

The script suggests executing the sessions sequentially to observe the results.

### Key Points:

- *Transactions*: Critical for maintaining data consistency and preventing conflicts in multi-user environments.
- *Isolation*: Transactions operate independently, ensuring changes aren't visible to other sessions until committed.
- *Order of Execution*: The final result depends on the order in which transactions are committed.







# p90-read_uncommitted_isolation_level.sql

```sql
-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT points
FROM customers
WHERE customer_id = 1;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20
WHERE customer_id = 1;
COMMIT;

```

## Explaination;

### Session One:

#### Database Selection:

USE sql_store; selects the database named "sql_store" to work with.
**Isolation Level Setting**:
- SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; sets the transaction isolation level to "READ UNCOMMITTED" for this session.
 This means it can read uncommitted data from other transactions, potentially leading to inconsistent results.
**Data Retrieval**:
- SELECT points FROM customers WHERE customer_id = 1; attempts to read the "points" value for the customer with ID 1 from the "customers" table.

### Session Two:

#### Database Selection:
USE sql_store; selects the same database as Session One.
**Transaction Start**:
START TRANSACTION; begins a transaction, indicating that the subsequent statements should be treated as a single unit of work.
**Data Modification**:
UPDATE customers SET points = 20 WHERE customer_id = 1; updates the "points" value for customer ID 1 to 20. This change is not yet committed and visible to other transactions.
**Transaction Commit**:
COMMIT; finalizes the transaction, making the changes permanent and visible to other transactions.

#### Possible Concurrency Issues:

- *Dirty Read*: Due to READ UNCOMMITTED isolation level, Session One could potentially read the uncommitted value of 20 from Session Two before it's committed. This could lead to Session One operating on data that might not be final.
- *Non-Repeatable Read*: If Session One reads the points value again after Session Two commits, it might see a different value (20) compared to its first read. This can happen because READ UNCOMMITTED doesn't prevent other transactions from modifying data that's already been read.

### Key Points:

- Transaction isolation levels control how transactions interact with each other's changes.
- READ UNCOMMITTED is the least restrictive isolation level, allowing dirty reads and non-repeatable reads.
Consider using higher isolation levels (READ COMMITTED, REPEATABLE READ, or SERIALIZABLE) if data consistency is crucial in your application.






# p91-read_committed_isolation_level.sql

```sql
-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT points
FROM customers
WHERE customer_id = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;

SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20
WHERE customer_id = 1;
COMMIT;
```

## Explaination;

### Session One:

**Database Selection**:

USE sql_store; selects the database named sql_store for subsequent operations.

**Setting Isolation Level (twice)**:

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; sets the transaction isolation level to READ COMMITTED for both statements within this session. This means that transactions can only see data that has been committed by other transactions, preventing "dirty reads" of uncommitted data.

**First SELECT Statement**:

- SELECT points FROM customers WHERE customer_id = 1; retrieves the current value of points for the customer with customer_id = 1. 
The result depends on the state of the data at this point in time.

**Starting Transaction**:

START TRANSACTION; begins a new transaction, ensuring that subsequent statements are treated as a single unit of work.

**Second SELECT Statement**:

SELECT points FROM customers WHERE customer_id = 1; again retrieves the current value of points for the same customer. However, if Session Two has committed an update to this row after the first SELECT in Session One, this second SELECT might see a different value due to the READ COMMITTED isolation level.
Third SELECT Statement:

This SELECT acts the same as the second one, potentially seeing changes committed by Session Two.

**Committing Transaction**:

COMMIT; finalizes the transaction in Session One, making any changes made within it permanent.

### Session Two:

**Database Selection**:

USE sql_store; selects the same database.

**Starting Transaction**:

START TRANSACTION; begins a new transaction.

**Updating Data**:

UPDATE customers SET points = 20 WHERE customer_id = 1; modifies the points value for the customer with customer_id = 1 to 20. However, this change won't be visible to Session One until it's committed.

**Committing Transaction**:

COMMIT; finalizes the transaction, making the update visible to other transactions.

### Key Points:

- The READ COMMITTED isolation level allows transactions to see changes made by other transactions as soon as they're committed, potentially leading to different results for the same SELECT statement executed multiple times.
- The order of execution and timing of commits in the concurrent sessions can affect the data visibility and consistency between them.








# p92-repeatable_read_isolation_level.sql

```sql
-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;

SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 40
WHERE customer_id = 1;
COMMIT;

------------------------------------------------------------------------------

-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 1;
COMMIT;

```

## Explaination;

## First Code Snippet:

### Session One:

- Database Selection: USE sql_store; switches to the sql_store database.
- *Isolation Level*: SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; ensures consistent reads within the transaction, preventing non-repeatable reads and dirty reads.
- *Transaction Start*: START TRANSACTION; initiates a transaction, grouping subsequent statements for atomicity.
- *First Read*: SELECT points FROM customers WHERE customer_id = 1; retrieves the current points for customer 1.
- *Second Read*: SELECT points FROM customers WHERE customer_id = 1; repeats the same read within the transaction.
- *Commit*: COMMIT; finalizes the transaction, making any changes permanent.

### Session Two:

- Database Selection: USE sql_store; switches to the sql_store database.
- Transaction Start: START TRANSACTION; initiates a transaction.
**Update**: UPDATE customers SET points = 40 WHERE customer_id = 1; attempts to modify customer 1's points.
**Commi**t: COMMIT; attempts to finalize the update.

### Potential Anomaly:

- *Locking*: Depending on the database system's implementation, Session Two's update might be blocked until Session One commits, ensuring the consistency guaranteed by REPEATABLE READ.

## Second Code Snippet:

### Session One:

- Database Selection: USE sql_store;
- Isolation Level: SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
- Transaction Start: START TRANSACTION;
**Read**: SELECT * FROM customers WHERE state = 'VA'; retrieves customers with the state 'VA'.
**Commit**: COMMIT;

### Session Two:

- Database Selection: USE sql_store;
- Transaction Start: START TRANSACTION;
**Update**: UPDATE customers SET state = 'VA' WHERE customer_id = 1; attempts to update customer 1's state to 'VA'.
**Commit**: COMMIT;

### Potential Anomaly:

Phantom Read: Session One might not see the updated customer in its initial read, but a subsequent read within the same transaction might, violating the REPEATABLE READ guarantee.

### Key Points:

- Transaction Isolation Levels: Database systems offer different isolation levels to control concurrency and prevent data inconsistencies.
- Repeatable Read: This level prevents non-repeatable reads and dirty reads, but phantom reads are still possible.
- Database Implementation: The specific behavior in these scenarios depends on the database system's implementation of locking and isolation mechanisms.







# p93-serializable_isolation_level.sql

```sql
-- Session one
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 3;
COMMIT;

```

## Explaination;

### Session One:

**Database Selection**:

USE sql_store; selects the database named sql_store for subsequent operations.

**Isolation Level**:

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; sets the isolation level to REPEATABLE READ for this session. This means:
Reads will not see changes made by other transactions until those transactions commit.
Rows read within the transaction will not be modified by other transactions until this transaction commits.

**Transaction Start**:

START TRANSACTION; begins a transaction, ensuring that all subsequent operations within it are treated as a single unit of work.

**Data Retrieval**:

- SELECT * FROM customers WHERE state = 'VA'; fetches all rows from the customers table where the state column is 'VA'.
Due to REPEATABLE READ, this query sees the data as it existed at the start of the transaction, even if other transactions commit changes to these rows during its execution.

**Transaction Commit**:

COMMIT; successfully completes the transaction, making any changes permanent and releasing any locks held by the transaction.

### Session Two:

**Database Selection**:

USE sql_store; selects the same database, sql_store.

**Transaction Start**:

START TRANSACTION; begins a new transaction.

**Data Modification**:

UPDATE customers SET state = 'VA' WHERE customer_id = 3; updates the state column to 'VA' for the customer with customer_id of 3.

**Transaction Commit**:

COMMIT; commits the changes made in this transaction, making them permanent.

**Interaction between Sessions**:

- The isolation level REPEATABLE READ in Session One ensures that:
- The SELECT query in Session One doesn't see the update made by Session Two, even though it was committed before Session One's transaction ended.
- If Session Two had tried to update a row already read by Session One, it would have been blocked until Session One's transaction completed.

### Key Points:

- Isolation levels control how transactions interact with each other's changes to maintain data consistency and avoid conflicts.
- REPEATABLE READ prevents non-repeatable reads and dirty reads, but phantom reads are still possible.
- Understanding isolation levels is crucial for writing reliable and predictable database interactions in concurrent environments.







# p94-deadlocks.sql

```sql
-- Session one
USE sql_store;
START TRANSACTION;

UPDATE customers SET state = 'VA' WHERE customer_id = 1;
UPDATE orders SET status = 1 WHERE order_id = 1;

COMMIT;

-- Session two
USE sql_store;
START TRANSACTION;

UPDATE orders SET status = 1 WHERE order_id = 1;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;

COMMIT;
```

## Explaination;

### 1. Selecting the Database:

Both sessions begin by using the USE sql_store; command to select the database named sql_store for subsequent operations.

### 2. Initiating Transactions:

Each session starts a transaction using the START TRANSACTION; command. This ensures that the database treats the subsequent SQL statements as a single unit of work, maintaining data consistency.

### 3. Updating Data:

*Session One*:
- Updates the state column to 'VA' for the customer with customer_id of 1 in the customers table.
- Updates the status column to 1 for the order with order_id of 1 in the orders table.

*Session Two*:
- Attempts to update the status column to 1 for the order with order_id of 1 in the orders table. However, this operation might be blocked or delayed due to the ongoing transaction in Session One.
- Attempts to update the state column to 'VA' for the customer with customer_id of 1 in the customers table. This operation might also be affected by the transaction in Session One.

### 4. Committing Changes:

*Session One*:
Commits the changes made within its transaction using the COMMIT; command. This permanently applies those updates to the database tables.

*Session Two*:
-If Session One's commit occurs before Session Two's updates, Session Two's updates might be unnecessary or might result in conflicts, depending on the database's isolation level and concurrency control mechanisms.
-If Session Two's updates proceed without conflicts, it commits them using COMMIT;, making those changes permanent as well.

### Key Points:

- *Transaction Management*: The use of START TRANSACTION; and COMMIT; ensures data consistency and integrity by grouping related updates together.
- *Potential Deadlocks*: If both sessions attempt to update the same rows in a different order, a deadlock might occur, requiring intervention to resolve.
- Isolation Levels: The database's isolation level (e.g., Read Committed, Repeatable Read) determines how transactions interact with each other and what data they can see.
- Concurrency Control: The database's concurrency control mechanisms (e.g., locking, optimistic locking) manage the execution of concurrent transactions to prevent conflicts and ensure data consistency.


# p100-enum_and_set_types.sql

```sql
ALTER TABLE sql_store.products
ADD COLUMN size ENUM('small', 'medium', 'large') NULL AFTER unit_price;

```

## Explaination;

### 1. Identify the target table: 
The statement begins with ALTER TABLE sql_store.products, indicating that it will modify the existing table named products within the sql_store database.

### 2.Specify the modification: 
The phrase ADD COLUMN signals that a new column will be added to the table.

### 3.Define the new column:
- *Name*: The column will be named size.
- *Data type*: It will use the ENUM data type, which restricts its values to a predefined set: 'small', 'medium', or 'large'. This ensures data consistency and prevents invalid size entries.
- *Nullability*: The NULL keyword allows for empty or unknown values in the size column, providing flexibility in cases where size information might not be immediately available.

### 4.Position the column: 
The AFTER unit_price clause specifies that the new size column should be placed directly after the existing unit_price column within the table's structure. This helps organize the data logically.

### Summary:

The SQL statement essentially instructs the database system to:

- Locate the products table in the sql_store database.
- Add a new column named size to that table.
- Restrict the values in the size column to 'small', 'medium', or 'large'.
- Allow for null values in the size column.
- Position the size column after the unit_price column.

This modification expands the table's capacity to store product size information, enhancing its data richness and potential for more comprehensive analysis and queries



# p103-json_type.sql```sql

```sql
ALTER TABLE `sql_store`.`products` 
ADD COLUMN `properties` JSON NULL AFTER `size`;

UPDATE
    products
SET
    properties = '
{
    "dimensions": [1, 3, 3],
    "weight": 10,
    "manufacturer": { "name": "sony"}
}
'
WHERE
    product_id = 1;

-- equals the above
UPDATE
    products
SET
    properties = JSON_OBJECT(
    'weight', 10,
    'dimensions', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name', 'sony')
)
WHERE
    product_id = 1;

-- extract json objects
SELECT
    product_id,
    JSON_EXTRACT(properties, '$.weight') AS weight,
    properties -> '$.weight',
    properties -> '$.dimensions[0]',
    properties -> '$.manufacturer.name',
    properties ->> '$.manufacturer.name'
FROM
    products
WHERE
    product_id = 1
    AND properties ->> '$.manufacturer.name' = 'sony';

-- set json object
UPDATE
    products
SET
    properties = JSON_SET(
    properties,
    '$.weight', 20,
    '$.age', 10
)
WHERE
    product_id = 1;

-- remove json object
UPDATE
    products
SET
    properties = JSON_REMOVE(
    properties,
    '$.age'
)
WHERE
    product_id = 1;


```

## Explaination;

### 1. Adding a JSON column:

The code ALTER TABLE sql_store.products ADD COLUMN properties JSON NULL AFTER size; adds a new column named properties with the JSON data type to the products table. This column will be able to store JSON-formatted data.

### 2. Storing JSON data:

*Method 1*: The code UPDATE products SET properties = '...JSON data...' WHERE product_id = 1; inserts a JSON string directly into the properties column for the product with product_id of 1.
*Method 2*: The code UPDATE products SET properties = JSON_OBJECT(...) WHERE product_id = 1; constructs a JSON object using built-in JSON functions and stores it in the properties column.

### 3. Extracting JSON data:

The code SELECT product_id, JSON_EXTRACT(properties, '<span class="math-inline">\.weight'\) AS weight, \.\.\. FROM products WHERE \.\.\.;\ retrieves specific values from the JSON data stored in the `properties` column using various JSON extraction functions.

**4. Updating JSON data:** 
- The code `UPDATE products SET properties = JSON_SET(properties, '.weight', 20, '.age 
′
 ,10)WHEREproduct 
i
​
 d=1;‘modifiestheJSONdatabyaddingorupdatingkey−valuepairswithintheJSONobject.∗∗5.RemovingJSONdata:∗∗−Thecode‘UPDATEproductsSETproperties=JSON 
R
​
 EMOVE(properties, 
′
 .age') WHERE product_id = 1;` removes a specific key-value pair from the JSON object.

### Key takeaways:

- The code demonstrates how to effectively work with JSON data within a relational database like MySQL.
- It showcases various techniques for storing, extracting, modifying, and removing JSON elements.
- This functionality allows for a flexible and adaptable way to manage semi-structured data within a structured database environment.


