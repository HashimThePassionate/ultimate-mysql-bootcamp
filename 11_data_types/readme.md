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
- Method 1
  ```sql
  UPDATE products
SET properties = 
'
{
	"dimension" : [1,2,3],
    "weight" : 10,
    "manufacturer":{
    "name":"Ahmed"
    }
}
'
WHERE product_id = 1 ;
     ```

- Method 2
```sql
UPDATE products
SET properties = JSON_OBJECT(
'weight',10,
'dimension',JSON_ARRAY(1,2,3),
'manufacturer',JSON_OBJECT('name','Abdullah')
)
WHERE product_id = 2;
```
#### Output
![Screenshot 2024-05-09 230414](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/9aa1f9bd-ee59-45a5-a140-a767f63576ff)

- Selection specific property
  ```sql
  SELECT 
product_id,
JSON_EXTRACT(properties,'$.weight')
FROM products
WHERE product_id IN (1,2) ;
    ```
#### Output
![Screenshot 2024-05-09 230717](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/2f515931-bc09-4e49-bf50-d5be7e1f2f7b)






