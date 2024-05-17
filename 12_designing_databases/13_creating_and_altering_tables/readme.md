# Creating and Altering Tables

## Creating a Table

The `CREATE TABLE` statement defines the structure of a table, specifying its columns and their data types. Here's the basic syntax:

```sql
CREATE TABLE table_name (
  column1 datatype(length),
  column2 datatype(length),
  ...
);
```

* Each column definition consists of a `<column_name>`, its `<datatype>`, and an optional `<length>` depending on the data type.
* Common data types include `INT` for integers, `VARCHAR(length)` for variable-length strings, `DATE` for dates, and many more ([invalid URL removed]).
* Separate column definitions with commas.

```sql
CREATE TABLE customers (
  idcustomer_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE NOT NULL,
  phone VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state CHAR(2) NOT NULL,
  points INT(11) UNIQUE,
);
```

**Additional Considerations:**

* You can set constraints like `NOT NULL` to ensure data is always entered and `UNIQUE` to prevent duplicate values in a column.
* Primary keys uniquely identify rows and enforce data integrity.
* Refer to the MySQL documentation for a comprehensive list of data types, constraints, and advanced options

## Altering Tables
The ALTER TABLE statement allows you to modify the structure of an existing table. Here are some common use cases:

* Adding a new column:

```sql
ALTER TABLE customers ADD COLUMN full_name VARCHAR(50);
```

* Dropping a column:

```sql
ALTER TABLE customers DROP COLUMN full_name;
```

* Modifying an existing column's data type or constraints:

```sql
ALTER TABLE customers MODIFY COLUMN address VARCHAR(100);
```

* Renaming a column or table:

Table
```sql
ALTER TABLE customers RENAME TO customer;
```

Column
```sql
ALTER TABLE customers RENAME COLUMN points TO bonus;
```

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../12_creating_and_dropping_databases/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../14_creating_relationships/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>