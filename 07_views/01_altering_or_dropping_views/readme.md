# Altering and Dropping Views in MySQL
### Introduction
This document provides guidelines for altering and dropping views in MySQL databases. Views in MySQL are virtual tables generated based on the result set of a SELECT query. Altering a view allows you to modify its definition, while dropping a view removes it from the database entirely.

### 1. Altering Views
Altering a view in MySQL involves modifying its definition to reflect changes in data requirements or query logic. You can update the SELECT statement, add or remove columns, or change the underlying tables referenced by the view.

```sql

ALTER VIEW sales_by_client AS
SELECT 
client_id,
name,
SUM(invoice_total) AS total_sales
FROM clients
GROUP BY client_id;

```

### 2. Dropping Views
Dropping a view in MySQL removes it from the database, along with its definition and associated metadata. This action is irreversible, and once dropped, the view cannot be recovered.

```sql

DROP VIEW invoices_with_balance;

```