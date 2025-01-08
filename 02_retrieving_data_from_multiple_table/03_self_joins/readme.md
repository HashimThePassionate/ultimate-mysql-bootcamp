# **Self Joins**
## **Introduction**

A **self join** is a join where a table is joined with itself. This is particularly useful for comparing rows within the same table, often to represent hierarchical or recursive relationships, such as **manager-employee relationships**, **organizational charts**, or **category trees**.

## **Key Concepts**

1. **What is a Self Join?**
   - A self join uses the same table twice, with different aliases, to represent relationships within that table.

2. **Common Use Cases**:
   - **Organizational structures**: Employees and their managers.
   - **Recursive relationships**: Parent-child relationships in hierarchical data.
   - **Graph-like structures**: Dependencies or social networks.

3. **Aliases Are Essential**:
   - Aliases (`e` for employees and `m` for managers) are necessary to distinguish the two instances of the same table.

## **Syntax**

```sql
SELECT 
    e.employee_id,
    e.first_name AS Employee_Name,
    m.first_name AS Manager_Name
FROM employees m
JOIN employees e
ON e.reports_to = m.employee_id;
```

## **Explanation**

- **Table**: `employees`
  - The `employees` table contains columns like `employee_id`, `first_name`, and `reports_to` (manager's ID).
  
- **Aliases**:
  - `e`: Represents the employee.
  - `m`: Represents the manager.

- **Join Condition**:
  - `e.reports_to = m.employee_id`: Links an employee's manager ID (`reports_to`) with the manager's employee ID (`employee_id`).

- **Selected Columns**:
  - `e.employee_id`: Displays the unique ID of the employee.
  - `e.first_name`: Displays the first name of the employee.
  - `m.first_name`: Displays the first name of the manager.

## **Example Query**

### Query
```sql
SELECT 
    e.employee_id,
    e.first_name AS Employee_Name,
    m.first_name AS Manager_Name
FROM employees m
JOIN employees e
ON e.reports_to = m.employee_id;
```

---

### Example Data

| Employee ID | First Name | Job Title                | Salary  | Reports To | Office ID |
|-------------|------------|--------------------------|---------|------------|-----------|
| 37270       | Ahad       | Executive Secretary     | 63996   | NULL       | 10        |
| 37851       | Sayer      | Statistician III        | 98926   | 37270      | 1         |
| 56274       | Keriann    | VP Marketing            | 111050  | 37270      | 1         |
| 63196       | Alaster    | Assistant Professor     | 32179   | 37270      | 2         |
| 67370       | Elladine   | Social Worker           | 96767   | 63196      | 2         |
| 72540       | Guthrey    | Office Assistant I      | 117690  | 63196      | 2         |

---

### Example Output

| Employee ID | Employee Name | Manager Name  |
|-------------|---------------|---------------|
| 37851       | Sayer         | Ahad          |
| 56274       | Keriann       | Ahad          |
| 63196       | Alaster       | Ahad          |
| 67370       | Elladine      | Alaster       |
| 72540       | Guthrey       | Alaster       |

---

## **Use Cases**

1. **Organizational Chart**:
   - Easily represent who reports to whom in a company.
   
2. **Recursive Relationships**:
   - Useful for hierarchical data such as product categories or family trees.
   
3. **Dependency Graphs**:
   - Explore relationships like task dependencies or network connections.

---

## **Performance Considerations**

- **Large Data Sets**:
  - Self joins can be computationally expensive, especially for large tables.
  - Indexing the columns involved in the join (e.g., `employee_id` and `reports_to`) can improve performance.

- **Optimization Tips**:
  - Use appropriate filtering conditions (`WHERE`) to limit rows being joined.
  - Ensure that the table is indexed for the columns involved in the join.

---

## **Key Takeaways**

1. **Aliases Are Crucial**:
   - Use aliases to differentiate between the two instances of the same table.

2. **Hierarchical Data**:
   - Self joins are perfect for hierarchical relationships, such as managers and employees.

3. **SQL Join Types**:
   - Self joins can work with `INNER JOIN`, `LEFT JOIN`, etc., based on the relationship you want to display.

---

## **Advanced Example**

To include employees who don't have a manager (e.g., `reports_to` is `NULL`):

```sql
SELECT 
    e.employee_id,
    e.first_name AS Employee_Name,
    COALESCE(m.first_name, 'No Manager') AS Manager_Name
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;
```

### Output for Employees Without Managers:

| Employee ID | Employee Name | Manager Name |
|-------------|---------------|--------------|
| 37270       | Ahad          | No Manager   |
