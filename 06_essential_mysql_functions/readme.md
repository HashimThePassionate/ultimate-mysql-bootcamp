
# MySQL Essential Functions Documentation

## Introduction

MySQL is one of the most popular open-source relational database management systems. It provides a rich set of functions to manipulate and query data. This documentation aims to provide an overview of essential MySQL functions.

1. **Data Manipulation Functions**

## SELECT
* Syntax: ***SELECT column1, column2, ... FROM table_name WHERE condition;***
* Description: Retrieves data from one or more tables based on specified criteria.

## INSERT
* Syntax: ***INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);***
* Description: Adds new records into a table.

## UPDATE
* Syntax: ***UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;***
* Description: Modifies existing records in a table based on specified criteria.

## DELETE
* Syntax: ***DELETE FROM table_name WHERE condition;***
* Description: Removes records from a table based on specified criteria.


2. **Data Query Functions**

## COUNT
* Syntax: ***SELECT COUNT(column_name) FROM table_name WHERE condition;***
* Description: Counts the number of rows that match a specified condition.

## SUM
* Syntax: ***SELECT SUM(column_name) FROM table_name WHERE condition;***
* Description: Calculates the sum of values in a numeric column.

## AVG
* Syntax: ***SELECT AVG(column_name) FROM table_name WHERE condition;*** 
* Description: Calculates the average value of a numeric column.

## MIN
* Syntax: ***SELECT MIN(column_name) FROM table_name WHERE condition;***
* Description: Retrieves the minimum value from a column.

## MAX
* Syntax: ***SELECT MAX(column_name) FROM table_name WHERE condition;***
* Description: Retrieves the maximum value from a column.

3. **Data Manipulation Language (DML) Functions** 

## JOIN
* Syntax: ***SELECT columns FROM table1 INNER/LEFT/RIGHT/FULL JOIN table2 ON condition;***
* Description: Combines rows from two or more tables based on a related column between them.

## GROUP BY
* Syntax: ***SELECT column1, column2, ... FROM table_name GROUP BY column1, column2, ...;***
* Description: Groups rows that have the same values into summary rows.

## ORDER BY
* Syntax: ***SELECT columns FROM table_name ORDER BY column1 ASC/DESC, column2 ASC/DESC, ...;***
* Description: Sorts the result set in ascending or descending order based on one or more columns.

## Conclusion
This documentation covers essential MySQL functions for data manipulation, querying, and data manipulation language operations. By understanding and mastering these functions, developers can effectively manage and manipulate data within MySQL databases. For more detailed information, refer to the official MySQL documentation.

