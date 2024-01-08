# Introduction to MySQL

MySQL is a widely used, open-source relational database management system (RDBMS). It enables users to  
store, manage, and retrieve data efficiently in a structured format. Think of it as a digital filing 
cabinet that organizes your information into tables, rows, and columns, making it easy to find and use 
specific data whenever you need it.


## Here are some key characteristics of MySQL:

### *Open-source*: 
   This means that the source code is freely available, allowing anyone to modify and distribute it. This has contributed to its widespread adoption and large community of developers.
### *Relational*: 
   Data is stored in tables with relationships between them, enabling you to retrieve information from multiple tables at once. This makes it suitable for complex data organization and analysis.
### *Fast and reliable*: 
   MySQL is known for its performance and stability, even when handling large amounts of data. This makes it a popular choice for web applications and other data-intensive tasks.
### *Scalable*: 
   MySQL can be easily scaled to accommodate growing data requirements. You can start with a small server and add more as your needs increase.
### *Easy to use*: 
   MySQL uses Structured Query Language (SQL), a standardized language for interacting with databases. This makes it relatively easy to learn and use, even for people with limited technical experience.

## Here are some of the common applications of MySQL:

### *Websites and web applications*: 
   Many websites and web applications, such as blogs, e-commerce platforms, and social media sites, use MySQL to store user data, product information, and other website content.
### *Content management systems (CMS)*: 
   Popular CMS platforms like WordPress and Drupal use MySQL to store website content and user data.
### *Data analysis and reporting*:
   MySQL can be used to store and analyze data for various purposes, such as business intelligence, market research, and scientific research.

If you're looking for a powerful, flexible, and easy-to-use database management system, MySQL is a great option. It's a popular choice for a wide range of applications, from small personal projects to large enterprise systems.


## Purposes:

MySQL is a popular open-source relational database management system (RDBMS) that uses SQL as its query language. Its main purposes include:

### 1. *Data Storage and Retrieval:* 
MySQL is designed to efficiently store and retrieve data. It allows users to create, modify, and query databases to manage large sets of structured information.

### 2. *Data Security:* 
MySQL provides authentication and access control mechanisms, ensuring that only authorized users can access and modify the data. This is crucial for protecting sensitive information.

### 3. *Scalability:* 
MySQL can handle a large amount of data and is scalable to accommodate growing datasets. It is suitable for both small-scale applications and large enterprise-level systems.

### 4. *Concurrency Control:* 
MySQL manages multiple users accessing the database simultaneously. It employs various techniques to ensure data consistency and integrity even when multiple users are making changes concurrently.

### 5. *Data Integrity:* 
MySQL supports the definition of relationships between tables, enforcing referential integrity. This ensures that the data in the database remains accurate and consistent.

### 6. *Performance Optimization:* 
It includes features like indexing, caching, and query optimization to enhance performance. These optimizations help in executing queries faster, especially in large datasets.

### 7. *Reliability and Availability:* 
MySQL is known for its reliability and uptime. It provides features like replication and clustering to ensure high availability and fault tolerance.

### 8. *Community Support:*
Being open-source, MySQL has a large and active community that contributes to its development and provides support. This community-driven approach ensures continuous improvement and a wealth of resources for users.

Understanding these aspects can help users leverage MySQL effectively for their data storage and retrieval needs, whether it's for a small project or a large-scale enterprise application.

## Advantages & Disadvantages:

### *Advantages of MySQL:*

1. *Open Source:* MySQL is free to use and is open-source, making it cost-effective for small businesses and individuals.

2. *Community Support:* It has a large and active community, providing extensive documentation, tutorials, and forums for support.

3. *Scalability:* MySQL can handle large amounts of data and is scalable, making it suitable for both small projects and large-scale applications.

4. *Performance:* With features like indexing and caching, MySQL is optimized for quick query execution, contributing to good performance.

5. *Cross-Platform Compatibility:* It is compatible with various operating systems, making it versatile for different environments.

6. *Data Security:* MySQL provides robust authentication and access control mechanisms, ensuring data security.

7. *Reliability:* It is known for its reliability and uptime, making it suitable for mission-critical applications.

### *Disadvantages of MySQL:*

1. *Limited Functionality for Complex Transactions:* While MySQL is powerful, it may have limitations for complex transactions compared to some other enterprise-level databases.

2. *Lack of Advanced Features:* Some advanced features available in other databases (e.g., Oracle) might be missing in MySQL.

3. *Storage Engine Dependency:* The choice of storage engine can impact certain features, and not all engines may be suitable for every use case.

4. *Not Ideal for Large Text Handling:* Handling large text fields (BLOBs, CLOBs) may not be as efficient in MySQL compared to other databases.

5. *Single Master Replication:* The replication mechanism in MySQL traditionally follows a single master approach, which might limit scalability in some scenarios.

6. *Commercial Support:* While there is a strong community, commercial support options for MySQL might not be as extensive as for some proprietary databases.

7. *Complex Configuration:* Some users find the initial configuration and setup of MySQL to be complex, especially for those new to database management systems.


Understanding these pros and cons can help users make informed decisions based on their specific requirements and project needs.


## How its works!

### Database Basics:

- *USE database_name*: Selects a database to work with.
- *SELECT FROM table_name*: Retrieves all columns and rows from a table.
- *SELECT specific_columns FROM table_name*: Fetches only specified columns.
- *WHERE clause*: Filters results based on certain conditions.
- *ORDER BY clause*: Sorts results in ascending or descending order.
- *DISTINCT keyword*: Eliminates duplicate rows.

### Joining Tables:

- *INNER JOIN*: Combines rows from two tables based on a shared column.
- *LEFT JOIN*: Includes all rows from the left table, even if there's no match in the right table.
- *RIGHT JOIN*: Includes all rows from the right table, even if there's no match in the left table.
- *UNION*: Combines results from two tables, removing duplicates.

### Inserting, Updating, Deleting Data:

- *INSERT INTO*: Adds new rows to a table.
- *UPDATE*: Modifies existing rows.
- *DELETE*: Removes rows.

### Aggregate Functions:

- *SUM, COUNT, AVG, MAX, MIN*: Perform calculations on groups of rows.
- *GROUP BY clause*: Groups rows together based on shared values.
- *HAVING clause*: Filters groups based on aggregate function results.

### Subqueries:

Nested SELECT statements: Used for complex filtering and data retrieval.
### Views:

- *Virtual tables*: Simplify complex queries and hide underlying table structures.

### Stored Procedures:

- Reusable blocks of SQL code stored within the database.

### Additional Topics Covered:

- Date functions
- Conditional logic (IF, CASE)
- String manipulation
- NULL value handling


## How its works!

### Database Basics:

- *USE database_name*: Selects a database to work with.
- *SELECT FROM table_name*: Retrieves all columns and rows from a table.
- *SELECT specific_columns FROM table_name*: Fetches only specified columns.
- *WHERE clause*: Filters results based on certain conditions.
- *ORDER BY clause*: Sorts results in ascending or descending order.
- *DISTINCT keyword*: Eliminates duplicate rows.

### Joining Tables:

- *INNER JOIN*: Combines rows from two tables based on a shared column.
- *LEFT JOIN*: Includes all rows from the left table, even if there's no match in the right table.
- *RIGHT JOIN*: Includes all rows from the right table, even if there's no match in the left table.
- *UNION*: Combines results from two tables, removing duplicates.

### Inserting, Updating, Deleting Data:

- *INSERT INTO*: Adds new rows to a table.
- *UPDATE*: Modifies existing rows.
- *DELETE*: Removes rows.

### Aggregate Functions:

- *SUM, COUNT, AVG, MAX, MIN*: Perform calculations on groups of rows.
- *GROUP BY clause*: Groups rows together based on shared values.
- *HAVING clause*: Filters groups based on aggregate function results.

### Subqueries:

Nested SELECT statements: Used for complex filtering and data retrieval.
### Views:

- *Virtual tables*: Simplify complex queries and hide underlying table structures.

### Stored Procedures:

- Reusable blocks of SQL code stored within the database.

### Additional Topics Covered:

- Date functions
- Conditional logic (IF, CASE)
- String manipulation
- NULL value handling

### How to Select Database
```sql
 USE <Dbname> || use <Dbname>
USE mydb || use mydb
```

### How to Select all Table fields in Database using "*" 
- First Select Database
- Select table
- Also use semicolon ; at the end of each statement

```sql
USE mydb;
SELECT * FROM customer;
```

### How to Select and filter a specific row using WHERE Clause
```sql
USE mydb;
SELECT * 
FROM customer
WHERE customer_id = 5;
```

### How to Select Table and sort using First_name with ORDER BY Clause
```sql
USE mydb;
SELECT * 
FROM customer
-- WHERE customer_id = 5  "--" Double Hyphen is used to comment something
ORDER BY first_name;

```
### How to Select a specific fields with field name
```sql
SELECT first_name, last_name , points FROM customer;
```

### How to Select a specific fields with field name and calculate something in run time
```sql
SELECT first_name, last_name , points, points+10 FROM customer;

```
### Select specific field and calculate something but change calculated name in run time with AS Alias
```sql
SELECT first_name, last_name , points, (points+10)*100 AS discount_factor FROM customer;
```

### if you want to add Space in Alias name
```sql
SELECT first_name, last_name , points, (points+10)*100 AS 'Discount Factor' FROM customer;
```

### How to select only unique and non duplicate value 
```sql
SELECT DISTINCT city FROM customer;
```
- Make sure if you use SELECT DISTINCT first_name, city FROM customer it means both first_name and city
must be distinct.
- It does not mean that only the city column should be distinct.


### How to filter with WHERE Clause
```sql
SELECT * FROM customer WHERE points>1500;
``` 
- filter those records whose points are greater than 1500
- Also you should use these operators >,<,>=,<=,!=, <> 

### How to filter string matched record with WHERE Clause
```sql
SELECT * FROM customer WHERE city = 'karachi'; 
```

### How to filter those records which does not contain string 'karachi'
```sql
SELECT * FROM customer WHERE city != 'karachi'; 
or 
SELECT * FROM customer WHERE city <> 'karachi';
```

### How to filter those records whose birth_date > 2023-08-07
```sql
SELECT * FROM customer WHERE birth_date > '2023-08-07';
```

### How to filter those records whose birth_date > 2023-08-07 and Points > 1500
- We use AND operator it return true if both condition meets true
```sql
SELECT * FROM customer WHERE birth_date > '2023-08-07' AND points > 1500;
```

### How to filter those records whose birth_date > 2023-08-07 OR Points > 1500
- We use OR operator it return true if at least one  condition meets true
```sql
SELECT * FROM customer WHERE birth_date > '2023-08-07' OR points > 1500;
```

### How to filter those records whose birth_date > 2023-08-07 is NOT Greater than 
- We use NOT operator to reverse
```sql
SELECT * FROM customer WHERE NOT(birth_date > '2023-08-07' OR points > 1500);
```

### How to filter those records whose birth_date > 2023-08-07 OR Points > 1500 AND city ="kohat"
- We use OR and AND both to add multiple conditions
```sql
SELECT * FROM customer WHERE birth_date > '2023-08-07' OR (points > 1500 AND city = 'kohat');
```

### How to select those result whose city is kohat or karachi
- We use IN operator, we can also use OR operator but IN operator is shorter and it works like OR operator
```sql
SELECT * FROM customer WHERE city IN ('karachi','kohat');

```
### How to select those result whose city is not in kohat or karachi
- We use NOT IN operator
```sql
SELECT * FROM customer WHERE city NOT IN ('karachi','kohat');
```

### How to select those points >= 1000 and <= 1500
- We use BETWEEN operator, note we can also use >=  <= operators but BETWEEN is shorter
```sql
SELECT * FROM customer WHERE points BETWEEN 1000 AND 1500;
```

### How to select those rows that matched with specific string pattern using LIKE operator
- we use WHERE last_name LIKE 's%' it means last_name must be start with s but after s it contain any letters.
```sql
SELECT * FROM customer WHERE last_name LIKE 's%';
SELECT * FROM customer WHERE last_name LIKE 'summer%'; //start with summer ends with any letter
```

### change the pattern in LIKE operator
```sql
SELECT * FROM customer WHERE last_name LIKE '%s';// start with any  letter but ends with s
SELECT * FROM customer WHERE last_name LIKE '%s%';// start with any  letter and ends with any letter but s letter can be any
where
```

### Use underscore to define how many letters end with that pattern
```sql
SELECT * FROM customer WHERE last_name LIKE '_______s'
```

### we can also specify first and last letter and Between letters range with "__"  underscore
```sql
SELECT * FROM customer WHERE last_name LIKE 'v______s'
```

### use  REGEXP to use complex string pattern
- Look we use like operator
```sql
SELECT * FROM customer WHERE first_name LIKE '%hr%'
```
- we can also use REGEXP for more complex string patterns
```sql
SELECT * FROM customer WHERE first_name REGEXP 'hr'
```
### first_name must start with hr
```sql
SELECT * FROM customer WHERE first_name REGEXP '^ch'
```

### first_name must end with t
```sql
SELECT * FROM customer WHERE first_name REGEXP 't$'
```

### we can also use pipe operator | in REGEXP
```sql
SELECT * FROM customer WHERE first_name REGEXP '^ch|t$'
```
- it means first_name must start with ch 
- Or first_name must end with t


### we can also specify []
```sql
SELECT * FROM customer WHERE first_name REGEXP '[agc]t'
```
- first_name will be at, gt, ct anywhere

### we can change pattern
```sql
SELECT * FROM customer WHERE first_name REGEXP 't[agc]'
```
- first_name will be ta, tg, tc anywhere

### we can also specify range [a-h]
```sql
SELECT * FROM customer WHERE first_name REGEXP '[a-h]t'
```
- first_name will be at,bt,ct,dt,et,ft, gt, ht anywhere

### How to select those records whone phone no is NULL using "IS NULL" operator
```sql
SELECT * FROM customer WHERE phone IS NULL;
```
### How to select and sort data by column name 
- by default every column is sorted according  to primary key column
```sql
SELECT * FROM customer ORDER by first_name;
```
### We can also sort by multiple columns
```sql
SELECT * FROM customer ORDER by first_name, last_name;
```

### We can also sort by multiple columns in Descending order
```sql
SELECT * FROM customer ORDER by first_name DESC, last_name ASC;
```

### How  to Select first 10 records using "LIMIT" Clause
```sql
SELECT * FROM customer LIMIT 10;
```

### How to skip  first 10 records using "LIMIT" Clause and select 3 records before 10 records
- we define offset 10 , 3
```sql
SELECT * FROM customer LIMIT 10 , 3;
```
### How to select one table with relationship to another table using "INNER JOIN"
- lets we have orders table in orders table we have customer_id which is a foriegn key to customer table
-  In Orders table we have  orders_id, customer_id, status, comments
- In Customer table we have customer_id, first_name, last_name, birth_date, phone, address, city and state
- We want to inner join with orders table and customer table
```sql
SELECT * FROM orders INNER JOIN customerON orders.customer_id  = customer.customer_id;
```

### We can also achieve "INNER JOIN" with implicit Syntax
```sql
SELECT * FROM orders o, customers c WHERE o.customer_id  = c.customer_id;

```

### How to find only select first_name, city and phone from customer table 
```sql
SELECT order_id, orders.customer_id first_name, phone, city 
FROM orders 
INNER JOIN customer
ON 
orders.customer_id  = customer.customer_id;

```
### We can also use alias in inner join
```sql
SELECT order_id, o.customer_id first_name, phone, city 
FROM orders o
INNER JOIN customer c
ON 
o.customer_id  = c.customer_id;
```

### We to join tables across Databases 
- suppose we have a Database name inventory
- In the inventory db we have products table
- this product table is associated with orders_items 
- we can easily join using db.table name
```sql
select * 
FROM orders_items oi
INNER JOIN inventory.products p
ON
oi.product_id = p.product_id;
```

### How to select only selected name, quantity from products table 
```sql
select oi.product_id, unit_price, name
FROM orders_items oi
INNER JOIN inventory.products p
ON
oi.product_id = p.product_id;
```
### How to Select Self join table itself 
- Suppose we have employe table we want to check who is manager in our complany
- But the best thing is manager is itself an employe of this complany
```sql
SELECT *
FROM employees m
JOIN employees e
ON
 e.reports_to = m.employee_id;
```

### How to Select Self join table itself 
- only want to check the manager
```sql
SELECT 
e.employee_id,
e.first_name,
m.first_name as Manager
FROM employees m
JOIN employees e
ON
 e.reports_to = m.employee_id;
```

### How to JOIN multiple tables
- We have three tables orders, order_status and customer we want to join
```sql
SELECT *
FROM orders o
JOIN customer c
ON
o.customer_id = c.customer_id
JOIN order_status os
ON os.status_is = o.status;
```
### Lets Extract Beautifully
```sql
SELECT 
o.order_id,
o.order_date,
c.first_name,
c.last_name,
os.name AS Status
FROM orders o
JOIN customer c
ON
o.customer_id = c.customer_id
JOIN order_status os
ON os.status_is = o.status;
```
### Compound Join
- we can combine two fields to unique identify row
```sql
SELECT * 
FROM orders_items oi
JOIN order_notes oin
ON
oi.order_id = oin.order_id
AND
oi.product_id = oin.product_id;
```
### leFT Join
- Left outer join select those records which are not
- like in our example we also select those customers who don't have any order as well as who do
```sql
SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customer c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id 

```
### Right Join
- Right outer join select those records which satisfy the condition
- like in our example we only select those customers who have orders
```sql
SELECT 
c.customer_id, 
c.first_name, 
o.order_id 
FROM customer c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id 
```

### USING Clause
- USING Clause can replace JOIN complex steps
- But it can only work when both table have same column name
```sql
SELECT 
o.order_id,
c.first_name
FROM orders o 
JOIN customer c
-- ON o.customer_id = c.first_name
USING (customer_id);
```


### Cross JOIN
- combine every record from first table to second table
- WE combine every record from customer table to products table
```sql
SELECT 
c.first_name AS customer,
p.name AS product 
FROM customer c
CROSS JOIN inventory.products p 
ORDER BY c.first_name;
```

### Combine tables rows with UNION
```sql
SELECT 
order_id,
order_date,
'Active' AS status
FROM orders
WHERE order_date >= '2023-11-09'
UNION
SELECT 
order_id,
order_date,
'Archived' AS status
FROM orders
WHERE order_date < '2023-11-09'
```

### INSERT RECORDS
```sql
INSERT INTO customer (
    customer_id,
    first_name,
    last_name,
    birth_date,
    phone,
    address,
    city,
    state,
    points
) VALUES (
    52,
    'Ahmed',
    'Raheem',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Punjab',
    DEFAULT
);
```

### INSERT Multiple RECORDS
```sql
INSERT INTO customer (
    customer_id,
    first_name,
    last_name,
    birth_date,
    phone,
    address,
    city,
    state,
    points
) VALUES (
    53,
    'Ishaque',
    'Chaiwala',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Sindh',
    DEFAULT
),
(
    54,
    'Muhammad',
    'Mowahid',
    NULL,
    NULL,
    'Azad Chaiwala Institute',
    'Rawalpindi',
    'Punjab',
    DEFAULT
);

```
### INSERT Hierarchical RECORDS
```sql
INSERT INTO customer(customer_id,first_name,last_name,birth_date)
VALUES (DEFAULT,'IGI','ORIGIN','2023-12-25');

INSERT INTO orders(order_id,order_date, status,c_id)
VALUES(DEFAULT,'2023-12-25',1,LAST_INSERT_ID());

INSERT INTO
orders_items(order_items_id,order_id,product_id,unit_price,quantity)
VALUES (DEFAULT,LAST_INSERT_ID(),9,35,3);

```
### Creating Copy of a Table
```sql
CREATE TABLE orders_archived  AS
SELECT * FROM orders;
```


### Insert only data from one table to another
```sql
INSERT INTO orders_archived
SELECT * from orders WHERE order_date > '2023-12-01';
```

### Updating Single Record
```sql
UPDATE customer 
SET first_name="Muhammad", last_name="Hashim", birth_date="2023-12-30"
WHERE customer_id = 1;
```
### Update multiple Records
```sql
UPDATE orders_items
SET unit_price=50.57, quantity = 5
WHERE order_id = 1;
```


### Using subqueries in Update
```sql
UPDATE orders
SET comments = "Gold Customer"
WHERE c_id IN
                (SELECT customer_id
                 FROM customer
                 WHERE points > 1800);

```

### Using subqueries in Delete
```sql
DELETE FROM orders
WHERE c_id = (
			SELECT customer_id
			FROM customer 
			WHERE first_name = "Delano"
			 );

```

### Aggregate Functions
```sql
SELECT 
MAX(salary) AS Highest,
MIN(salary) AS lowest,
AVG(salary) AS average,
SUM(salary) AS total,
COUNT(salary) AS number_of_records
FROM employees;

```
### The GROUP By Clause in Aggregate Functions
```sql
SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
ORDER BY total_sales DESC;
```

### The GROUP By Clause with WHERE Clause in Aggregate Functions
```sql
SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC;
```
### The GROUP By Clause with inner JOIN in Aggregate Functions
```sql
SELECT 
name,
state,
city,
SUM(invoice_total) as total_sales
FROM invoices i
JOIN clients c USING(client_id)
GROUP BY state, city;

```
### The GROUP By Clause with inner JOIN in Aggregate Functions
```sql
SELECT date,
pm.name,
SUM(amount) AS total_amounts
FROM payments p
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id
GROUP BY date
ORDER BY date DESC;
```
### Having Clause with Aggregate Functions
```sql
SELECT 
client_id,
COUNT(*) AS number_of_invoices,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500;

```

### Having Clause with Aggregate Functions
```sql
SELECT 
client_id,
COUNT(*) AS number_of_invoices,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5;


```
### Aggregate functions WITH ROLLUP
```sql
SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id WITH ROLLUP;
```
### Aggregate functions WITH ROLLUP and JOIN
```sql
SELECT 
state,
city,
SUM(invoice_total) as total_sales
FROM invoices i
JOIN clients c USING(client_id)
GROUP BY state, city WITH ROLLUP;
```

### Write more about subqueries
- expensive than lettuce (id = 3)
- MySQL first execute innersubquery than pass it to out query
```sql
SELECT * 
FROM products 
WHERE unit_price > (
SELECT unit_price
FROM products
WHERE product_id = 3
);
```
### Write more about subqueries
- In Sql_hr database
- find employees who earn more than average 
```sql
SELECT * FROM
employees WHERE salary > (
SELECT AVG(salary)
    FROM employees
);
```
### Write more about subqueries using IN operator
- find that product that have never been ordered 
```sql
SELECT * FROM products
WHERE product_id NOT IN (
SELECT DISTINCT product_id
FROM order_items
);
```
### Write more about subqueries using IN operator
- find clients without invoices
```sql
SELECT * 
FROM clients 
WHERE client_id NOT IN (
SELECT DISTINCT client_id
FROM invoices
);
```
## join vs sub query
### using subqueries
- find customer who have ordered lettuce
- select customer_id , first_name, last_name
```sql
SELECT customer_id,
first_name,
last_name
FROM customers 
WHERE customer_id IN(
SELECT o.customer_id   
FROM order_items oi
JOIN orders o USING (order_id)
    WHERE product_id = 3
);
```
### using JOIN
```sql
SELECT DISTINCT customer_id,
first_name,
last_name
FROM customers c 
JOIN orders o USING(customer_id)
JOIN order_items oi USING(order_id)
WHERE oi.product_id = 3;
```
### without ALL keyword
- select invoices larger than all invoices of client 3
```sql
SELECT *
FROM invoices 
WHERE invoice_total >(
SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3 
);
```
### ALL keyword
```sql
SELECT *
FROM invoices 
WHERE invoice_total > ALL(
SELECT invoice_total
    FROM invoices
    WHERE client_id = 3 
);
```
### Correlated subqueries
- For each employe
- calculate the avg salary for employee.office
- return the employee if salary > avg
```sql
SELECT * 
FROM employees e 
WHERE salary > (
	SELECT AVG(salary)
    FROM employees 
    WHERE office_id = e.office_id
);

```
### The EXISTS operator
- Select client that have an invoice

- one method 
```sql
Select *
FROM clients
WHERE client_id IN (
    select DISTINCT client_id
    FROM invoices
);
```
- second method
```sql
SELECT *
FROM clients
INNER JOIN (
    SELECT DISTINCT client_id
    FROM invoices
) AS distinct_clients
ON clients.client_id = distinct_clients.client_id;
```
- third method
```sql
Select *
FROM clients c
WHERE EXISTS (
    select client_id
    FROM invoices
    WHERE client_id = c.client_id
);
```
### Date Functions to check dynamically current Year orders
```sql
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW());
```
### FORMAT_DATE Function
```sql
SELECT DATE_FORMAT(order_date,'%D %M %Y')
FROM orders;
```
### ADDING DATE Function
```sql
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;
```
### IFNULL Function
```sql
SELECT 
order_id,
shipper_id
FROM orders;

SELECT 
order_id,
IFNULL(shipper_id,'Not Assigned') AS shipper
FROM orders;
```
### COALESCE Function
```sql
SELECT 
order_id,
COALESCE(shipper_id,comments,'Not Assigned') AS shipper
FROM orders;

SELECT 
order_id,
IFNULL(shipper_id,'...') AS shipperID,
COALESCE(shipper_id,comments,'Not Assigned') AS shipper
FROM orders;
```
### IF Function
```sql
SELECT 
    order_id,
    order_date,
    IF(YEAR(order_date) = YEAR(NOW()), 'Active', 'Archived') AS order_status
FROM orders;
```

### CASE  Operator
```sql
SELECT 
    order_id,
    CASE
    WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
    WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last Year'
    WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'Archived'
    ELSE 'Future'
    END AS Category
FROM orders;
```

### Practice
```sql
SELECT 
CONCAT(first_name,' ',last_name) AS Customer,
points,
CASE
	WHEN points > 3000 THEN 'Gold Customer'
    WHEN points >= 2000 THEN 'Silver Customer'
	ELSE 'Bronze Customer'
    END AS category
FROM customers;
```
### Creating View
```sql
CREATE VIEW sales_by_client AS 
SELECT 
c.client_id,
c.name,
SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name;
```
### Drop View
```sql
DROP VIEW invoices_with_balance;
```
### Updatable View
- DISTINCT
- Aggregate functions (MIN , MAX, SUM) etc
- GROUP BY / HAVING
- UNION
- If we dont have these in mention above
- than our view is Updatable view
``` sql
CREATE OR REPLACE VIEW invoices_with_balance AS
	SELECT 
	invoice_id,
	number,
	client_id,
	invoice_total,
	payment_total,
	invoice_total - payment_total AS balance,
	invoice_date,
	payment_date,
	due_date
	FROM invoices
    WHERE (invoice_total-payment_total) > 0;

DELETE FROM invoices_with_balance
WHERE invoice_id = 1;
```
- prevent view as only read-only 
- add WITH check OPTION;
```sql
CREATE OR REPLACE VIEW invoices_with_balance AS
	SELECT 
	invoice_id,
	number,
	client_id,
	invoice_total,
	payment_total,
	invoice_total - payment_total AS balance,
	invoice_date,
	payment_date,
	due_date
	FROM invoices
    WHERE (invoice_total-payment_total) > 0
    WITH check OPTION;

```
### Creating Store Procedure
```sql
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END$$
DELIMITER ;
```
### Select Procedure
```sql
CALL get_clients()
```
### Dropping Procedure
```sql
DROP Procedure IF EXISTS get_clients;
```
### Parameters in Procedure
```sql
DROP PROCEDURE IF EXISTS get_clients_by_states;
DELIMITER $$
CREATE PROCEDURE get_clients_by_states
	(
        state CHAR(2)
    )
	BEGIN
    SELECT * FROM clients c
    WHERE c.state = state;
	END$$
DELIMITER ;


CALL get_clients_by_states('CA');

```
### Parameters with defaults values in Procedure
```sql
DELIMITER $$
CREATE PROCEDURE get_clients_by_default_states
	(
        state CHAR(2)
    )
	BEGIN
    IF state IS NULL THEN
        state = 'CA';
    END IF;
    SELECT * FROM clients c
    WHERE c.state = state;
	END$$
DELIMITER ;


CALL get_clients_by_default_states(NULL)

```
### Parameters with IF ELSE  in Procedure
```sql
DELIMITER $$
CREATE PROCEDURE get_clients_by_default_states
	(
        state CHAR(2)
    )
	BEGIN
    IF state IS NULL THEN
        select * from clients;
    ELSE
            SELECT * FROM clients c
            WHERE c.state = state;
    END IF;
	END$$
DELIMITER ;


CALL get_clients_by_default_states(NULL)
CALL get_clients_by_default_states('CA')
```

### Practice Procedure
- Write a stored procedure call  get_payments
- with two Parameters
-  client_id => id(5)
- payment_method_id => TINYINT(1) 0-255
```sql
DELIMITER $$
CREATE PROCEDURE get_payments
    (
        client_id INT,
        payment_method_id TINYINT(1)
    )
BEGIN
    SELECT * 
    from payments p
    WHERE 
    p.client_id = IFNULL(client_id, p.client_id) AND
    p.payment_method = IFNULL(payment_method_id,p.payment_method);
END
DELIMITER ;


CALL get_payments(NULL,NULL);
CALL get_payments(5,NULL);
CALL get_payments(5,2);
CALL get_payments(NULL,2);

```
### Update in  Procedure
```sql
DELIMITER $$
CREATE PROCEDURE make_payments
    (
        invoice_id INT,
        payment_total DECIMAL(8,2),
        payment_date DATE
    )
BEGIN
    UPDATE invoices i
    SET 
    i.payment_total = payment_total,
    i.payment_date = payment_date
    WHERE i.invoice_id = invoice_id;
END$$
DELIMITER ;


CALL make_payments(2,2223.823,'2023-01-07');

```
### Update with validation  in  Procedure
- Error Code link
- https://www.ibm.com/docs/en/db2-for-zos/11?topic=codes-sqlstate-values-common-error
```sql
DELIMITER $$
CREATE PROCEDURE make_validate_payments
    (
        invoice_id INT,
        payment_total DECIMAL(8,2),
        payment_date DATE
    )
BEGIN
	IF payment_total <= 0 THEN
    	SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = "Invalid Payment Amounts";     
    END IF;
    UPDATE invoices i
    SET 
    i.payment_total = payment_total,
    i.payment_date = payment_date
    WHERE i.invoice_id = invoice_id;
END$$
DELIMITER ;

CALL make_validate_payments(2,-2223.823,'2023-01-07');

```









