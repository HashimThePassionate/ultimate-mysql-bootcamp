# Foreign Key Constraints
Foreign key constraints are essential for maintaining referential integrity in relational databases. They ensure that relationships between tables remain consistent and prevent invalid data from being inserted.

### Understanding Foreign Key Constraints
**Definition**
A foreign key is a column or a set of columns in a table that references the primary key or a unique key in another table. The purpose of a foreign key is to ensure referential integrity between the two tables.

**Importance**
Data Integrity: Ensures that only valid data is inserted into the foreign key column.
Referential Integrity: Maintains consistent and meaningful relationships between tables.
Cascading Actions: Automatically propagates changes from parent to child tables, reducing the need for manual updates.

# Creating Foreign Key Constraints

**SQL Syntax**

```sql
CREATE TABLE child_table (
    column1 datatype,
    column2 datatype,
    ...
    FOREIGN KEY (foreign_key_column) REFERENCES parent_table(parent_column)
    [ON DELETE delete_action]
    [ON UPDATE update_action]
);
```

**Basic Foreign Key:**
```sql
CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  comments VARCHAR(2000) DEFAULT NULL,
  shipped_date DATE DEFAULT NULL,
  shipper_id SMALLINT DEFAULT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_orders_status FOREIGN KEY (status) REFERENCES order_statuses(order_status_id),
  CONSTRAINT fk_orders_shippers FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);
```

**Foreign Key with Cascading Delete:**
```sql
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `comments` varchar(2000) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `shipper_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  KEY `fk_orders_shippers_idx` (`shipper_id`),
  KEY `fk_orders_order_statuses_idx` (`status`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON DELETE CASCADE
);
```

**Foreign Key with Cascading Update:**
```sql
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `comments` varchar(2000) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `shipper_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  KEY `fk_orders_shippers_idx` (`shipper_id`),
  KEY `fk_orders_order_statuses_idx` (`status`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
);
```


### Managing Foreign Key Constraints

**Adding Constraints**
To add a foreign key constraint to an existing table, use the ALTER TABLE statement:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

**Dropping Constraints**
To drop a foreign key constraint from a table, use the ALTER TABLE statement:

```sql
ALTER TABLE orders
DROP FOREIGN KEY fk_orders_customers;
```

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../06_foreign_keys//"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../08_normalization/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>
