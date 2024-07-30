# Correlated Subqueries

A correlated subquery is a subquery that uses values from the outer query. It is evaluated once for each row processed by the outer query, making it different from a regular subquery, which is evaluated only once.

#### Example: Employee Salaries Compared to Average Office Salaries

```sql
SELECT *
FROM employees e
WHERE salary > (
	SELECT avg(salary)
    FROM employees
    WHERE office_id = e.office_id
);
```

**Explanation:**

- **Correlated Subquery:** The subquery inside the `WHERE` clause references columns from the outer query. Specifically, `e.office_id` from the outer query is used in the subquery.
- **SELECT \***: Selects all columns from the `employees` table.
- **FROM employees e:** The `employees` table is aliased as `e` for easier reference.
- **WHERE salary > (SELECT avg(salary) FROM employees WHERE office_id = e.office_id):** This condition compares each employee's salary to the average salary of their respective office. 

In this query, for each employee, the subquery calculates the average salary for the employees in the same office (`WHERE office_id = e.office_id`). The outer query then returns those employees whose salary is greater than the calculated average salary.

**Output:**

| employee_id | first_name | last_name | job_title            | salary | reports | office_id |
|-------------|------------|-----------|----------------------|--------|---------|-----------|
| 37851       | Sayer      | Matterson | Statistician III     | 98926  | 37270   | 1         |
| 40448       | Mindy      | Crissil   | Staff Scientist      | 94860  | 37270   | 1         |
| 56274       | Keriann    | Alloisi   | VP Marketing         | 110150 | 37270   | 1         |
| 67009       | North      | de Clerc  | VP Product Management| 114257 | 37270   | 2         |
| 67370       | Elladine   | Rising    | Social Worker        | 96767  | 37270   | 2         |
| 72540       | Guthrey    | Iacopetti | Office Assistant I   | 117690 | 37270   | 3         |
| 76196       | Mirilla    | Janowski  | Cost Accountant      | 119241 | 37270   | 3         |
| 84791       | Hazel      | Tarbert   | General Manager      | 93760  | 37270   | 4         |
| 95213       | Cole       | Kesterton | Pharmacist           | 86119  | 37270   | 4         |
| 98374       | Estrellita | Daleman   | Staff Accountant IV  | 70187  | 37270   | 5         |
| 115357      | Ivy        | Fearey    | Structural Engineer  | 92710  | 37270   | 5         |

### Why Use Correlated Subqueries?

Correlated subqueries are used when the subquery needs to refer to values from the outer query to function correctly. They are useful for scenarios where you need to perform a row-by-row comparison or calculation, based on values from the outer query.

**Benefits:**

1. **Dynamic Filtering:** Allows for more complex and dynamic filtering conditions that can adapt based on the values of each row in the outer query.
2. **Context-Aware Calculation:** Enables context-aware calculations, such as comparing an employee's salary to the average salary within their office, as shown in the example.
3. **Specificity:** Useful for obtaining precise results that require specific conditions and comparisons.

### Tables Representation

#### Table: Employees Data

| employee_id | first_name  | last_name   | job_title                | salary | reports | office_id |
|-------------|-------------|-------------|--------------------------|--------|---------|-----------|
| 33391       | D'arcy      | Nortunen    | Account Executive        | 62871  | 37270   | 1         |
| 37270       | Yovonnda    | Magrannell  | Executive Secretary      | 63996  |         | 10        |
| 37851       | Sayer       | Matterson   | Statistician III         | 98926  | 37270   | 1         |
| 40448       | Mindy       | Crissil     | Staff Scientist          | 94860  | 37270   | 1         |
| 56274       | Keriann     | Alloisi     | VP Marketing             | 110150 | 37270   | 1         |
| 63196       | Alaster     | Scutchin    | Assistant Professor      | 32179  | 37270   | 2         |
| 67009       | North       | de Clerc    | VP Product Management    | 114257 | 37270   | 2         |
| 67370       | Elladine    | Rising      | Social Worker            | 96767  | 37270   | 2         |
| 68249       | Nisse       | Voysey      | Financial Advisor        | 52832  | 37270   | 2         |
| 72540       | Guthrey     | Iacopetti   | Office Assistant I       | 117690 | 37270   | 3         |
| 72913       | Kass        | Hefferan    | Computer Systems Analyst | 96401  | 37270   | 3         |
| 75900       | Virge       | Goodrum     | Information Systems Mgr  | 54578  | 37270   | 3         |
| 76196       | Mirilla     | Janowski    | Cost Accountant          | 119241 | 37270   | 3         |
| 80529       | Lynde       | Aronson     | Junior Executive         | 77182  | 37270   | 4         |
| 80679       | Mildrid     | Sokale      | Geologist II             | 67987  | 37270   | 4         |
| 84791       | Hazel       | Tarbert     | General Manager          | 93760  | 37270   | 4         |
| 95213       | Cole        | Kesterton   | Pharmacist               | 86119  | 37270   | 4         |
| 96513       | Theresa     | Binney      | Food Chemist             | 47354  | 37270   | 5         |
| 98374       | Estrellita  | Daleman     | Staff Accountant IV      | 70187  | 37270   | 5         |
| 115357      | Ivy         | Fearey      | Structural Engineer      | 92710  | 37270   | 5         |

#### Table: Employees with Salary Greater than Office Average

| employee_id | first_name  | last_name   | job_title                | salary | reports | office_id |
|-------------|-------------|-------------|--------------------------|--------|---------|-----------|
| 37851       | Sayer       | Matterson   | Statistician III         | 98926  | 37270   | 1         |
| 40448       | Mindy       | Crissil     | Staff Scientist          | 94860  | 37270   | 1         |
| 56274       | Keriann     | Alloisi     | VP Marketing             | 110150 | 37270   | 1         |
| 67009       | North       | de Clerc    | VP Product Management    | 114257 | 37270   | 2         |
| 67370       | Elladine    | Rising      | Social Worker            | 96767  | 37270   | 2         |
| 72540       | Guthrey     | Iacopetti   | Office Assistant I       | 117690 | 37270   | 3         |
| 76196       | Mirilla     | Janowski    | Cost Accountant          | 119241 | 37270   | 3         |
| 84791       | Hazel       | Tarbert     | General Manager          | 93760  | 37270   | 4         |
| 95213       | Cole        | Kesterton   | Pharmacist               | 86119  | 37270   | 4         |
| 98374       | Estrellita  | Daleman     | Staff Accountant IV      | 70187  | 37270   | 5         |
| 115357      | Ivy         | Fearey      | Structural Engineer      | 92710  | 37270   | 5         |