# P41-aggregate_functions.sql

```sql
SELECT
    'First half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
    'Second half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-07-01' AND '2020-12-31'
UNION
	SELECT
    'Total' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total -payment_total ) AS what_we_expect
FROM
    invoices
WHERE 
    invoice_date BETWEEN '2019-01-01' AND '2020-12-31';
```

## Explaination;

Here are the steps involved in the process:

- **1.Filter data**: The query filters the invoices table based on the invoice_date.
- For the first half of 2019, it selects invoices where the invoice_date is between 2019-01-01 and 2019-06-30.
- For the second half of 2019, it selects invoices where the invoice_date is between 2019-07-01 and 2019-12-31.
- For the total, it selects invoices where the invoice_date is between 2019-01-01 and 2019-12-31.
**Calculate aggregations**: The query calculates the following aggregations for each date range:
- SUM(invoice_total): This calculates the total sales for each date range.
- SUM(payment_total): This calculates the total payments for each date range.
- SUM(invoice_total - payment_total): This calculates the difference between the invoice total and the payment total for each date range, which is what we expect to collect.

Combine results: The query uses the UNION operator to combine the results of the three calculations into a single table. This table shows the total sales, total payments, and what we expect for each date range.

# P42-group_by.sql

```sql
SELECT
    p.date,
    pm.name AS payment_method,
    SUM(p.amount) AS total_payments
FROM
    payments p JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY
    p.date, payment_method
ORDER BY
    p.date;
```
## Explaination;

### 1. Selecting Data:

The query specifies the columns to retrieve:
- p.date: The date of the payment
- pm.name AS payment_method: The name of the payment method, aliased as "payment_method"
- SUM(p.amount) AS total_payments: The sum of payment amounts, aliased as "total_payments"

### 2. Joining Tables:

The query combines data from two tables:
- payments table (aliased as p): Contains payment details
- payment_methods table (aliased as pm): Contains information about payment methods
The join condition links the tables based on the payment method ID:
- ON p.payment_method = pm.payment_method_id

### 3. Grouping Data:

The query groups the results based on two columns:
- p.date: Payment date
- payment_method: Payment method
- GROUP BY p.date, payment_method

### 4. Aggregation:

The query calculates the total payments for each group using the SUM function:
SUM(p.amount) AS total_payments

### 5. Ordering Results:

The query arranges the output in ascending order based on the payment date:
ORDER BY p.date

### In summary, the query:

- Fetches payment dates, payment methods, and total payment amounts.
- Combines payment details with payment method information.
- Groups the data by payment date and payment method.
- Calculates the total payments for each group.
- Presents the results in ascending order of payment date.

# p43-having_clause.sql

```sql
-- Get the customers
--     located in Virginia
--     who have spent more than $100
SELECT
    c.customer_id AS id,
    c.first_name AS first_name,
    c.last_name AS last_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM
    customers c LEFT JOIN orders o USING(customer_id)
    LEFT JOIN order_items oi USING(order_id)
WHERE
    c.state = 'VA'
GROUP BY 
    id, first_name, last_name
HAVING
    total_sales > 100;

```
## Explaination;

### 1. Data Collection:

The query starts by gathering data from three tables:
- **customers**: Stores customer information like names, addresses, and states.
- **orders**: Lists orders placed by customers, including order IDs and customer IDs.
- **order_items**: Contains details about items within each order, such as quantities and unit prices.

### 2. Data Connection:

The query uses LEFT JOINs to connect these tables:
- customers and orders are joined based on matching customer_id values.
- orders and order_items are joined based on matching order_id values.
- LEFT JOINs ensure that all customers from customers are included, even if they have no orders or order items.

### 3. Data Filtering:

The WHERE clause filters the data to include only customers from Virginia:
c.state = 'VA'

### 4. Data Calculation:

The SUM(oi.quantity * oi.unit_price) AS total_sales part calculates the total sales for each customer by multiplying item quantities by their unit prices and summing them up.

### 5. Data Grouping:

The GROUP BY id, first_name, last_name clause groups the results by customer ID, first name, and last name, ensuring that each customer's total sales are calculated correctly.

### 6. Further Filtering:

The HAVING total_sales > 100 clause applies an additional filter, keeping only customers with total sales exceeding $100.

### 7. Data Output:

The SELECT clause specifies the final columns to be displayed in the result:
- *id*: Customer ID
- *first_name*: Customer's first name
- *last_name*: Customer's last name
- *total_sales*: Calculated total sales for each customer




# p44-rollup_operator.sql

```sql
SELECT
    pm.name AS payment_method,
    SUM(p.amount) AS total
FROM
    payments p JOIN payment_methods pm
        ON pm.payment_method_id = p.payment_method
GROUP BY
    pm.name WITH ROLLUP;
    -- Note: If we use WITH ROLLUP clause, the fields used in
    -- GROUP BY must the real fields, not alias.
```
## Explaination;

### 1. Data Retrieval:

- **SELECT**: *Specifies the columns to retrieve*:
- pm.name AS payment_method: Fetches payment method names, aliased as "payment_method" for clarity.
- SUM(p.amount) AS total: Calculates the total amount for each payment method.

- **FROM**: *Identifies the tables to pull data from*:
- payments p: The "payments" table, aliased as "p" for convenience.
- payment_methods pm: The "payment_methods" table, aliased as "pm".

- **JOIN**: *Combines data from two tables based on a matching condition*:
ON pm.payment_method_id = p.payment_method: Links rows where the payment method ID in "payment_methods" matches the payment method in "payments".

### 2. Grouping and Summarizing:

- **GROUP BY pm.name**: Organizes payment data into groups based on the "name" column in the "payment_methods" table.
- **WITH ROLLUP**: Generates subtotals and a grand total:
- **Subtotals**: For each payment method group, it calculates the sum of amounts within that group.
- **Grand total**: It calculates the overall sum across all payment methods.

### 3. Output:

The query produces a result set with two columns:
- *payment_method*: Displays payment method names or "NULL" for subtotals and the grand total.
- *total*: Presents the corresponding sum of amounts for each payment method, subtotal, and the grand total.

### Key Points:

- WITH ROLLUP: A MySQL extension for generating hierarchical subtotals and grand totals.
- Alias Restrictions: When using WITH ROLLUP, you typically use the actual column names in GROUP BY instead of aliases.

### Example Output:

```sql
payment_method     |   total
-----------------------------------------
Cash               |   500
Credit Card        |   1200
NULL               |   1700 (subtotal)
NULL               |   1700 (grand total)
```





