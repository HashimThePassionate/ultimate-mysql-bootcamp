# MySQL Numeric Functions


## Introduction

This README provides an overview of numeric functions available in MySQL. These functions allow for mathematical operations, formatting, and manipulation of numeric data stored in MySQL databases.

## Function Categories

MySQL numeric functions can be broadly categorized into:

1. **Mathematical Functions**: Functions for performing basic arithmetic operations and mathematical calculations.
2. **Formatting Functions**: Functions for formatting numeric values, such as rounding, truncating, and formatting for display.
3. **Aggregate Functions**: Functions for calculating summary statistics across multiple rows or groups of rows.
4. **Conversion Functions**: Functions for converting between different numeric data types.


## List of Numeric Functions

1. **Mathematical Functions**

* **ABS()**: Returns the absolute value of a number.
* **ROUND()**: Rounds a number to a specified number of decimal places.
* **CEILING()**: Returns the smallest integer value greater than or equal to a number.
* **FLOOR()**: Returns the largest integer value less than or equal to a number.
* **SQRT()**: Returns the square root of a number.
* **POWER()**: Raises a number to the power of another number.
* **MOD()**: Returns the remainder of a division operation.

1. **ABS()**
## Example:

```sql
SELECT ABS(-10) AS absolute_value;
```
## Explanation:

* ABS() function returns the absolute (non-negative) value of a number.
* In this example, -10 is passed as an argument to ABS(), and it returns 10 as the absolute value.
* The result is aliased as absolute_value.

2. **ROUND()**
## Example:

```sql
SELECT ROUND(12.345, 2) AS rounded_value;
```
## Explanation:

* ROUND() function rounds a number to a specified number of decimal places.
* In this example, 12.345 is rounded to 2 decimal places, resulting in 12.35.
* The result is aliased as rounded_value.

3. **CEILING()**
## Example:

```sql
SELECT CEILING(9.25) AS ceiling_value;
```
## Explanation:

* CEILING() function returns the smallest integer value greater than or equal to a number.
* In this example, 9.25 is rounded up to the nearest integer, resulting in 10.
* The result is aliased as ceiling_value.

4. **FLOOR()**
## Example:

```sql
SELECT FLOOR(9.75) AS floor_value;
```
## Explanation:

* FLOOR() function returns the largest integer value less than or equal to a number.
* In this example, 9.75 is rounded down to the nearest integer, resulting in 9.
* The result is aliased as floor_value.
* These examples demonstrate the basic usage of some mathematical functions in MySQL. You can use these functions within SELECT statements to perform calculations or manipulate numeric data as needed.



2. **Formatting Functions**

* **FORMAT()**: Formats a number with commas and a specified number of decimal places.
* **TRUNCATE()**: Truncates a number to a specified number of decimal places.
* **LPAD()**: Pads a string to a specified length with another string (useful for formatting numeric values).

1. **FORMAT()**
## Example:

```sql
SELECT FORMAT(1234567.89, 2);
```
## Explanation:

* FORMAT() function is used to format a numeric value with commas and a specified number of decimal places.
* In this example, 1234567.89 is the numeric value we want to format.
* 2 specifies the number of decimal places to include in the formatted output.

## Output:
1,234,567.89

2. **TRUNCATE()**
## Example:

```sql
SELECT TRUNCATE(123.456, 1);
```
## Explanation:

* TRUNCATE() function is used to truncate a number to a specified number of decimal places.
* In this example, 123.456 is the number we want to truncate.
* 1 specifies the number of decimal places to retain in the truncated output.

## Output:
123.4

3. **LPAD()**
## Example:

```sql
SELECT LPAD(42, 5, '0');
```
## Explanation:

* LPAD() function is used to pad a string to a specified length with another string.
* In this example, 42 is the original string we want to pad.
* 5 specifies the total length of the output string after padding.
* '0' specifies the string to use for padding.

## Output:
00042

3. **Aggregate Functions**

* **SUM()**: Calculates the sum of a set of values.
* **AVG()**: Calculates the average (mean) of a set of values.
* **MIN()**: Returns the minimum value in a set of values.
* **MAX()**: Returns the maximum value in a set of values.
* **COUNT()**: Returns the number of rows in a result set or the number of non-null values in a set of values.


## Example 1: Using SUM() Function
Suppose you have a table named sales that stores the sales amounts for different products:

| Product   | SalesAmount |
|-----------|-------------|
| Product A | 100         |
| Product B | 150         |
| Product A | 200         |
| Product C | 120         |

## Query: Calculate the total sales amount for all products using the SUM() function.

```sql
SELECT SUM(SalesAmount) AS TotalSales FROM sales;
```
## Explanation:

* **SUM(SalesAmount)**: This part of the query calculates the sum of the SalesAmount column for all rows in the sales table.
* **AS TotalSales**: This alias names the result of the calculation as TotalSales.
* **SELECT**: This clause retrieves the result of the calculation.

## Result:

### TotalSales
* 570
* The total sales amount across all products is 570.

## Example 2: Using AVG() Function
* Continuing with the sales table:

## Query: Calculate the average sales amount for all products using the AVG() function.

```sql
SELECT AVG(SalesAmount) AS AverageSales FROM sales;
```
## Explanation:

* **AVG(SalesAmount)**: This part of the query calculates the average of the SalesAmount column for all rows in the sales table.
* **AS AverageSales**: This alias names the result of the calculation as AverageSales.
* **SELECT**: This clause retrieves the result of the calculation.

## Result:

### AverageSales
* 142.5
* The average sales amount across all products is 142.5.

## Example 3: Using COUNT() Function
* Suppose you want to count the number of sales records in the sales table:

## Query: Count the number of sales records using the COUNT() function.

```sql
SELECT COUNT(*) AS TotalSalesCount FROM sales;
```
## Explanation:

* **COUNT(*)**: This part of the query counts the number of rows (sales records) in the sales table.
* **AS TotalSalesCount**: This alias names the result of the count as TotalSalesCount.
* **SELECT**: This clause retrieves the result of the count.

## Result:

* TotalSalesCount
* 4
* There are 4 sales records in the sales table.

These examples demonstrate how aggregate functions (SUM(), AVG(), COUNT()) can be used to perform calculations on data in MySQL tables and retrieve summary statistics.

4. **Conversion Functions**

* **CAST()**: Converts a value from one data type to another.
* **CONVERT()**: Converts a value from one character set to another or from one collation to another.

1. **CAST()**

## Example:

```sql
SELECT CAST('42' AS UNSIGNED) AS Number;
```
## Explanation:

* **CAST()**: This function converts a value from one data type to another.
* In this example, we're converting the string '42' to an unsigned integer using CAST().
* The result will be the number 42 without quotes, interpreted as an integer data type.

2. **CONVERT()**

## Example:

```sql
SELECT CONVERT('2024-05-10', DATE) AS Date;
```

## Explanation:

* **CONVERT()**: This function converts a value from one data type to another, or from one character set to another.
* In this example, we're converting a string '2024-05-10' to a DATE data type.
* The result will be the date '2024-05-10' in DATE format.

## Usage

Provide examples demonstrating the usage of each numeric function listed above. Include sample queries and their results to illustrate how each function works.

## Conclusion

This README covers the most commonly used numeric functions in MySQL. Understanding these functions will enable efficient manipulation and analysis of numeric data within MySQL databases.
