
# Formatting Dates and Times in MySQL

## Introduction

In MySQL, dealing with dates and times is a common task. Proper formatting of dates and times is essential for effective data management, retrieval, and presentation in your MySQL database. This guide provides an overview of various functions and techniques available in MySQL to format dates and times according to your requirements.

## Date and Time Data Types in MySQL

MySQL offers several data types to handle dates and times. The most commonly used ones are:

1. **DATE**: Stores dates in the format 'YYYY-MM-DD'.
2. **TIME**: Stores times in the format 'HH:MM:SS'.
3. **DATETIME**: Combines date and time in the format 'YYYY-MM-DD HH:MM:SS'.
4. **TIMESTAMP**: Similar to DATETIME but stores values in UTC and automatically converts to the session's time zone.

## Formatting Dates and Times

## DATE_FORMAT() Function

The DATE_FORMAT() function allows you to format date and time values according to a specified format string. Syntax:

```sql
DATE_FORMAT(date, format)
```

## Example:
```sql
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') AS formatted_date;
```

## Formatting Directly in Queries
You can also format dates directly within SQL queries using string functions like CONCAT(), SUBSTRING(), and DATE_FORMAT().

## Example:

## Date Functions to check dynamically current Year orders
```sql
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW());
```
## Example:

## FORMAT_DATE Function
```sql
SELECT DATE_FORMAT(order_date,'%D %M %Y')
FROM orders;
```
## Example:

## ADDING DATE Function
```sql
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;
```

## Conclusion

Properly formatting dates and times in MySQL is crucial for effective data management and presentation. By using functions like DATE_FORMAT() and string manipulation functions, you can achieve the desired formatting for your date and time values.