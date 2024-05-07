# MYSQL Datatypes

![MySQL-Data-Type](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/663bff24-95d9-4105-b950-287f0919f4c4)

# Introduction To MYSQL Datatypes

1. String datatypes
2. Integer datatypes
3. Fixed point and Floating datatypes
4. Boolean datatypes
5. Enum and Set types datatypes -- we avoid to use this datatypes
6. Date and Time types datatypes
7. Blob datatypes --we also avoid to use binary data bcz its slow down our database backup
8. JSON datatypes

## 1. String Datatypes:

- CHAR(x) -- fixed-length like abbreviation of state 'VA'

- VARCHAR(x) -- variable-length like storing usernames, passwords, email addresses and so on

- Recommended

- VARCHAR(50) for short strings like usernames and passwords

- VARCHAR(255) for medium-length strings like addresses

- Maximum Length

```
- CHAR(x)     --  
- VARCHAR(x)  -- max : 65,535 characters (64KB) 
- MEDIUMTEXT  -- max : 16MB              16,777,216    characters --JSON objects, CSV and short medium length book
- LONGTEXT    -- max : 4GB               4,294,967,296 characters Long Text books
- TINYTEXT    -- max : 255Bytes          255           characters
- Text        -- max : 65,535 characters (64KB)
```
- Mostly we use VARCHAR type, bcz it uses indexes to speedup queries.

## 2. Integer Datatypes:

- we store whole numbers that don't have decimal points.
- Maximum Length
```
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

## 3. Fixed point and Floating Datatypes:

- DECIMAL(p,s) precision,scale --> DECIMAL(9,2) => 1234567.89
- DEC, NUMERIC, FIXED are exactly same as decimal
- FLOAT 4bytes, 8bytes, DOUBLE -- used for scientific calculation and are approximately values

## 4. Boolean datatypes:

- BOOLEAN -- TRUE or FALSE
- BOOL -- 1 or 0
## 5. Date and Time types datatypes:


- DATE storing date without time component
- Time time for storing time value
- DATETIME 8bytes
- TIMESTAMP 4bytes (0 upto 2038) -- track of a row when inserted to last updated
- YEAR year for storing 4 digit year

## 6. Json datatypes:


- Method 1

```
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

```
UPDATE products
SET properties = JSON_OBJECT(
'weight',10,
'dimension',JSON_ARRAY(1,2,3),
'manufacturer',JSON_OBJECT('name','Abdullah')
)
WHERE product_id = 2;
```

- Selection specific property

```
SELECT 
product_id,
JSON_EXTRACT(properties,'$.weight')
FROM products
WHERE product_id IN (1,2) ;
```

