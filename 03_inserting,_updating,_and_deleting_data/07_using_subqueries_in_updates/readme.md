### Using subqueries in Updates

- Using subqueries in SQL allows you to nest one query within another query. Subqueries can be used in various parts of a SQL statement, such as the `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statements, and they serve several purposes:

1. **Filtering Data**: Subqueries can be used in the WHERE clause to filter rows based on the results of another query. For example, you can retrieve all employees who earn more than the average salary.

2. **Generating Calculations**: Subqueries can be used to perform calculations or aggregate functions on the results of another query. For instance, you can calculate the total sales for a specific product category.

3. **Data Manipulation**: Subqueries can be used to manipulate data within a query. For example, you can update rows in a table based on the results of another query.

4. **Nested Queries**: Subqueries can be nested within each other, allowing for complex logic and data retrieval. You can have subqueries within subqueries to achieve more intricate data manipulations.

- Here's a basic example of using a subquery to filter data:

```sql
UPDATE orders
SET comments = "Gold Customer"
WHERE c_id IN
                (SELECT customer_id
                 FROM customers
                 WHERE points > 1800);

```

- In this example, the inner query retrieves the department_id for the 'Sales' department from the departments table, and the outer query selects the names of employees who belong to the Sales department based on the department_id retrieved by the subquery.

- Subqueries are powerful tools in SQL that allow you to perform complex operations and retrieve data in a flexible and efficient manner. However, they should be used judiciously, as poorly optimized subqueries can impact performance.

**The query will run subqueries in updates.**