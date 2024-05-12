### Agregate functions:

- Aggregate functions in databases are used to perform calculations on groups of rows to return a single result. Some common aggregate functions include:

**COUNT**: This function counts the number of rows in a table that meet a certain condition, or simply the total number of rows in the table.

**SUM**: It calculates the sum of values in a column.

**AVG**: This function calculates the average of values in a column.

**MIN**: It retrieves the minimum value from a column.

**MAX**: This function retrieves the maximum value from a column.

**GROUP_CONCAT**: Concatenates values from multiple rows into a single string.

- These functions are often used in conjunction with the GROUP BY clause to perform calculations on groups of rows rather than the entire table.

```sql
SELECT 
MAX(salary) AS Highest,
MIN(salary) AS lowest,
AVG(salary) AS average,
SUM(salary) AS total,
COUNT(salary) AS number_of_records
FROM employees;
```

<hr>

<img src ='./assets/aggregate-functions'>

<hr>