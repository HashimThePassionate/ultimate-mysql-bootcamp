### INSERT Hierarchical Rows

- Inserting hierarchical data in SQL typically refers to the process of inserting records into a table where there's a parent-child relationship among the records, creating a hierarchical structure. This is commonly done in scenarios like organizational charts, file systems, or product categories where each record (child) is associated with another record (parent).

```sql
INSERT INTO customers(customer_id,first_name,last_name,birth_date)
VALUES (DEFAULT,'IGI','ORIGIN','2023-12-25');

INSERT INTO orders(order_id,order_date, status,customer_id)
VALUES(DEFAULT,'2023-12-25',1,LAST_INSERT_ID());

INSERT INTO
orders_items(order_id,product_id,unit_price,quantity)
VALUES (LAST_INSERT_ID(),9,35,3);
```

- Executing these SQL statements would insert hierarchical data into the table.
