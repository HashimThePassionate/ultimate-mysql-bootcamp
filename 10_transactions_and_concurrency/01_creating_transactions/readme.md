### Starting a Transaction
To start a transaction in MySQL, you can use either `START TRANSACTION`, `BEGIN`, or `BEGIN WORK` statement.

Example:

```sql

START TRANSACTION;
-- or
BEGIN;
-- or
BEGIN WORK;


```

### Committing a Transaction
Committing a transaction in MySQL saves all changes made within the transaction to the database. Use the `COMMIT` statement to commit a transaction.

Example:

```sql

COMMIT;

```

### Rolling Back a Transaction
If an error occurs or if you need to discard the changes made within a transaction, you can roll back the transaction using the `ROLLBACK` statement.

Example:

```sql

ROLLBACK;

```
<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../00_transactions/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../02_concurrency_and_locking/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>