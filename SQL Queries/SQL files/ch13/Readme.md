# p128-p134.sql

```sql
-- p128
CREATE DATABASE IF NOT EXISTS sql_store2;

-- p129
USE sql_store2;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    points INT NOT NULL DEFAULT 0,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- p130
ALTER TABLE customers
    ADD last_name VARCHAR(50) NOT NULL AFTER first_name,
    ADD city VARCHAR(50) NOT NULL,
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',
    DROP points
;

-- p131
-- Adjust the DROP TABLE IF EXISTS orders.
CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
        REFERENCES customers (customer_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

-- p132
ALTER TABLE order
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (order_id),
    DROP FOREIGN KEY fk_orders_customers
    ADD FOREIGN KEY fk_orders_customers (customer_id)
        REFERENCES customers (customer_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
;

-- p133
SHOW CHARSET;
-- CHAR(10) -> 10 * 3 (utf8)
-- CHAR(10) -> 10 * 1 (latin1)
CREATE DATABASE db_name
    CHARACTER SET latin1;
ALTER DATABASE db_name
    CHARACTER SET latin1;

CREATE TABLE table1
()
CHARACTER SET latin1;

ALTER TABLE table1
    CHARACTER SET latin1;

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) CHARACTER SET latin1 NOT NULL,
    points INT NOT NULL DEFAULT 0,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- p134
SHOW ENGINES;

ALTER TABLE customers
    ENGINE = InnoDB;
-- Rebuild the table, and you might cannot access the table.

```

## Explaination;

### Database and Table Creation:

**Creating a Database**:
CREATE DATABASE IF NOT EXISTS sql_store2; (p128) creates a database named sql_store2 if it doesn't already exist.
**Selecting a Database**:
USE sql_store2; (p129) selects the sql_store2 database for subsequent operations.
**Creating Tables**:
- CREATE TABLE IF NOT EXISTS customers ... (p129) creates a table named customers with columns for customer ID, first name, points, and email.
- CREATE TABLE orders ... (p131) creates a table named orders with columns for order ID and customer ID, and a foreign key referencing the customers table.

### Modifying Tables:

**Adding and Modifying Columns**:
ALTER TABLE customers ... (p130) adds last_name and city columns, modifies the first_name column's default value, and removes the points column.
**Altering Primary Keys and Foreign Keys**:
ALTER TABLE orders ... (p132) removes and recreates the primary key and foreign key on the orders table.

### Character Set and Storage Engine:

**Changing Character Set**:
The code on p133 demonstrates how to view available character sets, create a database and table with a specific character set (latin1 in this case).
**Changing Storage Engine**:
ALTER TABLE customers ENGINE = InnoDB; (p134) changes the storage engine of the customers table to InnoDB.
