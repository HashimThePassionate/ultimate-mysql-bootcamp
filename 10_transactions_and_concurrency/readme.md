# SQL Transaction Management

## Overview

This repository provides a guide on how to manage transactions in SQL databases. Transactions are essential for ensuring data integrity and consistency when executing multiple SQL statements that depend on each other.

## Contents

0. [Introduction to Transactions](./00_transactions/)
1. [Creating a Transaction](./01_creating_transactions/)
2. [Concurrency and Locking](./02_concurrency_and_locking/)
3. [Concurrency Problems](./03_concurrency_problems/)
4. [Transaction Isolation Levels](./04_transaction_isolation_levels/)
5. [READ UNCOMMITTED Isolation Level](./05_read_uncommitted_isolation_level/)
6. [READ COMMITTED Isolation Level](./06_read_committed_isolation_level/)
7. [REPEATABLE READ Isolation Level](./07_repeatable_read_isolation_level/)
8. [SERIALIZABLE Isolation Level](./08_serializable_isolation_level/)

## Introduction to Transactions

A transaction is a sequence of one or more SQL operations that are treated as a single logical unit of work. Transactions ensure that either all operations within the unit succeed or none of them are applied to the database.

## Starting a Transaction

To start a transaction, use the `BEGIN TRANSACTION` or `START TRANSACTION` statement, depending on your SQL dialect.

Example:

```sql
BEGIN TRANSACTION;

-- SQL statements

COMMIT;

```