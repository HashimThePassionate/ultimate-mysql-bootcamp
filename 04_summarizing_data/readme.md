### Agregate functions:

- Aggregate functions in databases are used to perform calculations on groups of rows to return a single result. Some common aggregate functions include:

**COUNT**: This function counts the number of rows in a table that meet a certain condition, or simply the total number of rows in the table.

**SUM**: It calculates the sum of values in a column.

**AVG**: This function calculates the average of values in a column.

**MIN**: It retrieves the minimum value from a column.

**MAX**: This function retrieves the maximum value from a column.

**GROUP_CONCAT**: Concatenates values from multiple rows into a single string.

- These functions are often used in conjunction with the GROUP BY clause to perform calculations on groups of rows rather than the entire table.

<hr>

### **GROUP BY** Clause:

- The `GROUP BY` clause in SQL is used to group rows that have the same values into summary rows, typically for the purpose of performing aggregate functions (like `COUNT`, `SUM`, `AVG`, etc.) on each group.

- When you use `GROUP BY`, the result set will contain one row for each group of rows that have the same values in the specified column(s). Here’s what the `GROUP BY` clause does:

- **Groups Rows**: It organizes rows into groups based on the values of one or more columns specified in the `GROUP BY` clause.

- **Aggregate Calculations**: It allows you to perform aggregate functions on each group independently, such as `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, etc.

<hr>

### **ROLL UP** Operator:

- `ROLLUP` is an extension of the `GROUP BY` clause in SQL that is used to generate subtotals for groups of rows. It produces multiple grouping sets based on the columns specified in the `GROUP BY` clause, providing a hierarchical view of aggregated data.

- Here's what `ROLLUP` does:

- **Generates Subtotals**: It generates subtotals for multiple levels of aggregation based on the columns specified in the `GROUP BY` clause.

- **Hierarchy of Subtotals**: `ROLLUP` generates subtotals for each combination of columns specified in the `GROUP BY` clause, from the most detailed level to the grand total level.

- **Grand Total**: In addition to the subtotals, `ROLLUP` also computes the grand total for all rows in the result set.

<hr>