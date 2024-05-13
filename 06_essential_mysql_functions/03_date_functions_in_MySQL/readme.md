
# Date Functions in MySQL

## Introduction
MySQL offers a variety of date and time functions to manipulate date and time values stored in your database. This README provides an overview of common date functions in MySQL, along with examples of their usage.

## Function Categories

### Date and Time Functions

* **NOW()**: Returns the current date and time.
* **CURDATE()**: Returns the current date.
* **CURTIME()**: Returns the current time.
* **DATE()**: Extracts the date part from a datetime expression.
* **TIME()**: Extracts the time part from a datetime expression.
* **DAYNAME()**: Returns the name of the weekday.
* **MONTHNAME()**: Returns the name of the month.
* **DAYOFWEEK()**: Returns the weekday index (1 = Sunday, 2 = Monday, ..., 7 = Saturday).
* **DAYOFMONTH()**: Returns the day of the month.
* **DAYOFYEAR()**: Returns the day of the year.
* **MONTH()**: Returns the month.
* **YEAR()**: Returns the year.
* **HOUR()**: Returns the hour.
* **MINUTE()**: Returns the minute.
* **SECOND()**: Returns the second.
* **DATE_FORMAT()**: Formats a date as specified.

### Date Arithmetic Functions

* **DATE_ADD()**: Adds a specified time interval to a date.
* **DATE_SUB()**: Subtracts a specified time interval from a date.
* **TIMESTAMPADD()**: Adds an interval to a datetime expression.
* **TIMESTAMPDIFF()**: Returns the difference between two datetime expressions.

### Date Comparison Functions

* **DATEDIFF()**: Returns the number of days between two dates.
* **TIMESTAMP()**: Converts a date or datetime value to a Unix timestamp.
* **UNIX_TIMESTAMP()**: Returns the Unix timestamp for the current date and time.

## Examples

## Date Functions to check dynamically current Year orders

```sql
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW());
```

## FORMAT_DATE Function

```sql
SELECT DATE_FORMAT(order_date,'%D %M %Y')
FROM orders;
```

## ADDING DATE Function

```sql
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;
```

## Date and Time Functions

```sql
SELECT NOW(); -- Returns the current date and time
SELECT CURDATE(); -- Returns the current date
SELECT CURTIME(); -- Returns the current time
SELECT DAYNAME(NOW()); -- Returns the name of the weekday for the current date and time
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); -- Formats the current date and time as 'YYYY-MM-DD'
```

## Date Arithmetic Functions

```sql
SELECT DATE_ADD('2024-05-10', INTERVAL 1 DAY); -- Adds 1 day to the specified date
SELECT DATE_SUB('2024-05-10', INTERVAL 1 MONTH); -- Subtracts 1 month from the specified date
```

## Date Comparison Functions

```sql
SELECT DATEDIFF('2024-05-20', '2024-05-10'); -- Returns the number of days between the two dates
SELECT UNIX_TIMESTAMP(NOW()); -- Returns the Unix timestamp for the current date and time
```

## Conclusion

Understanding MySQL's date functions is essential for effectively working with date and time data in your database. Experiment with these functions in your queries to manipulate and analyze date values efficiently.