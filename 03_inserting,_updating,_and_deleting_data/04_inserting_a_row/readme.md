### Inserting a Row

- *INSERT INTO*: This adds new rows to a table.
- Inserting a row in SQL means adding a new record to a table within a database. It's one of the fundamental operations in database management and is  typically done using the INSERT INTO statement. Here's a basic syntax:

```sql
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES (107, 'Backpack', 'Accessories', 50.00, 80);
```
- Executing this SQL statement would insert a new row into the employees table with the specified values in the corresponding columns.

* `table_name`: The name of the table where you want to insert the data.
* `(column1, column2, column3, ...)`: The columns in the table where you want to insert the data.
* `VALUES`: The keyword indicating that the values for the specified columns will be provided.
* `(value1, value2, value3, ...)`: The actual values you want to insert into the specified columns.

**This code will insert new row to a table.**

<img src='./image/insert-single.PNG'></img>



