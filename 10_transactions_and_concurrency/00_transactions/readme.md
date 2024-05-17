# Transactions
A transaction in MySQL is a sequence of one or more SQL statements that are executed as a single unit of work. Transactions ensure data integrity by allowing a group of related operations to either succeed or fail as a whole.

## Purpose of Transactions

The primary purposes of using transactions in MySQL are:

* Data Integrity: Transactions ensure that data remains consistent and accurate, even when multiple users are accessing and modifying it simultaneously.
* Atomicity: Transactions are atomic, meaning they either succeed entirely or fail entirely. There is no partial completion of a transaction.
* Consistency: Transactions enforce consistency rules defined by the database schema, ensuring that data remains valid at all times.
* Isolation: Transactions provide isolation between concurrent transactions, preventing interference between them and maintaining data integrity.

## Usage

1. Begin Transaction: Start a new transaction using the START TRANSACTION or BEGIN statement.

```sql
START TRANSACTION;
```

2. Execute SQL Statements: Execute one or more SQL statements within the transaction. These statements can include `INSERT`, `UPDATE`, `DELETE`, or `SELECT` queries.

### Example of `INSERT`

```sql
START TRANSACTION;
INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    birth_date,
    phone,
    address,
    city,
    state,
    points
) VALUES (
    52,
    'Ahmed',
    'Raheem',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Punjab',
    DEFAULT
);
COMMIT;
```

### Example of `UPDATE`

```sql
START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;
```

### Example of `DELETE`

```sql
START TRANSACTION;
DELETE FROM customers
WHERE customer_id = 1;
COMMIT;
```

3. Commit or Rollback: After executing the required SQL statements, decide whether to commit the transaction using COMMIT or rollback using ROLLBACK.

- **COMMIT:** Persist all changes made within the transaction to the database.

```sql
COMMIT;
```

- **ROLLBACK:** Discard all changes made within the transaction and revert the database to its state before the transaction began.

```sql
ROLLBACK;
```

## Best Practices

- Always use transactions when performing multiple related database operations to maintain data integrity.
- Keep transactions short and efficient to minimize lock contention and improve concurrency.
- Handle errors gracefully within transactions and rollback when necessary to avoid leaving the database in an inconsistent state.
- Use appropriate isolation levels (READ COMMITTED, REPEATABLE READ, SERIALIZABLE) based on the requirements of your application to balance consistency and performance.

## Conclusion

Transactions play a crucial role in maintaining data integrity and consistency in MySQL databases. By following best practices and understanding how to use transactions effectively, you can ensure the reliability and stability of your database-driven applications.

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../readme.md"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../01_creating_transactions/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>