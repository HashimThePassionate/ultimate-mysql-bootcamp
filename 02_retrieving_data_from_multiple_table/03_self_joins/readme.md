# **SELF JOINS**

## Introduction

- **`Self Joins`** occur when a table is joined with itself. 
- This type of join is useful when you want to compare rows within the same table, typically when there is a **hierarchical** or **recursive relationship** between rows.
- Common use cases include **organizational charts**, **hierarchical data structures**, or when dealing with **graphs**.


## Syntax

```sql
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    e.first_name,
    e.last_name
FROM customers c
JOIN customers e 
ON c.customer_id = e.customer_id;
```
### Explanation:
1. **`employees` Table**:
   - The same table (`employees`) is joined with itself to show the relationship between employees and their managers.

2. **Table Aliases**:
   - `e` represents employees.
   - `m` represents managers.

3. **Join Condition**:
   - The condition `e.reports_to = m.employee_id` establishes the relationship between the `reports_to` column (employee's manager ID) and the `employee_id` column (manager's ID).

4. **Selected Columns**:
   - `e.employee_id`: Displays the ID of the employee.
   - `e.first_name`: Displays the first name of the employee.
   - `m.first_name`: Displays the first name of the manager.

---

### Example Output:

| Employee ID | Employee Name | Manager Name |
|-------------|---------------|--------------|
| 1001        | John          | Sarah        |
| 1002        | Alice         | Sarah        |
| 1003        | Mike          | John         |

---

## Additional Notes

- **Different Types of Joins**:
  - `Self Joins` can be performed using INNER JOIN, LEFT JOIN, RIGHT JOIN, etc., depending on the requirements of the query.
  
- **Importance of Aliases**:
  - Properly aliasing the table is critical to distinguish between the two instances of the same table in a self-join.

- **Performance Consideration**:
  - `Self Joins` can be computationally expensive, especially on large datasets, so they should be used judiciously.

