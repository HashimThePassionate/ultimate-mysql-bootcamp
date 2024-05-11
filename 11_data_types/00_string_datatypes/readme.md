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

---MYSQL QUERIES

```sql
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
);
```





  
