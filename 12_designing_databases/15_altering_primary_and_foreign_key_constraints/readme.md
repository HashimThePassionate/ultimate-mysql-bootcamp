# Altering Primary and Foreign Key Constraints
Primary and foreign key constraints are essential for ensuring data integrity in a database. Primary keys uniquely identify each record in a table, while foreign keys establish relationships between tables. Altering these constraints involves adding, dropping, or modifying them as needed.

### Altering Primary Key Constraints

**Adding a Primary Key**
To add a primary key to a table that does not already have one, you can use the following SQL 
syntax:

```sql
ALTER TABLE customers
ADD PRIMARY KEY (customer_id);
```

**Dropping a Primary Key**
To drop an existing primary key from a table, you can use the following SQL 
syntax:

```sql
ALTER TABLE customers
DROP PRIMARY KEY;
```

**Modifying a Primary Key**
To modify a primary key, you typically need to drop the existing primary key and then add a new one. For example, to change the primary key to a different column:

```sql
ALTER TABLE customers
DROP PRIMARY KEY;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);
```

### Altering Foreign Key Constraints

**Adding a Foreign Key**
To add a foreign key to a table, use the following SQL 
syntax:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

**Dropping a Foreign Key**
To drop an existing foreign key from a table, you must first identify the constraint name and then drop it using the following SQL 
syntax:

```sql
ALTER TABLE orders
DROP FOREIGN KEY fk_customer;
```

**Modifying a Foreign Key**
To modify a foreign key, you typically need to drop the existing foreign key and then add a new one with the desired changes. For example, to change the referenced column or update 
actions:

1. Drop the existing foreign key:

```sql
ALTER TABLE orders
DROP FOREIGN KEY fk_customer;
```

2. Add the new foreign key:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../14_creating_relationships/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../16_character_sets_and_collations/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>