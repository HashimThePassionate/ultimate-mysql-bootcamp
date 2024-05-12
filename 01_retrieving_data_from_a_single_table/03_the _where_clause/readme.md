## How to Select and filter a specific row using "WHERE Clause"

 ```sql
 USE mydb;
 SELECT * 
 FROM customers
 WHERE customer_id = 5;
 ```

## How to filter with "WHERE Clause" 

 ```sql
 SELECT * 
 FROM customers 
 WHERE points>1500;
 ```
 - Filter those records whose points are greater than 1500.
 - Also you should use these operators >,<,>=,<=,!=, <>

## How to filter string matched record with "WHERE Clause"

```sql
SELECT * 
FROM customers 
WHERE city = 'Chicago';
```

## How to filter those records whose birth_date > '2023-08-07'

```sql
SELECT * 
FROM customers 
WHERE birth_date > '2023-08-07';
```


 



