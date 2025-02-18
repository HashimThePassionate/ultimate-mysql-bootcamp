# 🔗 **LEFT JOIN & RIGHT JOIN in MySQL**

## 📌 Overview
MySQL provides various types of **JOIN** operations to combine data from multiple tables. Two of the most commonly used joins are **LEFT JOIN** and **RIGHT JOIN**. These joins are used to retrieve related records from two tables based on a matching column.

---

## 📖 What is a JOIN?
A **JOIN** is used to fetch records from two or more tables based on a common field between them. It helps in retrieving meaningful information that is spread across multiple tables.

## 🔹 LEFT JOIN (LEFT OUTER JOIN)
### ✅ Definition
The **LEFT JOIN** returns all records from the **left table**, and the matching records from the **right table**. If there is no match, the result will contain `NULL` for columns from the right table.

### 🛠 Syntax
```sql
SELECT columns
FROM left_table
LEFT JOIN right_table
ON left_table.common_column = right_table.common_column;
```

### 📌 Example
Consider two tables:
- **customers** (`customer_id`, `first_name`, `last_name`, `city`)
- **orders** (`order_id`, `customer_id`, `order_date`)

```sql
SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_id,
    orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
```

### 🎯 Output
| customer_id | first_name | last_name | order_id | order_date |
|-------------|-----------|-----------|----------|------------|
| 1           | Ali       | Khan      | 101      | 2023-05-15 |
| 2           | Sara      | Ahmed     | NULL     | NULL       |
| 3           | Zain      | Malik     | 102      | 2023-06-20 |

🔹 **Explanation:**
- All customers are displayed.
- Customers without orders show `NULL` values in `order_id` and `order_date`.

---

## 🔹 RIGHT JOIN (RIGHT OUTER JOIN)
### ✅ Definition
The **RIGHT JOIN** returns all records from the **right table**, and the matching records from the **left table**. If there is no match, the result will contain `NULL` for columns from the left table.

### 🛠 Syntax
```sql
SELECT columns
FROM left_table
RIGHT JOIN right_table
ON left_table.common_column = right_table.common_column;
```

### 📌 Example
```sql
SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_id,
    orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
```

### 🎯 Output
| customer_id | first_name | last_name | order_id | order_date |
|-------------|-----------|-----------|----------|------------|
| 1           | Ali       | Khan      | 101      | 2023-05-15 |
| 3           | Zain      | Malik     | 102      | 2023-06-20 |
| NULL        | NULL      | NULL      | 103      | 2023-07-10 |

🔹 **Explanation:**
- All orders are displayed.
- Orders without a matching customer show `NULL` values in customer details.

---

## 🔍 Key Differences Between LEFT JOIN & RIGHT JOIN
| Feature         | LEFT JOIN                          | RIGHT JOIN                         |
|----------------|---------------------------------|---------------------------------|
| Returned Rows  | **All rows from left table** & matched rows from right table | **All rows from right table** & matched rows from left table |
| NULL Values    | When no match is found in the right table | When no match is found in the left table |
| Usage          | When you need **all records from left table** regardless of matches | When you need **all records from right table** regardless of matches |

---

## 🚀 Conclusion
- Use **LEFT JOIN** when you want **all records from the left table**, even if there is no match in the right table.
- Use **RIGHT JOIN** when you want **all records from the right table**, even if there is no match in the left table.
- These joins are essential in **report generation, data analysis, and combining relational database information**.

📌 **Tip:** If unsure, use **LEFT JOIN** more often, as it is the most commonly used join in MySQL.
