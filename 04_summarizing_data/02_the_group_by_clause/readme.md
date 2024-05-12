### **GROUP BY** Clause:

- The `GROUP BY` clause in SQL is used to group rows that have the same values into summary rows, typically for the purpose of performing aggregate functions (like `COUNT`, `SUM`, `AVG`, etc.) on each group.

- When you use `GROUP BY`, the result set will contain one row for each group of rows that have the same values in the specified column(s). Here’s what the `GROUP BY` clause does:

- **Groups Rows**: It organizes rows into groups based on the values of one or more columns specified in the `GROUP BY` clause.

- **Aggregate Calculations**: It allows you to perform aggregate functions on each group independently, such as `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, etc.

<hr>

```sql
SELECT 
client_id,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
ORDER BY total_sales DESC;
```

<img src = './assets/group-by'>

<hr>

- **Aggregate Calculations:**

```sql
SELECT 
client_id,
COUNT(*) AS number_of_invoices,
SUM(invoice_total) as total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5;
```

<img src = './assets/group-by-aggregate'>

<hr>
