### ALL Keyword

#### Example 1: Finding the Maximum Invoice Total for a Specific Client

```sql
SELECT 
    MAX(invoice_total)
FROM
    invoices
WHERE
    client_id = 3;
```

**Explanation:**

- **SELECT:** Used to specify the columns to retrieve data from the database.
- **MAX:** An aggregate function that returns the highest value in a set of values.
- **invoice_total:** The column from which the maximum value is to be found.
- **FROM:** Specifies the table to retrieve data from.
- **invoices:** The name of the table containing the data.
- **WHERE:** Used to filter records based on a specified condition.
- **client_id = 3:** The condition to filter records where the client_id is 3.

**Output:**

| MAX(invoice_total) |
|--------------------|
| 167.29             |

#### Example 2: Selecting Invoices Larger than the Maximum Invoice Total of Client 3

```sql
USE sql_invoicing;

SELECT 
    *
FROM
    invoices
WHERE
    invoice_total > (SELECT 
        MAX(invoice_total)
    FROM
        invoices
    WHERE
        client_id = 3);
```

**Explanation:**

- **USE sql_invoicing:** Switches to the database named `sql_invoicing`.
- **SELECT \***: Selects all columns from the table.
- **invoice_total > (SELECT MAX(invoice_total) FROM invoices WHERE client_id = 3):** Subquery to find invoices where the total is greater than the maximum invoice total of client 3.

**Output:**

| invoice_id | number       | client_id | payment_total | invoice_date | due_date   | payment_date |
|------------|--------------|-----------|---------------|--------------|------------|--------------|
| 2          | 03-898-6735  | 5         | 175.32        | 8.18         | 2019-06-11 | 2019-07-01   | 2019-02-12   |
| 5          | 87-052-3121  | 5         | 169.36        | 0.00         | 2019-07-18 | 2019-08-07   |              |
| 8          | 78-145-1093  | 1         | 189.12        | 0.00         | 2019-05-20 | 2019-06-09   |              |
| 9          | 77-593-0081  | 5         | 172.17        | 0.00         | 2019-07-09 | 2019-07-29   |              |
| 18         | 52-269-9803  | 5         | 180.17        | 42.77        | 2019-05-23 | 2019-06-12   | 2019-01-08   |

#### Example 3: Using the ALL Keyword

```sql
USE sql_invoicing;

SELECT 
    *
FROM
    invoices
WHERE
    invoice_total > ALL (SELECT 
        invoice_total
    FROM
        invoices
    WHERE
        client_id = 3);
```

**Explanation:**

- **ALL:** Compares a value to all values in another set of values. It ensures the condition is true for all values returned by the subquery.
- **invoice_total > ALL (SELECT invoice_total FROM invoices WHERE client_id = 3):** Checks if the invoice_total is greater than every invoice_total for client 3.

**Output:**

| invoice_id | number       | client_id | payment_total | invoice_date | due_date   | payment_date |
|------------|--------------|-----------|---------------|--------------|------------|--------------|
| 2          | 03-898-6735  | 5         | 175.32        | 8.18         | 2019-06-11 | 2019-07-01   | 2019-02-12   |
| 5          | 87-052-3121  | 5         | 169.36        | 0.00         | 2019-07-18 | 2019-08-07   |              |
| 8          | 78-145-1093  | 1         | 189.12        | 0.00         | 2019-05-20 | 2019-06-09   |              |
| 9          | 77-593-0081  | 5         | 172.17        | 0.00         | 2019-07-09 | 2019-07-29   |              |
| 18         | 52-269-9803  | 5         | 180.17        | 42.77        | 2019-05-23 | 2019-06-12   | 2019-01-08   |

### Why Use the ALL Keyword?

The `ALL` keyword is used in SQL to compare a value to all values in a list or subquery. This ensures that a condition must hold true for every value returned by the subquery. It is useful when you need to confirm that a comparison meets a criterion for all elements in a specified set.

In the given example, `invoice_total > ALL (SELECT invoice_total FROM invoices WHERE client_id = 3)`, the query checks if the `invoice_total` is greater than every `invoice_total` of client 3, thus filtering out only those invoices that surpass all invoice totals for that specific client.

Using `ALL` helps in scenarios where we need to validate against a comprehensive set of conditions, ensuring stricter and more precise filtering of data.

### Tables Representation

#### Table 1: Maximum Invoice Total for Client 3

| MAX(invoice_total) |
|--------------------|
| 167.29             |

#### Table 2: Invoices Larger than the Maximum Invoice Total of Client 3

| invoice_id | number       | client_id | payment_total | invoice_date | due_date   | payment_date |
|------------|--------------|-----------|---------------|--------------|------------|--------------|
| 2          | 03-898-6735  | 5         | 175.32        | 8.18         | 2019-06-11 | 2019-07-01   | 2019-02-12   |
| 5          | 87-052-3121  | 5         | 169.36        | 0.00         | 2019-07-18 | 2019-08-07   |              |
| 8          | 78-145-1093  | 1         | 189.12        | 0.00         | 2019-05-20 | 2019-06-09   |              |
| 9          | 77-593-0081  | 5         | 172.17        | 0.00         | 2019-07-09 | 2019-07-29   |              |
| 18         | 52-269-9803  | 5         | 180.17        | 42.77        | 2019-05-23 | 2019-06-12   | 2019-01-08   |

#### Table 3: Invoices Larger than All Invoices of Client 3 (Using ALL)

| invoice_id | number       | client_id | payment_total | invoice_date | due_date   | payment_date |
|------------|--------------|-----------|---------------|--------------|------------|--------------|
| 2          | 03-898-6735  | 5         | 175.32        | 8.18         | 2019-06-11 | 2019-07-01   | 2019-02-12   |
| 5          | 87-052-3121  | 5         | 169.36        | 0.00         | 2019-07-18 | 2019-08-07   |              |
| 8          | 78-145-1093  | 1         | 189.12        | 0.00         | 2019-05-20 | 2019-06-09   |              |
| 9          | 77-593-0081  | 5         | 172.17        | 0.00         | 2019-07-09 | 2019-07-29   |              |
| 18         | 52-269-9803  | 5         | 180.17        | 42.77        | 2019-05-23 | 2019-06-12   | 2019-01-08   |