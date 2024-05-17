# Creating and Dropping Databases
Creating and dropping databases are fundamental tasks in MySQL database administration. Creating a database involves defining a new database schema, while dropping a database involves removing an existing schema and all its data.

**Creating a Database**

A database in MySQL stores your data in a structured format. To create a new database, use the following SQL statement:

```sql
CREATE DATABASE sql_store;
```

**Here are some additional points to consider:**

* The `database_name` must be unique within the MySQL server.
* By default, MySQL creates the database with the character set and collation of the server. You can specify these options after the database name in the `CREATE DATABASE` statement.
* To avoid errors if the database already exists, you can use the `IF NOT EXISTS` 
clause:

```sql
CREATE DATABASE IF NOT EXISTS sql_store;
```

**Dropping a Database**
Dropping a database permanently removes it from the server, along with all its tables and data. Use the following statement with caution:

```sql
DROP DATABASE sql_store;
```

**Important considerations:**

* This action is irreversible. Ensure you have a backup before dropping a database.
* The `IF EXISTS` clause can prevent errors if the database doesn't exist:

```sql
DROP DATABASE IF EXISTS sql_store;
```

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../11_reverse_engineering_a_database/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../13_creating_and_altering_tables/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>