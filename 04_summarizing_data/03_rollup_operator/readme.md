### **ROLL UP** Operator:

- `ROLLUP` is an extension of the `GROUP BY` clause in SQL that is used to generate subtotals for groups of rows. It produces multiple grouping sets based on the columns specified in the `GROUP BY` clause, providing a hierarchical view of aggregated data.

- Here's what `ROLLUP` does:

- **Generates Subtotals**: It generates subtotals for multiple levels of aggregation based on the columns specified in the `GROUP BY` clause.

- **Hierarchy of Subtotals**: `ROLLUP` generates subtotals for each combination of columns specified in the `GROUP BY` clause, from the most detailed level to the grand total level.

- **Grand Total**: In addition to the subtotals, `ROLLUP` also computes the grand total for all rows in the result set.

```sql
USE sql_invoicing;
SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id WITH ROLLUP;
```

<hr>

<img src= './assets/roll-up.gif'>

<hr>



## Introduction
The `IFNULL` function to handle `NULL` values in the `client_id` column and calculates the total sales for each client. The query also utilizes the `ROLLUP` operator to include a summary row with the total sales for all clients.

## Query

```sql
SELECT
    IFNULL(client_id, 'Total Sales') as client_id,
    SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id WITH ROLLUP;
```

## Explanation

### SELECT Clause

- **IFNULL(client_id, 'Total Sales') as client_id**: 
  - The `IFNULL` function is used to replace `NULL` values in the `client_id` column with the string `'Total Sales'`.
  - This ensures that the summary row created by the `ROLLUP` operator is labeled as `'Total Sales'` instead of showing `NULL`.
  - The result is aliased as `client_id`.

- **SUM(invoice_total) as total_sales**: 
  - The `SUM` function calculates the total of the `invoice_total` column for each `client_id`.
  - The result is aliased as `total_sales`.

### FROM Clause

- **FROM invoices**:
  - Specifies the `invoices` table as the source of the data for the query.

### GROUP BY Clause

- **GROUP BY client_id WITH ROLLUP**:
  - The `GROUP BY` clause groups the results by `client_id`, meaning that the `SUM(invoice_total)` calculation is performed for each unique `client_id`.
  - The `WITH ROLLUP` operator adds an extra row to the result set that contains the total sum of `invoice_total` for all `client_id` groups. This summary row helps in understanding the overall total sales.
