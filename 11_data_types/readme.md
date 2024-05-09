# MYSQL Datatypes

![Untitled](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/417e8018-83cf-4b91-aa2f-be516c119fa9)



# Introduction To MYSQL Datatypes

1. String datatypes
2. Integer datatypes 
3. Fixed point and Floating datatypes
4. Boolean datatypes
5. Enum and Set types datatypes -- we avoid to use this datatypes
6. Date and Time types datatypes
7. Blob datatypes --we also avoid to use binary data bcz its slow down our database backup
8. JSON datatypes

## 1. String datatypes:

- `CHAR(x)` -- fixed-length like abbreviation of state 'VA'

- `VARCHAR(x)` -- variable-length like storing usernames, passwords, email addresses and so on

- `Recommended`

- `VARCHAR(50)` for short strings like usernames and passwords

- `VARCHAR(255)` for medium-length strings like addresses

- `Maximum Length`

```sql
- CHAR(x)     --  
- VARCHAR(x)  -- max : 65,535 characters (64KB) 
- MEDIUMTEXT  -- max : 16MB              16,777,216    characters --JSON objects, CSV and short medium length book
- LONGTEXT    -- max : 4GB               4,294,967,296 characters Long Text books
- TINYTEXT    -- max : 255Bytes          255           characters
- Text        -- max : 65,535 characters (64KB)
```
- Mostly we use VARCHAR type, bcz it uses indexes to speedup queries.

####  Creating a table with CHAR(x) and VARCHAR(x) columns:
![Screenshot 2024-05-08 175954](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/3579d2ae-1379-4786-ab50-12557eac9a7b)

  

## 2. Integer datatypes:

- we store whole numbers that don't have decimal points.
- Maximum Length
```sql
-------------------------------------------------------------------------------------------------------------------------------------
|   Type	    Storage (Bytes)	    Minimum Value Signed	Minimum Value Unsigned	Maximum Value Signed	Maximum Value Unsigned  |
|   TINYINT 	1	                -128	                        0	                    127	                    255             |
|   SMALLINT	2	                -32768	                        0	                    32767	                65535           |
|   MEDIUMINT	3	                -8388608	                    0	                    8388607	                16777215        |
|   INT        	4	                -2147483648	                    0	                    2147483647	            4294967295      |
|   BIGINT  	8	                -2^63	                        0	                    2^63-1	                2^64-1          |
-------------------------------------------------------------------------------------------------------------------------------------
```
- ZEROFILL

```
INT(4) => 0001
```
#### Creating a table with integer columns without ZEROFILL:

![Screenshot 2024-05-08 183522](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/a0af8efe-fac5-4b97-a164-b118fa32386b)


## 3. Fixed point and Floating datatypes:

- DECIMAL(p,s) precision,scale --> DECIMAL(9,2) => 1234567.89
- DEC, NUMERIC, FIXED are exactly same as decimal
- FLOAT 4bytes, 8bytes, DOUBLE -- used for scientific calculation and are approximately values.




```sql 
CREATE TABLE numeric_types_table (
    decimal_column DECIMAL(9,2),
    dec_column DEC(9,2),
    numeric_column NUMERIC(9,2),
    fixed_column FIXED(9,2),
    float_column FLOAT,
    double_column DOUBLE);
```

### Output
![Screenshot 2024-05-08 184323](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/d944dc09-ef7e-4b4e-be75-b02f900d7703)


## 4. Boolean datatypes:

- BOOLEAN -- TRUE or FALSE
- BOOL -- 1 or 0.
  ```sql
  CREATE TABLE example_boolean_table (
    boolean_column BOOLEAN,
    bool_column BOOL);
  ```
### Output

![Screenshot 2024-05-08 184850](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/7a43e7b4-1d29-41de-adca-eac28732168f)


## 5. Date and Time types datatypes:

- DATE storing date without time component
- Time time for storing time value
- DATETIME 8bytes
- TIMESTAMP 4bytes (0 upto 2038) -- track of a row when inserted to last updated
- YEAR year for storing 4 digit year

  
  
  ```sql
  CREATE TABLE date_time_table (
    date_column DATE,
    time_column TIME,
    datetime_column DATETIME,
    timestamp_column TIMESTAMP,
    year_column YEAR);
  ```
  ### Output
![Screenshot 2024-05-08 195038](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/7a60fc11-4848-4524-9398-29589bb967cc)


- `date_column`: Used for storing dates without a time component.
- `time_column`: Used for storing time values.
- `datetime_column`: Used for storing date and time together.
- `timestamp_column`: Typically used to track the timestamp of when a row was inserted or last updated.
- `year_column`: Used for storing four-digit year values.


## 6. Json datatypes:
Certainly! JSON data types are commonly used to store structured data in a flexible format within a database. Here's an example of how JSON data types can be used in a table:

Suppose you have a table named products that stores information about various products, including their properties in JSON format.

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    properties JSON);
 ```
In this example:

- `product_id`: An integer column serving as the primary key for uniquely identifying each product.
- `name`: A VARCHAR column for storing the name of the product.
- `properties`: A JSON column for storing additional properties of the product in JSON format.
  
  You can then insert JSON data into the properties column for each product. Here's how you might insert data:
  ```sql
  INSERT INTO products (product_id, name, properties)
VALUES
    (1, 'Widget A', '{"color": "red", "size": "small", "weight": 10}'),
    (2, 'Widget B', '{"color": "blue", "size": "large", "weight": 20, "manufacturer": {"name": "Company X", "location": "City Y"}}');
    ```
#### Output
![Screenshot 2024-05-08 200327](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/bd9fcc7c-3c73-450a-ae22-d4bd0acb6825)


In this example:

- The first product (`Widget A`) has properties such as color, size, and weight specified directly in the JSON format.
- The second product (`Widget B`) has additional properties like manufacturer information nested within the JSON structure.

You can then query the data and access the JSON `properties` using various JSON functions provided by your database system. For example:
```sql
SELECT name, JSON_VALUE(properties, '$.color') AS color
FROM products;
```
#### Output
![Screenshot 2024-05-08 200401](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/de5b9962-7360-4cee-884b-f8b08ced4785)


This query retrieves the name of each product along with its color property from the JSON data stored in the `properties` column.

JSON data types provide flexibility in storing structured data within a relational database, allowing you to store and query semi-structured or hierarchical data effectively.







