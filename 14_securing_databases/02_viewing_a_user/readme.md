## Viewing A User:
```sql
    SELECT * FROM mysql.user;
```
### Query Explanation

This query retrieves all columns from the `mysql.user` table.

- **SELECT *:** The `SELECT *` statement selects all columns from the specified table.
- **FROM mysql.user:** Specifies the table from which to retrieve the data. In this case, it's the `user` table in the `mysql` database.
- **mysql.user:** The `mysql` database contains system tables that store information about database users and their privileges.
- **User Information:** The `mysql.user` table contains information about MySQL user accounts, such as usernames, hostnames, and password hashes.
- **Privileges:** Additionally, this table stores privileges granted to each user, including global, database-specific, and table-specific privileges.

