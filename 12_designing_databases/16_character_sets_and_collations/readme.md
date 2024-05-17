# Character Sets and Collations

Character sets and collations are essential components of MySQL databases that determine how text data is stored and compared. Proper understanding and configuration are crucial for ensuring data integrity and optimizing database performance.

### Understanding Character Sets and Collations

**What is a Character Set?**
A character set is a collection of characters that can be used in the database. It defines how characters are stored and retrieved. For example, UTF-8 is a widely used character set that includes a large number of characters from various languages.

**What is a Collation?**
A collation is a set of rules for comparing characters in a character set. It defines how strings are sorted and compared. Collations are important for operations like sorting and case-insensitive searches. For example, utf8mb4_general_ci is a collation for the utf8mb4 character set that provides case-insensitive comparisons.

### Common Character Sets and Collations
**utf8mb4**
* Character Set: utf8mb4
* Collations: utf8mb4_general_ci, utf8mb4_unicode_ci, etc.
* Description: Supports a wide range of characters, including supplementary characters. Recommended for new applications.

**latin1**
* Character Set: latin1
* Collations: latin1_swedish_ci, latin1_general_ci, etc.
* Description: A single-byte character set supporting Western European languages. Common in legacy systems.

**Other Common Character Sets and Collations**
1. Character Set: ascii
 * Collations: ascii_general_ci
 * Description: Supports basic English characters.

2. Character Set: ucs2
 * Collations: ucs2_general_ci
 * Description: A two-byte character set supporting a wide range of characters.

### Setting Character Sets and Collations

**Database Level**
To set the character set and collation for a database, use the `CREATE DATABASE` or `ALTER DATABASE` .
statement:

`CREATE DATABASE`
```sql
CREATE DATABASE sql_invoicing
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
```

`ALTER DATABASE`
```sql
ALTER DATABASE sql_invoicing
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
```

**Table Level**
To set the character set and collation for a table, use the CREATE TABLE or ALTER TABLE 
statement:

```sql
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE customers
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;
```

**Column Level**
To set the character set and collation for a column, specify them in the CREATE TABLE or ALTER TABLE 
statement:

```sql
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
);

ALTER TABLE customers
MODIFY COLUMN first_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../15_altering_primary_and_foreign_key_constraints/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../17_storage_engines/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>