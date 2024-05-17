# MySQL Concurrency and Locking

### Introduction to Concurrency Control
Concurrency control ensures that multiple transactions can execute concurrently without interfering with each other's operations. In a multi-user database environment, concurrent transactions may read and modify the same data simultaneously. Without proper concurrency control mechanisms, this can lead to data inconsistencies and integrity issues.

### Types of Locks
MySQL employs various types of locks to manage concurrency:

`Read Locks (Shared Locks):` Allow multiple transactions to read a resource simultaneously but prevent write operations.

`Write Locks (Exclusive Locks):` Prevent other transactions from reading or writing to a resource.

### Concurrency Issues
Common concurrency issues include:

`Deadlocks:` Occur when two or more transactions are waiting for each other to release locks, resulting in a circular dependency and a deadlock situation.

`Lock Contention:` Arises when multiple transactions compete for the same locks, leading to decreased performance and increased wait times.

### Locking Strategies
To manage concurrency effectively, consider the following locking strategies:

Optimistic Concurrency Control: Assume that conflicts between transactions are rare and allow them to proceed without explicit locking. Detect conflicts at commit time and resolve them if they occur.

Pessimistic Concurrency Control: Acquire locks on data resources preemptively to prevent conflicts between transactions. This approach ensures data consistency but may lead to reduced concurrency and performance.

### Best Practices
Understand the concurrency requirements of your application and choose the appropriate locking mechanisms and isolation levels accordingly.

Design database schemas to minimize the need for locking and optimize query performance.

Monitor database performance regularly and tune locking configurations to improve concurrency and minimize contention.

### Example:

`run this script line by line in to different script box`
Query box 1

```sql

START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;

```

Query box 2

```sql

START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;

```
<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../01_creating_transactions/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../03_concurrency_problems/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>