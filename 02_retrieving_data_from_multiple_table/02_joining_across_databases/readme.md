## Joining Across Databases

**Introduction**

- `Joining Data from Multiple Databases` within the same database management system (DBMS) is a powerful technique in database querying and analysis.
-  This process, commonly known as cross-database joins, enables you to combine information from disparate sources, facilitating comprehensive analysis and insights. 

## Syntax

```sql
SELECT oi.product_id, quantity_in_stock
FROM order_items oi
INNER JOIN sql_inventory.products p
ON oi.product_id = p.product_id;
```

- `Sql_inventory`: Is the name of the database.
- `Order_items` and `Products`: Are the names of the tables you want to join.
- `Product_id`: Is the column used to join the tables, and it exists in both table1 and table2.

## We to join tables across Databases
- Suppose we have a Database name inventory.
- In the inventory database we have products table.
- This product table is associated with orders_items.
- We can easily join using db.table name.

```sql
select * 
FROM orders_items oi
INNER JOIN inventory.products p
ON
oi.product_id = p.product_id;
```
## Additional Notes

- It's important to note that not all database management systems support cross-database joins. 
- The ability to perform cross-database joins depends on the specific DBMS you are using and its configuration. *For example*:

- In MySQL, cross-database joins are supported, but you need to have the necessary privileges to access tables in both databases.
-In Microsoft SQL Server, you can perform cross-database joins using fully qualified table names, assuming the user has appropriate permissions.








