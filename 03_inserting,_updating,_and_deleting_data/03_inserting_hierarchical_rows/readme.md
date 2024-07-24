# Hierarchical Records Insertion 

```sql
USE sql_store;

-- Step 1: Insert into customers table
INSERT INTO customers(first_name, last_name)
VALUES ('Call Of Duty', 'Ghosts');

-- Debug: Retrieve and display the last inserted customer_id
SET @customer_id = (SELECT customer_id FROM customers ORDER BY customer_id DESC LIMIT 1);
SELECT @customer_id;

-- Step 2: Insert into orders table with the retrieved customer_id
INSERT INTO orders(order_date, status, customer_id)
VALUES ('2023-12-25', 1, @customer_id);

-- Debug: Retrieve and display the last inserted order_id
SET @order_id = LAST_INSERT_ID();
SELECT @order_id;

-- Step 3: Insert into order_items table with the retrieved order_id
INSERT INTO order_items(order_id, product_id, unit_price, quantity)
VALUES (@order_id, 7, 35, 3);
```
# Inserting Hierarchical Records in SQL

This guide explains how to insert hierarchical records into an SQL database using foreign key constraints to maintain relationships between tables. We will use a simple example involving customers, orders, and order items.

## Prerequisites

- A MySQL database named `sql_store`.
- Tables: `customers`, `orders`, and `order_items` with the appropriate foreign key constraints.

## Step-by-Step Instructions

### Step 1: Insert a New Customer

First, we insert a new customer into the `customers` table. This table should have an `AUTO_INCREMENT` column for `customer_id`.

```sql
USE sql_store;

INSERT INTO customers(first_name, last_name)
VALUES ('Call Of Duty', 'Ghosts');
```

### Step 2: Retrieve the Last Inserted Customer ID

After inserting the new customer, we need to retrieve the `customer_id` of the newly inserted record. We use a subquery to get the highest `customer_id` (which corresponds to the last inserted customer).

```sql
SET @customer_id = (SELECT customer_id FROM customers ORDER BY customer_id DESC LIMIT 1);
SELECT @customer_id;
```

### Step 3: Insert a New Order

Using the retrieved `customer_id`, we insert a new order into the `orders` table.

```sql
INSERT INTO orders(order_date, status, customer_id)
VALUES ('2023-12-25', 1, @customer_id);
```

### Step 4: Retrieve the Last Inserted Order ID

Next, we need to retrieve the `order_id` of the newly inserted order. We use `LAST_INSERT_ID()` for this purpose.

```sql
SET @order_id = LAST_INSERT_ID();
SELECT @order_id;
```

### Step 5: Insert Order Items

Finally, using the retrieved `order_id`, we insert a new order item into the `order_items` table.

```sql
INSERT INTO order_items(order_id, product_id, unit_price, quantity)
VALUES (@order_id, 7, 35, 3);
```

## Complete Example Script

```sql
USE sql_store;

-- Step 1: Insert into customers table
INSERT INTO customers(first_name, last_name)
VALUES ('Call Of Duty', 'Ghosts');

-- Debug: Retrieve and display the last inserted customer_id
SET @customer_id = (SELECT customer_id FROM customers ORDER BY customer_id DESC LIMIT 1);
SELECT @customer_id;

-- Step 2: Insert into orders table with the retrieved customer_id
INSERT INTO orders(order_date, status, customer_id)
VALUES ('2023-12-25', 1, @customer_id);

-- Debug: Retrieve and display the last inserted order_id
SET @order_id = LAST_INSERT_ID();
SELECT @order_id;

-- Step 3: Insert into order_items table with the retrieved order_id
INSERT INTO order_items(order_id, product_id, unit_price, quantity)
VALUES (@order_id, 7, 35, 3);
```

## Notes

- Ensure that the `customers`, `orders`, and `order_items` tables are created with the appropriate foreign key constraints to enforce the relationships between these entities.
- If any step fails, check the foreign key constraints and data integrity to ensure that all referenced records exist.
