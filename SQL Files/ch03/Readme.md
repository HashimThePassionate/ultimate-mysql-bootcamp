#                               p18-join.sql

- This SQL code retrieves specific information about items within orders from a database. It combines data from two tables: order_items and products.

```sql
SELECT order_id, oi.product_id, name, quantity, oi.unit_price
FROM order_items oi
     JOIN products p ON oi.product_id = p.product_id;
```
## Explaination;

### SELECT clause:

- order_id: Retrieves the unique identifier for each order.
- oi.product_id: Fetches the product ID for each order item.
- name: Retrieves the product name from the products table.
- quantity: Gets the quantity of each product ordered.
- oi.unit_price: Obtains the unit price of each product from the order_items table.

### FROM clause:

- order_items oi: Specifies the order_items table as a source of data, and it's given the alias oi for convenience.

### JOIN clause:

- JOIN products p ON oi.product_id = p.product_id: Combines data from the products table (p) with the order_items table (oi) based on matching product IDs. This creates a result set with information from both tables.

### Output:

- *The query will produce a table containing the following columns*:
- order_id: The ID of each order.
- product_id: The ID of each product within the order.
- name: The name of the product.
- quantity: The quantity of the product ordered.
- unit_price: The unit price of the product.

### Example Output:

```sql
order_id	product_id	  name	   quantity	   unit_price
1234	       55	    Widget A	  2	         9.99
1235	       62	    Gadget B	  1	        14.99
1234	       78	    Widget C	  3	         7.99
```
### This output shows that:

- Order 1234 has two items: 2 of Widget A and 3 of Widget C.
- Order 1235 has one item: 1 of Gadget B.
- The unit prices and product names are retrieved from the products table.





#                               p21-join_multiple_tables.sql

- This code is designed to retrieve a specific set of payment details from a database.

```sql
SELECT
    p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name AS payment_method
FROM payments p
     JOIN payment_methods pm
       ON p.payment_method = pm.payment_method_id
     JOIN clients c
       ON p.client_id = c.client_id;
```


## Explaination;

### 1.SELECT Statement:

- This is the core command that initiates the data retrieval process.
- It specifies which columns (fields) to extract from the database.
### 2.Columns to Retrieve:

- p.date: The date of the payment.
- p.invoice_id: The unique identifier of the invoice associated with the payment.
- *p.amount*: The monetary value of the payment.
- *c.name*: The name of the client who made the payment.
- *pm.name AS payment_method*: The name of the payment method used, labeled as "payment_method".
### 3.Tables Involved:

- payments p: The primary table containing payment data.
- payment_methods pm: A table storing information about different payment methods.
- clients c: A table holding client information.
### 4.JOIN Operations:

- *JOIN payment_methods pm ON p.payment_method = pm.payment_method_id*: This joins the payments table with the payment_methods table, linking them based on matching payment method IDs. This allows you to retrieve the payment method name alongside payment details.
- *JOIN clients c ON p.client_id = c.client_id*: This joins the payments table with the clients table, connecting them based on matching client IDs. This enables you to include client names in the retrieved data.
### Output:

The code will produce a result set with the following columns:
- Date
- Invoice ID
- Amount
- Client Name
- Payment Method
### Summary:

This SQL query effectively combines data from three related tables (payments, payment_methods, and clients) to create a comprehensive view of payment information, including payment details, payment methods, and associated client names.





#                               p24-outer_join.sql


```sql
SELECT
    p.product_id,
    p.name,
    oi.quantity
FROM order_items oi
     RIGHT JOIN products p
       ON p.product_id = oi.product_id;

SELECT
    p.product_id,
    p.name,
    oi.quantity
FROM products p
     LEFT JOIN order_items oi
       ON p.product_id = oi.product_id;
```

## Explaination;

- The two queries you provided are both SQL queries that join two tables, products and order_items, based on the product_id column. 

### However, they use different types of joins:

- *Right join*: The first query uses a right join. This means that all rows from the right table (order_items) will be included in the result, even if there is no matching row in the left table (products). For any rows in the left table that don't have a match in the right table, the columns from the right table will be filled with NULL values.

- *Left join*: The second query uses a left join. This means that all rows from the left table (products) will be included in the result, even if there is no matching row in the right table (order_items). For any rows in the right table that don't have a match in the left table, the columns from the right table will be filled with NULL values.

### Here are some additional details about the queries:

- Both queries select the product_id, name, and quantity columns.
- The ON clause in both queries specifies that the join should be based on the product_id column in both tables.
### Here is a table that shows the results of both queries:

```sql
Query	          Result
-------------|--------------
Right join	
-------------|--------------
product_id	        name
-------------|--------------
             |
    1	     |      Apple
    2	     |       Banana
    3	     |       Orange
-------------|--------------

Left join	
-------------|--------------

product_id	        name
-------------|--------------
             |
    1	     |       Apple
    2	     |       Banana
    3	     |       Orange
    4	     |       Grapefruit
    5	     |       Mango
```

- As you can see, the right join only includes products that have been ordered, while the left join includes all products, even if they have not been ordered.





#                               p25-outer_join_between_Multiple_tables.sql



- This SQL code is designed to retrieve a specific set of information from a database related to orders, customers, shippers, and order statuses.

```sql
SELECT
    o.order_id,
    o.order_date,
    c.first_name AS customer,
    s.name AS shipper,
    os.name AS status
FROM
    orders o
    LEFT JOIN customers c
      ON o.customer_id = c.customer_id
    LEFT JOIN shippers s
      ON o.shipper_id = s.shipper_id
    LEFT JOIN order_statuses os
      ON o.status = os.order_status_id;
```

## Key Components:

### 1.SELECT Clause:

Specifies the columns to be retrieved from the database:
o.order_id: The unique ID of each order.
o.order_date: The date when each order was placed.
c.first_name AS customer: The first name of the customer associated with each order (aliased as "customer").
s.name AS shipper: The name of the shipper responsible for each order (aliased as "shipper").
os.name AS status: The name of the order status for each order (aliased as "status").
### 2.FROM Clause:

Lists the main table involved in the query:
orders o: The table containing order data, assigned the alias "o" for shorthand.
### 3.LEFT JOIN Clauses:

- *Combine data from multiple tables*:
- LEFT JOIN customers c ON o.customer_id = c.customer_id: Links customer information from the customers table to the orders table based on matching customer IDs.
- LEFT JOIN shippers s ON o.shipper_id = s.shipper_id: Links shipper information from the shippers table to the orders table based on matching shipper IDs.
- LEFT JOIN order_statuses os ON o.status = os.order_status_id: Links order status information from the order_statuses table to the orders table based on matching status IDs.
### 4.Specifics of LEFT JOIN:

- It includes all rows from the orders table (the main table), even if there are no matching rows in the joined tables.
- This ensures that all orders are included in the results, even if certain details (like customer, shipper, or status) might be missing for some orders.
### Output:

The query produces a result set with the following columns:
- order_id
- order_date
- customer (first name of the customer)
- shipper (name of the shipper)
- status (name of the order status)

### Example:

If executed within a database containing relevant data, this query might produce a result like this:
```sql
order_id | order_date  | customer  | shipper   | status
---------|--------------|-----------|-----------|--------
1234     | 2024-01-05   | John      | Acme Inc. | Shipped
5678     | 2024-01-06   | Jane      | Speedy Co.| Processing
9012     | 2024-01-07   | NULL      | NULL       | Pending

```

- It's important to ensure that the tables being joined have appropriate relationships (shared columns) for accurate results.
Consider using aliases for table names to make the query more readable, especially when dealing with multiple joins.






#                               p27-using_clause.sql

```sql
USE sql_invoicing;

SELECT
    p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM
    payments p
    JOIN clients c
      USING (client_id)
    JOIN payment_methods pm
      ON p.payment_method = pm.payment_method_id;

```
## Explaination;


### 1. Database Selection:

USE sql_invoicing;

This line tells the database system to use the database named "sql_invoicing" for this query.
### 2. Data Retrieval:

**SELECT ...**
- This initiates the data retrieval process.
- p.date, c.name AS client, p.amount, pm.name AS payment_method

**This specifies the columns to be retrieved from the tables**:
- *p.date*: The date of the payment (from the payments table)
- *c.name AS client*: The name of the client (from the clients table), aliased as "client"
- *p.amount*: The amount of the payment (from the payments table)
- *pm.name AS payment_method*: The name of the payment method (from the payment_methods table), aliased as "payment_method"

### 3. Table Joining:

- **FROM payments p**
This indicates the base table for the query is the payments table, and it's given an alias "p" for brevity.
- **JOIN clients c USING (client_id)**
This joins the clients table (aliased as "c") to the payments table using the shared column client_id. This links payment records with their corresponding client information.
- **JOIN payment_methods pm ON p.payment_method = pm.payment_method_id**
This joins the payment_methods table (aliased as "pm") to the payments table using the payment_method column in payments and the payment_method_id column in payment_methods. This adds payment method details to each payment record.

### 4. Result Output:

The query combines data from these tables, creating a result set with the following columns:
- *date*: The date of the payment
- *client*: The name of the client who made the payment
- *amount*: The amount of the payment
- *payment_method*: The name of the payment method used





#                               p29-cross_join.sql


```sql
USE sql_store;

-- Do a cross join between sippers and products
--   using the implicit syntax
SELECT
    s.name AS shipper,
    p.name AS product
FROM
    shippers s, products p
ORDER BY shipper;

--   and then using the explicit syntax
SELECT
    s.name AS shipper,
    p.name AS product
FROM
    shippers s CROSS JOIN products p
ORDER BY shipper;

```


## Explaination;

### 1. Selecting Database:

The code starts with USE sql_store; which instructs the database system to use the database named sql_store for subsequent queries.

### 2. Cross Join Operations:

The code performs two cross joins, both producing the same result but using different syntax:

**Implicit Syntax**:

SELECT s.name AS shipper, p.name AS product FROM shippers s, products p ORDER BY shipper;
The comma (,) between the table names implicitly creates a cross join.

### Explicit Syntax:

SELECT s.name AS shipper, p.name AS product FROM shippers s CROSS JOIN products p ORDER BY shipper;
The CROSS JOIN keyword explicitly specifies the type of join.

### 3. Cross Join Explanation:

A cross join combines every row from one table with every row from another table. It creates a Cartesian product, resulting in all possible combinations of rows.

### 4. Column Selection and Aliasing:

*SELECT s.name AS shipper, p.name AS product*:
This part selects specific columns from the joined tables:
- *s.name*: The name column from the shippers table
- *p.name*: The name column from the products table
The AS keyword creates aliases for the columns, making the output more readable.

### 5. Ordering Results:

**ORDER BY shipper**:
- This clause arranges the results in ascending order based on the values in the shipper column (which is an alias for s.name).
- In essence, both queries produce a list of all possible combinations of shipper names and product names from the shippers and products tables, sorted alphabetically by shipper name.




#                               p30-unions.sql





```sql
USE sql_store;

SELECT
    customer_id,
    first_name,
    points,
    'Bronze' AS type
FROM
    customers
WHERE
    points < 2000
UNION
SELECT
    customer_id,
    first_name,
    points,
    'Silver' AS type
FROM
    customers
WHERE
    points BETWEEN 2000 AND 3000
UNION
SELECT
    customer_id,
    first_name,
    points,
    'Gold' AS type
FROM
    customers
WHERE
    points > 3000
ORDER BY
    first_name;
```

## Explaination;

### 1.Database Selection:

- The query begins by specifying the database to use: USE sql_store;

### 2.Retrieving and Categorizing Customers:

*The query retrieves customer information from the customers table, along with a calculated 'type' based on their points*:
- *Bronze Customers*:
Selects customers with points less than 2000 and assigns them the 'Bronze' type.
- *Silver Customers*:
Selects customers with points between 2000 and 3000 and assigns them the 'Silver' type.
- *Gold Customers*:
Selects customers with points greater than 3000 and assigns them the 'Gold' type.
- *Combining Results*:

The UNION operator merges the results from the three separate selections into a single unified set of customer data.
- *Ordering Results*:

The ORDER BY first_name clause arranges the final results in alphabetical order based on the customers' first names.

### In essence, this query:

- Fetches customer data from a database.
- Categorizes customers into Bronze, Silver, and Gold tiers based on their points.
- Combines the categorized data into a single result set.
- Presents the results in alphabetical order by first name.




