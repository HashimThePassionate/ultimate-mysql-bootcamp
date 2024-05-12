## The WHERE Clause 

**Introduction**

- The `WHERE clause` is a fundamental component of SQL used to filter rows returned by a query based on specified conditions.
- It allows you to narrow down the result set to include only those rows that meet the specified criteria.

## Syntax
The basic syntax of the `WHERE clause` is as follows:

```sql
use sql_store;
SELECT state, points
FROM customers
WHERE points > 1000;
```
- `WHERE point > 1000`: Specifies the conditions that the rows must meet to be included in the result set. These conditions can involve comparisons, logical operators, and SQL functions.

## How to Filter a specific row using `WHERE Clause`

 ```sql
 Use sql_store;
 SELECT * 
 FROM customers
 WHERE customer_id = 5;
 ```

## How to filter Comparison  Operators using `WHERE Clause`

 ```sql
 SELECT * 
 FROM customers 
 WHERE points>1500;
 ```
 - Filter those records whose points are greater than 1500.
 - The WHERE clause supports various comparison operators such as `=`,`!=`,`<`,`>`,`<=`,`>=`, etc. 

## How to filter string matched record with `WHERE Clause`

```sql
Use sql_store;
SELECT * 
FROM customers 
WHERE city = 'Chicago';
```

## How to filter those records whose birth_date is  > '2023-08-07'

```sql
SELECT * 
FROM customers 
WHERE birth_date > '2023-08-07';
```
- Filter those records whose birth_date is  > '2023-08-07'.

 



