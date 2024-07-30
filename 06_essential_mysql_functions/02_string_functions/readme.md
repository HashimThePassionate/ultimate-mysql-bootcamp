
# MySQL String Functions

## Introduction

This README provides an overview of string functions available in MySQL. These functions allow for manipulation, extraction, and formatting of string data stored in MySQL databases.

## Function Categories
MySQL string functions can be broadly categorized into:

1. **Manipulation Functions**: Functions for modifying the content of strings.

***Search Functions***: Functions for searching within strings.
***Formatting Functions***: Functions for formatting strings.
***Information Functions***: Functions for obtaining information about strings.

## List of String Functions

1. **Manipulation Functions**

* ***CONCAT()***: Concatenates two or more strings together.
* ***SUBSTRING()***: Returns a substring of a string.
* ***REPLACE()***: Replaces occurrences of a substring within a string.
* ***UPPER()***: Converts a string to uppercase.
* ***LOWER()***: Converts a string to lowercase.
* ***TRIM()***: Removes leading and trailing spaces from a string.
* ***LENGTH()***: Returns the length of a string.
* ***LEFT()***: Returns the leftmost characters of a string.
* ***RIGHT()***: Returns the rightmost characters of a string.

1. **CONCAT()**
## Example:
```sql
SELECT 
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name, '  ', last_name) AS full_name,
    birth_date,
    phone,
    address,
    city,
    state,
    ABS(points) AS 'Points'
FROM
    customers
WHERE
    customer_id IN (2 , 5, 11);
```

2. **SUBSTRING()**
## Example:

```sql
SELECT SUBSTRING('MySQL is powerful', 1, 5) AS SubstringResult;
```
## Explanation:
* **SUBSTRING()**: This function returns a substring of a string.
* In this example, the substring starts at position 1 and is 5 characters long.
* The result will be the string "MySQL".

3. **REPLACE()**
## Example:

```sql
SELECT REPLACE('Hello World', 'World', 'Universe') AS ReplacedString;
```

## Explanation:
* **REPLACE()**: This function replaces occurrences of a substring within a string.
* In this example, 'World' is replaced with 'Universe' in the string 'Hello World'.
* The result will be the string "Hello Universe".

4. **UPPER() and LOWER()**
## Example:

```sql
SELECT UPPER('hello') AS UppercaseString, LOWER('WORLD') AS LowercaseString;
```

## Explanation:
* **UPPER()**: This function converts a string to uppercase.
* **LOWER()**: This function converts a string to lowercase.
* In this example, 'hello' is converted to uppercase and 'WORLD' is converted to lowercase.
* The result will be "HELLO" and "world" respectively.

5. **TRIM()**
## Example:

```sql
SELECT TRIM('   Hello   ') AS TrimmedString;
```

## Explanation:
* **TRIM()**: This function removes leading and trailing spaces from a string.
* In this example, leading and trailing spaces are removed from the string ' Hello '.
* The result will be the string "Hello".
* These examples demonstrate how manipulation functions like CONCAT(), SUBSTRING(), REPLACE(), UPPER(), LOWER(), and TRIM() can be used to modify string data in MySQL queries.

2. **Search Functions**

* ***LOCATE()***: Finds the position of a substring within a string.
* ***INSTR()***: Similar to LOCATE(), finds the position of a substring within a string.
* ***LIKE***: Performs pattern matching using wildcards (% and _).

3. **Formatting Functions**
* ***FORMAT()***: Formats a number with commas and a specified number of decimal places.
* ***CONCAT_WS()***: Concatenates strings with a specified separator.
* ***LPAD()***: Pads a string to a specified length with another string.
* ***RPAD()***: Pads a string to a specified length with another string.

4. **Information Functions**

* ***CHAR_LENGTH()***: Returns the number of characters in a string.
* ***ASCII()***: Returns the ASCII value of the leftmost character of a string.
* ***CHAR()***: Returns the character for a given ASCII value.
* ***REPEAT()***: Repeats a string a specified number of times.

1. **CHAR_LENGTH()**
## Example:
```sql
SELECT CHAR_LENGTH('Hello') AS Length;
```

## Explanation:
* **CHAR_LENGTH()**: This function returns the number of characters in a string.
* In this example, we're passing the string 'Hello' to CHAR_LENGTH().
* The result will be the length of the string 'Hello', which is 5.

2. **ASCII()**
## Example:
```sql
SELECT ASCII('A') AS AsciiValue;
```

## Explanation:
* **ASCII()**: This function returns the ASCII value of the leftmost character of a string.
* Here, we're passing the character 'A' to ASCII().
* The result will be the ASCII value of 'A', which is 65.

3. **CHAR()**
## Example:
```sql
SELECT CHAR(65) AS Character;
```

## Explanation:
* **CHAR()**: This function returns the character for a given ASCII value.
* In this example, we're passing the ASCII value 65 to CHAR().
* The result will be the character corresponding to ASCII value 65, which is 'A'.

4. **REPEAT()**
## Example:
```sql
SELECT REPEAT('=', 5) AS Separator;
```

## Explanation:
* **REPEAT()**: This function repeats a string a specified number of times.
* Here, we're repeating the string '=' five times using REPEAT().
* The result will be '=====', a string consisting of five '=' characters.
* These examples demonstrate how information functions like CHAR_LENGTH(), ASCII(), CHAR(), and REPEAT() can be used to obtain information about strings in MySQL queries.

## Usage
Provide examples demonstrating the usage of each string function listed above. Include sample queries and their results to illustrate how each function works.

## Conclusion
This README covers the most commonly used string functions in MySQL. Understanding these functions will enable efficient manipulation and analysis of string data within MySQL databases.
