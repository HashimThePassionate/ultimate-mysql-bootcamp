# Normalization
Normalization is the process of structuring a relational database in accordance with a series of normal forms to minimize redundancy and dependency.

### Importance
Normalization ensures that the data is stored logically and efficiently, reducing redundancy and improving data integrity. It helps in maintaining consistency and optimizing queries by organizing data into related tables

### Normalization Forms

**First Normal Form (1NF)**
* `Definition:` A table is in 1NF if it contains only atomic (indivisible) values and each column contains values of a single type.
* `Requirements:` Eliminate repeating groups and ensure each cell contains a single value.

**Second Normal Form (2NF)**
* `Definition:` A table is in 2NF if it is in 1NF and all non-key attributes are fully functional dependent on the primary key.
* `Requirements:` Eliminate partial dependencies by ensuring that non-key attributes depend on the entire primary key.

**Third Normal Form (3NF)**
* `Definition:` A table is in 3NF if it is in 2NF and all its attributes are not transitively dependent on the primary key.
* `Requirements:` Eliminate transitive dependencies by ensuring that non-key attributes depend only on the primary key.

**Boyce-Codd Normal Form (BCNF)**
* `Definition:` A table is in BCNF if it is in 3NF and every determinant is a candidate key.
* `Requirements:` Resolve anomalies that are not addressed by 3NF, ensuring every determinant is a candidate key.

**Higher Normal Forms**
* `Fourth Normal Form (4NF):` Deals with multi-valued dependencies.
* `Fifth Normal Form (5NF):` Deals with join dependencies and ensures no loss of data when tables are joined.


### Steps in Normalization

**Step 1: Ensuring 1NF**
* `Action:` Ensure each table has a primary key, and each cell contains a single value.
* `Example:` Split a column containing multiple values into separate rows or columns.

**Step 2: Ensuring 2NF**
* `Action:` Eliminate partial dependencies by ensuring that non-key attributes depend on the entire primary key.
* `Example:` Move columns that only depend on part of the primary key to a new table.

**Step 3: Ensuring 3NF**
* `Action:` Eliminate transitive dependencies by ensuring that non-key attributes depend only on the primary key.
* `Example:` Move columns that depend on non-key attributes to a new table.

**Step 4: Ensuring BCNF**
* `Action:` Ensure every determinant is a candidate key.
* `Example:` Identify and resolve any anomalies where non-candidate key determinants exist.


### Advantages of Normalization
**Data Integrity**
Normalization ensures data accuracy and consistency by organizing data into well-structured tables.

**Reduced Data Redundancy**
Normalization minimizes data duplication, reducing storage requirements and the risk of data anomalies.

**Improved Data Consistency**
Normalized databases maintain consistent data by enforcing dependencies and constraints.

**Enhanced Query Performance**
Properly normalized databases can improve query performance by optimizing data access paths and reducing the need for complex joins.

### Disadvantages of Normalization
**Complexity**
Normalization can introduce complexity in database design, making it harder to manage and understand.

**Performance Trade-offs in Certain Scenarios**
In some cases, normalization can lead to performance issues due to increased joins and the need for more complex queries.

## Normalization in MySQL
**Applying 1NF in MySQL**
Ensure each column contains atomic values.
Remove repeating groups by creating separate rows.
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    items VARCHAR(255) -- Comma-separated list of items, not normalized
);
```

**Applying 2NF in MySQL**
Eliminate partial dependencies by moving related data to separate tables.
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

**Applying 3NF in MySQL**
Eliminate transitive dependencies by moving data to new tables.
```sql
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city_id INT
);

CREATE TABLE cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100)
);

ALTER TABLE suppliers ADD FOREIGN KEY (city_id) REFERENCES cities(city_id);
```


<div style="display: flex; align-items: center; align-self: center; justify-content: space-evenly;" align="center">
<a href="../07_foreign_key_constraints/"><img width="110px" src="../esn_for_repo/prev.png" alt="prev"></a>
<a href="../09_forward_engineering_a_model/"><img width="110px" src="../esn_for_repo/next.png" alt="next"></a>
</div>