
# Subqueries in DELETE Statement in MySQL

This documentation elaborates on the usage and implications of employing subqueries within the DELETE statement in MySQL Subqueries in DELETE statements allow you to delete rows from a table based on the result of a subquery, providing a powerful tool for data manipulation.


## Syntax

The syntax for using subqueries in the DELETE statement is as follows:

```sql

DELETE FROM table1
WHERE condition IN (subquery);
``` 
In this syntax:

* table1 is the table from which you want to delete rows.
* condition specifies the condition that must be met for rows to be deleted.
* (subquery) is the subquery that returns the values to be compared with the condition for deletion.

## Example


```sql
DELETE FROM customers 
WHERE
    customer_id IN (SELECT 
        customer_id
    FROM
        (SELECT 
            customer_id
        FROM
            customers
        
        WHERE
            first_name = 'junaid') AS temp_table);
```


## Considerations

When using subqueries in DELETE statements, consider the following:

* Ensure that the subquery returns the correct set of values to be compared with the condition in the DELETE statement.
* Subqueries in DELETE statements can be powerful but should be used with caution, especially when dealing with large datasets, to avoid unintended data loss.
* Test the DELETE statement with the subquery carefully in a non-production environment before executing it in a production environment.


## Conclusion

Subqueries in the DELETE statement offer a flexible approach to delete rows from a table based on conditions derived from other tables or complex logic. By understanding the syntax and considerations outlined in this documentation, you can effectively use subqueries in DELETE statements to manipulate data in your MySQL database.


# Subqueries in UPDATE Statement in MySQL

This documentation provides insights into using subqueries within the UPDATE statement in MySQL. Subqueries in UPDATE statements allow you to update rows in a table based on the result of a subquery, offering a powerful mechanism for data modification.


## Syntax

The syntax for using subqueries in the UPDATE statement is as follows:

```sql

UPDATE table1
SET column1 = value1, column2 = value2, ...
WHERE condition IN (subquery);
```
In this syntax:

* table1 is the table in which you want to update rows.
* column1, column2, etc., are the columns you want to update.
* value1, value2, etc., are the new values for the respective columns.
* condition specifies the condition that must be met for rows to be updated.
* (subquery) is the subquery that returns the values to be compared with the condition for updating.


## Example

```sql

UPDATE orders
SET comments = "Gold Customer"
WHERE customer_id IN
                (
                SELECT customer_id
                FROM customers
                WHERE points >= 1800
                );
```


## Considerations

When using subqueries in UPDATE statements, consider the following:

* Ensure that the subquery returns the correct set of values to be compared with the condition in the UPDATE statement.
* Subqueries in UPDATE statements can be potent but should be used judiciously, especially when dealing with large datasets, to avoid unintended consequences.
* Test the UPDATE statement with the subquery carefully in a non-production environment before executing it in a production environment.


## Conclusion

Subqueries in the UPDATE statement offer a flexible approach to updating rows in a table based on conditions derived from other tables or complex logic. By understanding the syntax and considerations outlined in this documentation, you can effectively use subqueries in UPDATE statements to modify data in your MySQL database.
